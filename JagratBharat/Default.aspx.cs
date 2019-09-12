using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class index : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
                using (dbDataContext db = new dbDataContext())
                {
                    var posts = db.Posts.Where(n => n.Submitted == true).ToList();


                    loadScroller(posts);                   
                    loadTopDiv(posts.OrderByDescending(n=>n.Id).FirstOrDefault());
                   
                }

            }

        } 
        private void loadTopDiv(Post post)
        {
            List<Post_Category> categories;
            using (dbDataContext db = new dbDataContext())
            {
                categories = db.Post_Categories.ToList();
                topImgae.Src = "getImage.ashx?PostID=" + post.Id + "&Size=original";
                topHeadline.InnerText = post.HeadLine;
                topCategory.InnerText = categories.Where(n => n.Id == post.Category).Select(n => n.Name).FirstOrDefault();
                topDate.InnerText = Convert.ToDateTime(post.NewsDate).ToString("dd MMMM yyyy");
                btntop.Attributes["onclick"] = "window.location='News.aspx?ID=" + globalMethods.EncodeID(post.Id) + "'";
                var paragraph = "";
                foreach (var p in db.Post_Paragraphs.Where(n=>n.PostID == post.Id).Take(2))
                {
                    paragraph += p.Paragraphs;
                }

                para.InnerText = paragraph;
            }      

           
        }

        

       
        public string getPostfix(string num)
        {
            switch (num)
            {
                case "1":
                    return "st";
                case "2":
                    return "nd";
                case "3":
                    return "rd";
                default:
                    return "th";
            }
        }

        public void loadScroller(List<Post> posts)
        {

            string scrollerText = "";
            foreach (var i in posts.Where(n => n.SelectedScroller == true))
            {
                scrollerText += "<a href='News.aspx?ID=" + globalMethods.EncodeID(i.Id) + "' target='_blank'>" + i.HeadLine + "</a> &#8734; ";
            }
            marquee.InnerHtml = scrollerText;

        }
    }
}