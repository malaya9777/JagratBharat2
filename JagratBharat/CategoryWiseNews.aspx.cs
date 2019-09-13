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
            using (dbDataContext db = new dbDataContext())
            {
                var posts = db.Posts.Where(n => n.Category == catID && n.Submitted == true).OrderByDescending(n => n.NewsDate);
                var cards = "";
                foreach (var c in posts)
                {
                    cards += "<article class=\"subnews\"><div class=\"subnews-image\">" +
                                "<img data-src=\"getImage.ashx?PostID=" + c.Id + "&Size=thumbnail\" alt =\"" + c.HeadLine + "\" style='min-height:300px;'>" +
                                 "<div class=\"info\"> <p>" + db.Post_Categories.Where(n => n.Id == c.Category).Select(n => n.Name).FirstOrDefault() + "</p>" +
                                    "<p>" + Convert.ToDateTime(c.NewsDate).ToString("dd MMMM yyyy") + "</p></div></div><div class=\"subnews-info\"><h1>" + c.HeadLine + "</h1>" +
                                    "<button class=\"blue-button\" onclick='window.open(\"News.aspx?ID=" + globalMethods.EncodeID(c.Id) + "\")'>Read More</button></div></article>";

                }
                heading.InnerText = db.Post_Categories.Where(n => n.Id == catID).Select(n => n.Name).SingleOrDefault();
                Page.Title = heading.InnerText + " | Jagrat Bharat News";
                subnews_container.InnerHtml = cards;
            }
        }
    }
}