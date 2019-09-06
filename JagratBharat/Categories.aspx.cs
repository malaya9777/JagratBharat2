using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (dbDataContext db = new dbDataContext())
                {
                    loadRoller(db.Post_Categories.ToList());
                }
            }
        }

        private void loadRoller(List<Post_Category> list)
        {
            var rollers = "";

            foreach (var r in list)
            {
                var cards = "";
                using (dbDataContext db = new dbDataContext())
                {
                    foreach (var c in db.Posts.Where(n => n.Category == r.Id && n.Submitted==true).OrderByDescending(n=>n.NewsDate).Take(10))
                    {
                        cards += "<div class='card' onclick='redirect(\"News.aspx?ID=" + globalMethods.EncodeID(c.Id) + "\");'>" +
                            "<img src='getImage.ashx?PostID=" + c.Id + "&Size=thumbnail' alt=''/>" +
                            "<h5>" + globalMethods.Truncate(c.HeadLine, 30) + "</h5>" +
                            "</div>";
                    }
                }

                rollers += " <h3>" + r.Name + "</h3> <div class='roller'>" + cards + "</div>";

            }
            container.InnerHtml = rollers;
        }


    }
}