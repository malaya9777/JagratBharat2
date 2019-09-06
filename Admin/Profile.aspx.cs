using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Profile : System.Web.UI.Page
    {
        DataDataContext db = new DataDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int loginID = Convert.ToInt32(Session["LoginID"]);
                loadProfileInformation(loginID);
                loadGridview();
                checkPrevilages(loginID);
            }
        }

        private void checkPrevilages(int loginID)
        {
            int? role = GlobalMethods.getUserRole(loginID);
            if (role == 1)
            {
                notAllowed.Visible = false;
            }
            else
            {
                grdUsers.Visible = false;
            }
        }

        private void loadGridview()
        {
            grdUsers.ShowHeader = true;
            grdUsers.EmptyDataText = "No Request received";
            var user = db.Users.Where(n => n.Reset_Request == true).Select(n => new { n.Id, n.Name, Role = n.Role == 1 ? "Admin" : "User" });
            grdUsers.DataSource = user;
            grdUsers.DataBind();
            
        }

        private void loadProfileInformation(int v)
        {
            var user = db.Users.Where(n => n.Id == v).SingleOrDefault();
            userName.InnerText = user.Name;
            role.InnerText = user.Role == 1 ? "Admin" : "User";
            email.InnerText = user.Email;
            mobile.InnerText = user.Mobile;
            createdOn.InnerText = Convert.ToDateTime(user.CreatedOn).ToString("dd-MMM-yyyy");
            createdBy.InnerText = GlobalMethods.getUserName(user.Id);

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            user_p.InnerText = "UserName : " + GlobalMethods.getUserName(Convert.ToInt32(Session["LoginID"]));
            mpe1.Show();
        }

        private void ResetPassword(int userID, string newPassword)
        {
            var hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(newPassword, "SHA1");
            var user = db.Users.Where(n => n.Id == userID).SingleOrDefault();
            if (user != null)
            {
                user.LastPassword = user.Password;
                user.Password = hashedPassword;
                user.Reset_Request = false;
                db.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Success", "alert('Password successfully changed for user : "+user.Name+"');", true);
            }
            else
            {
                
            }
            mpe1.Hide();


        }
        protected void btnChange_Click(object sender, EventArgs e)
        {
            int UserID;
            if (Session["SelectedUser"] == null)
            {
                UserID = Convert.ToInt32(Session["LoginID"]);

            }
            else
            {
                UserID = Convert.ToInt32(Session["SelectedUser"]);
                Session.Remove("SelectedUser");
            }
            ResetPassword(UserID, txtNewPassword.Text);
            loadGridview();

        }

        protected void btnCancle_Click(object sender, EventArgs e)
        {
            mpe1.Hide();
        }

        protected void grdUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Reset")
            {
                int userID = Convert.ToInt32(e.CommandArgument);
                user_p.InnerText = GlobalMethods.getUserName(userID);
                Session["SelectedUser"] = userID;
                mpe1.Show();

            }
        }
    }
}