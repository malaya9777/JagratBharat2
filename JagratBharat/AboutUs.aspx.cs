using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl add_top = (HtmlGenericControl)Page.Master.FindControl("advertimement_top");
            HtmlGenericControl add_bottom = (HtmlGenericControl)Page.Master.FindControl("advertisement_bottom");

            add_top.Visible = false;
            add_bottom.Visible = false;
            
        }
    }
}