using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class News : System.Web.UI.Page
    {
        dbDataContext db = new dbDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var URLRequest = Request.QueryString["ID"];
            if (URLRequest != null)
            {
                var ID = globalMethods.DecodeID(URLRequest);

                if (!IsPostBack)
                {
                    loadData(Convert.ToInt32(ID));

                }
            }
            else
            {
                Response.Redirect("Index.aspx");
            }


        }

        private void loadData(int ID)
        {
            var post = db.Posts.Where(n => n.Id == ID).FirstOrDefault();
            var paragraphs = db.Post_Paragraphs.Where(n => n.PostID == post.Id).ToList();
            if (post != null)
            {
                Page.Title = post.HeadLine +" | Jagrat Bharat News";
                PostHeader.InnerText = post.HeadLine;
                category.InnerText = globalMethods.getCategoryName(post.Category);
                info.InnerText = post.NewsDate.Value.ToLongDateString();
                loadImageFromPath("getImage.ashx?PostID=" + post.Id + "&Size=orginal");
                loadParagraph(paragraphs, loadVideo(post.VideoPath));
                loadCards(post.Category, post.Id);
                loadMetas(post);
                loadShareButtons(post);
            }
            else
            {
                Response.Redirect("Index.aspx");
            }

        }

        private void loadShareButtons(Post post)
        {
            whatsaapbutton.HRef = "whatsapp://send?text=" + post.HeadLine.Replace(' ', '+') + " " + new Uri(Page.Request.Url, Request.RawUrl);
            twitterbutton.HRef = "https://twitter.com/intent/tweet?text=" + post.HeadLine.Replace(' ', '+') + " " + new Uri(Page.Request.Url, Request.RawUrl);
        }

        private void loadMetas(Post post)
        {
            og_site_name.Attributes["content"] = "Jagrat Bharat";
            og_title.Attributes["content"] = post.HeadLine;
            og_description.Attributes["content"] = db.Post_Paragraphs.Where(n => n.PostID == post.Id).Select(n => n.Paragraphs).FirstOrDefault();

            var path = new Uri(Page.Request.Url, "getImage.ashx");
            var shareURL = new Uri(Page.Request.Url, Request.RawUrl).ToString();
            og_image.Attributes["content"] = path + "?PostID=" + post.Id + "&Size=thumbnail";
            og_url.Attributes["content"] = shareURL;



        }

        private void loadCards(int? category, int? postID)
        {
            using (dbDataContext db = new dbDataContext())
            {
                var cardsInfo = db.Posts.Where(n => n.Category == category && n.Id != postID).OrderByDescending(n => n.Id).Take(12);
                string infoString = "";
                foreach (var c in cardsInfo)
                {
                    infoString += "<article class=\"subnews\"><div class=\"subnews-image\">" +
                                "<img data-src=\"getImage.ashx?PostID=" + c.Id + "&Size=thumbnail\" alt =\"" + c.HeadLine + "\" style='min-height:300px;'>" +
                                 "<div class=\"info\"> <p>" + db.Post_Categories.Where(n => n.Id == c.Category).Select(n => n.Name).FirstOrDefault() + "</p>" +
                                    "<p>" + Convert.ToDateTime(c.NewsDate).ToString("dd MMMM yyyy") + "</p></div></div><div class=\"subnews-info\"><h1>" + c.HeadLine + "</h1>" +
                                    "<button class=\"blue-button\" onclick='window.open(\"News.aspx?ID=" + globalMethods.EncodeID(c.Id) + "\")'>Read More</button></div></article>";
                }
                subnews_container.InnerHtml = infoString;
            }
        }

        private void loadParagraph(List<Post_Paragraph> paragraphs, string videoFrame)
        {
            foreach (var paragraph in paragraphs)
            {
                PostContent.InnerHtml += "<p class='justified'>" + paragraph.Paragraphs + "</p>";
                if (paragraphs[paragraphs.Count() - 1] == paragraph)
                {
                    PostContent.InnerHtml += videoFrame;
                }

            }
        }

        private string loadVideo(string videoPath)
        {
            if (videoPath != "")
            {
                string[] splitedVideopath = videoPath.Split('/');
                return "<iframe width='100%' height='450vh' src='https://www.youtube.com/embed/" + splitedVideopath[splitedVideopath.Length - 1]
                      + "' frameborder='0' allow='accelerometer; autoplay; encrypted - media;" +
                        " gyroscope; picture -in-picture' allowfullscreen></iframe>";

            }
            return "";
        }

        private void loadImageFromPath(string imagePath)
        {

            headImage.Src = imagePath;
            //heading.Style.Add("background", "linear-gradient(rgba(0,0,0,.1),rgba(0,0,0,.6)),border-box,url(" + imagePath + "), no-repeat, center");
            //heading.Style.Add(" background-size", "100%");
        }
    }
}