using System;
using System.Web.Security;
using System.Linq;

namespace Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!(Session["LoginId"] == null))
                    FormsAuthentication.RedirectFromLoginPage(Session["LoginId"].ToString(), chkRememberMe.Checked);

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var userName = txtUserName.Text;
            var password = txtPassword.Text;
            if (!string.IsNullOrEmpty(userName) && !string.IsNullOrEmpty(password))
            {
                if (AuthorisedUser(userName, password))
                {
                    
                    FormsAuthentication.RedirectFromLoginPage(userName, chkRememberMe.Checked);

                }
                else
                {
                   
                }
            }
        }
        private bool AuthorisedUser(string userName, string password)
        {
            var ensdPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            using (DataDataContext db = new DataDataContext())
            {
                var user = db.Users.Where(n => n.Name == userName && n.Password == ensdPassword && n.Active == true).SingleOrDefault();
                if (user != null)
                {
                    Session["LoginId"] = user.Id;
                    return true;
                }
                else
                {
                    return false;
                }
            }
                
        }

        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {
            using(DataDataContext db = new DataDataContext())
            {
                var user = db.Users.Where(n => n.Name == txtUserName.Text).SingleOrDefault();
                if (user == null)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "User", "alert('Username incorrect!')", true);
                }
                else
                {
                    user.Reset_Request = true;
                    db.SubmitChanges();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "User", "alert('Request to admin have been sent!')", true);
                }
            }
        }
    }
}