using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                using (dbDataContext db = new dbDataContext())
                {
                    var posts = db.Posts.Where(n => n.Submitted == true).ToList();


                    loadScroller(posts);
                    loadTopDiv(posts.OrderByDescending(n => n.Id).FirstOrDefault());
                    loadTopVid(posts.Where(n => n.VideoPath != null && n.VideoPath != string.Empty).OrderByDescending(n => n.Id).FirstOrDefault());
                    loadSubNews(posts);
                    loadMoreLinks(posts);

                }

            }

        }

        private void loadTopVid(Post post)
        {
            if (post != null)
            {
                videoHeading.InnerText = post.HeadLine;
                videoCategory.InnerText = globalMethods.getCategoryName(post.Category);
                videoDate.InnerText = Convert.ToDateTime(post.NewsDate).ToString("dd MMMM yyyy");
                using (dbDataContext db = new dbDataContext())
                {
                    string para = "";
                    foreach (var p in db.Post_Paragraphs.Where(n => n.PostID == post.Id).Take(3))
                    {
                        para += p.Paragraphs;
                    }
                    videoContent.InnerHtml =  para + "</br>";
                }
                var splitedVideopath = post.VideoPath.Split('/');
                top_news_video.InnerHtml = "<iframe width='100%' height='300px' src='https://www.youtube.com/embed/" + splitedVideopath[splitedVideopath.Length - 1]
                      + "' frameborder='0' allow='accelerometer; autoplay; encrypted - media;" +
                        " gyroscope; picture -in-picture' allowfullscreen></iframe>";
                btntop2.Attributes["onclick"] = "window.open('News.aspx?ID=" + globalMethods.EncodeID(post.Id) + "')";



            }
        }

        private void loadMoreLinks(List<Post> posts)
        {
            var extraPosts = posts.OrderByDescending(n => n.Id).Skip(37).Take(50);
            var linkString = "";
            foreach (var p in extraPosts)
            {
                linkString += "<a href=\"News.aspx?ID=" + globalMethods.EncodeID(p.Id) + "\">" + p.HeadLine + "</a>";
            }
            moreLinks.InnerHtml = linkString;
        }

        private void loadSubNews(List<Post> posts)
        {

            using (dbDataContext db = new dbDataContext())
            {
                var selectedPost = posts.OrderByDescending(n => n.Id).Take(37).Skip(1);
                var innerHTML = "";
                foreach (var p in selectedPost)
                {
                    innerHTML += "<article class=\"subnews\"><div class=\"subnews-image\">" +
                                "<img src=\"defaults/default.png\" data-src=\"getImage.ashx?PostID=" + p.Id + "&Size=thumbnail\" alt =\"" + p.HeadLine + "\" style='min-height:300px;'>" +
                                 "<div class=\"info\"> <p>" + db.Post_Categories.Where(n => n.Id == p.Category).Select(n => n.Name).FirstOrDefault() + "</p>" +
                                    "<p>" + Convert.ToDateTime(p.NewsDate).ToString("dd MMMM yyyy") + "</p></div></div><div class=\"subnews-info\"><h1>" + p.HeadLine + "</h1>" +
                                    "<button class=\"blue-button\" onclick='window.open(\"News.aspx?ID=" + globalMethods.EncodeID(p.Id) + "\")'>Read More</button></div></article>";
                }
                subnews_container.InnerHtml = innerHTML;
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
                btntop.Attributes["onclick"] = "window.open('News.aspx?ID=" + globalMethods.EncodeID(post.Id) + "')";
                var paragraph = "";
                foreach (var p in db.Post_Paragraphs.Where(n => n.PostID == post.Id).Take(3))
                {
                    paragraph += p.Paragraphs + "</br>";
                }

                para.InnerHtml = paragraph;
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