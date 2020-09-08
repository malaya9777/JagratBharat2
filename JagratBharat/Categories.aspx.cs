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
        dbDataContext db = new dbDataContext();
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
                if (r.Name!="")
                {
                    var postCount = db.Posts.Where(n => n.Category == r.Id && n.Submitted == true).Count();

                    if (postCount>0)
                    {
                        var cards = "";

                        foreach (var c in db.Posts.Where(n => n.Category == r.Id && n.Submitted == true).OrderByDescending(n => n.NewsDate).Take(10))
                        {
                            cards += "<div class='card' onclick='redirect(\"News.aspx?ID=" + globalMethods.EncodeID(c.Id) + "\");'>" +
                                "<img src=\"defaults/default.png\" data-src='" + c.ThumbnailPath + "' alt=''/>" +
                                "<h5>" + globalMethods.Truncate(c.HeadLine, 30) + "</h5>" +
                                "</div>";
                        }


                        rollers += " <h3>" + r.Name + "</h3> <div class='roller'>" + cards + "</div>";  
                    }
                }

            }
            container.InnerHtml = rollers;
        }


    }
}