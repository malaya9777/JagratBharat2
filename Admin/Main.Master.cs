using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace Admin
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            loadUserInfo();
        }

        private void loadUserInfo()
        {
            if (Session["LoginID"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                userName.Text = GlobalMethods.getUserName(Convert.ToInt32(Session["LoginId"])).ToUpper();                
            }
        }
    }
}