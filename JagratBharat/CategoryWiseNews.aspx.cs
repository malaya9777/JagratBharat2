using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class CategoryWiseNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    var query = Request.QueryString["categoryID"];
                    var catID = Convert.ToInt32(globalMethods.DecodeID(query));
                    loadCards(catID);
                }
                catch (Exception)
                {

                    Response.Redirect("Default.aspx");
                }
            }
        }

        private void loadCards(int catID)
        {
           using(dbDataContext db = new dbDataContext())
            {
                var posts = db.Posts.Where(n => n.Category == catID && n.Submitted == true).OrderByDescending(n => n.NewsDate).Take(18);
                var cards = "";
                foreach(var p in posts)
                {
                    cards+= "<div class='card' onclick='redirect(\"News.aspx?ID=" + globalMethods.EncodeID(p.Id) + "\");'>" +
                            "<img src='getImage.ashx?PostID=" + p.Id + "&Size=thumbnail' alt=''/>" +
                            "<h5>" + globalMethods.Truncate(p.HeadLine, 30) + "</h5>" +
                            "</div>";
                }
                heading.InnerText = db.Categories.Where(n => n.Id == catID).Select(n => n.Name).SingleOrDefault();
                Page.Title = heading.InnerText + " | Jagrat Bharat News";
                mainContent.InnerHtml = cards;
            }
        }
    }
}