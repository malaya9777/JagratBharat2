using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class SearchResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string serachTerm = Request.QueryString["search"];
                FindResult(serachTerm);
                searchTerm.InnerText = "Showing Results for \"" + serachTerm + "\"";
            }
        }
        private void FindResult(string searchTerm)
        {
            var posts = new List<Post>();
            using (dbDataContext db = new dbDataContext())
            {
                var splitedSearch = searchTerm.Split(' ');
                foreach (var s in splitedSearch)
                {
                    if (s != string.Empty)
                    {
                        posts.AddRange(db.Posts.Where(n => n.HeadLine.Contains(s)).ToList());
                    }
                }
                loadResults(posts);
            }
        }

        private void loadResults(List<Post> posts)
        {
            string empty = "";
            foreach (var s in posts.Distinct().OrderByDescending(n => n.NewsDate).Take(10))
            {
                empty += "<div class='result'><a href=News.aspx?ID=" + globalMethods.EncodeID(s.Id) + "><div class='img' style=\"background-image:url('getImage.ashx?PostID=" + s.Id + "&Size=thumbnail')\"> </div> <h5>" + s.HeadLine + "</h5></a></div>";

            }
            results.InnerHtml = empty == string.Empty ? "<div class='result'><a href='#'>No results found!<div class='img'></div><h5></h5></a></div>" : empty;
        }
    }
}