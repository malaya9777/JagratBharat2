using System;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class ManageUser : System.Web.UI.Page
    {
        DataDataContext db = new DataDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                setDefaults();
                loadDropdown();
                loadGrid();
                checkPreviliage(GlobalMethods.getUserRole(Convert.ToInt32(Session["LoginID"])));

            }
        }

        private void checkPreviliage(int? v)
        {
            if (v == 1)
            {
                notAllowed.Visible = false;
            }
            else
            {
                mainContainer.Visible = false;
            }
        }

        private void setDefaults()
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            ddlRole.SelectedIndex = 0;
            chkActive.Checked = true;
        }

        private void loadDropdown()
        {
            var roles = db.Roles.Select(n => new { Text = n.Name, Value = n.Id }).ToList();
            ddlRole.DataSource = roles;
            ddlRole.DataTextField = "Text";
            ddlRole.DataValueField = "Value";
            ddlRole.DataBind();
            ddlRole.Items.Insert(0, "--Select Role--");
        }
        private void loadGrid()
        {
            var users = db.Users.Where(n => n.Id != GlobalMethods.getUserID(Session["LoginId"].ToString())).Select(n => new
            {
                n.Id,
                n.Active,
                userName = n.Name,
                createdBy = GlobalMethods.getUserName(n.CreatedBy),
                createdOn = string.Format("{0:dd-MM-yy h:mm:ss tt}", n.CreatedOn)
            }); ;

            grdUserList.DataSource = users;
            grdUserList.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!GlobalMethods.checkUserExists(txtUserName.Text))
            {
                User new_user = new User();
                new_user.Name = txtUserName.Text;
                new_user.Password = new_user.LastPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
                new_user.Mobile = txtMobile.Text;
                new_user.Email = txtEmail.Text;
                new_user.Role = ddlRole.SelectedIndex;
                new_user.CreatedOn = DateTime.Now;
                new_user.CreatedBy = GlobalMethods.getUserID(Session["LoginId"].ToString());
                new_user.Active = chkActive.Checked;
                db.Users.InsertOnSubmit(new_user);
                db.SubmitChanges();
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "Success", "alert('User " + txtUserName.Text + " successfully created!')", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "Failuer", "alert('User " + txtUserName.Text + " already exists!')", true);
            }
            setDefaults();


        }

        protected void grdUserList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var Id = Convert.ToInt32(e.CommandArgument);
            bool status;
            if (e.CommandName == "Deactivate")
            {
                status = false;
            }
            else
            {
                status = true;
            }
            var user = db.Users.Where(n => n.Id == Id).SingleOrDefault();
            user.Active = status;
            db.SubmitChanges();
            loadGrid();
        }

        protected void grdUserList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var data = (TextBox)e.Row.FindControl("hdn");
                var deactivate = (Button)e.Row.FindControl("btnDeactivate");
                var activate = (Button)e.Row.FindControl("btnActivate");
                if (Convert.ToBoolean(data.Text))
                {
                    deactivate.Visible = true;
                    activate.Visible = false;
                }
                else
                {
                    deactivate.Visible = false;
                    activate.Visible = true;
                }


            }
        }
    }
}