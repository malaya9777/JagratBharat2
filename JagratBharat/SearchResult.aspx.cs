using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class SearchResult : System.Web.UI.Page
    {
        string ImageHost = ConfigurationManager.AppSettings["ImageHost"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string searchTerm = Request.QueryString["search"];
                if(searchTerm != "" && searchTerm != null)
                {
                    FindResult(searchTerm);
                    query.InnerText = "Showing Results for \"" + searchTerm.Replace("+", " ") + "\"";
                }
                else
                {
                    Response.Redirect("/");
                }
                
            }
        }
        private void FindResult(string searchTerm)
        {
            var posts = new List<Post>();
            using (dbDataContext db = new dbDataContext())
            {
                var splitedSearch = searchTerm.Split('+');
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
                empty += "<img class='img' data-src='"+ImageHost+s.ThumbnailPath+ "' onclick='window.location=\"News.aspx?ID=" + globalMethods.EncodeID(s.Id) + "\"'><h3 onclick='window.location=\"News.aspx?ID=" + globalMethods.EncodeID(s.Id) + "\"'>" + s.HeadLine + "</h3>";

            }
            results.InnerHtml = empty == string.Empty ? "<div class='result'><a href='#'>No results found!<div class='img'></div><h5></h5></a></div>" : empty;
        }
    }
}