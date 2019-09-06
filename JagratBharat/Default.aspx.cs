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
                setDateTime();
                using (dbDataContext db = new dbDataContext())
                {
                    var categories = db.Post_Categories.ToList();
                    var posts = db.Posts.Where(n => n.Submitted == true).ToList();


                    loadScroller(posts);
                    loadCategory(categories);
                    loadCards(posts);
                    loadRecentVideo(posts);
                    loadHoroscope();
                }

            }

        }

        private void loadHoroscope()
        {
            using (dbDataContext db = new dbDataContext())
            {
                var horosocpe = db.Zodiacs.Select(n => new
                {
                    n.Id,
                    zodiac = n.Zodiac_English + "(" + n.Zodiac_Odia + ")",
                    hs = db.Horoscopes.Where(m => m.Zodiac_ID == n.Id && m.Date == DateTime.Now.Date).Select(o => o.Horoscope_English).FirstOrDefault()
                }).ToList();
                string empty = "";
                foreach (var h in horosocpe)
                {
                    empty += "<li class='zodiac' onclick='window.open('Zodiac.aspx?h=" + h.zodiac + "')'><p>" + h.zodiac + "</p><span class='tooltipText'>" + h.hs + "</span></li>";
                }
                rashifal.InnerHtml = empty;
            }

        }

        private void loadRecentVideo(List<Post> posts)
        {
            var latestVieo = posts.OrderByDescending(n => n.Id).Select(n => n.VideoPath);
            string[] splitedVideopath = { };
            foreach (var v in latestVieo)
            {
                if (v != null && v != "")
                {
                    splitedVideopath = v.Split('/');
                    break;
                }
            }

            videoFrame.InnerHtml = "<iframe width='100%' height='140px' src='https://www.youtube.com/embed/" + splitedVideopath[splitedVideopath.Length - 1]
                      + "' frameborder='0' allow='accelerometer; autoplay; encrypted - media;" +
                        " gyroscope; picture -in-picture' allowfullscreen></iframe>";
        }

        private void loadCards(List<Post> posts)
        {
            var cardsInfo = posts.OrderByDescending(n => n.Id).Take(12);
            string infoString = "";
            foreach (var c in cardsInfo)
            {             

                infoString += " <a href='News.aspx?ID=" + globalMethods.EncodeID(c.Id) + "' target='_blank' class='card_container'> <div class='card' style='background: linear-gradient(rgba(0,0,0,.6),rgba(0,0,0,.1)),border-box,url(getImage.ashx?PostID=" + c.Id +"&Size=thumbnail), no-repeat, center; overflow: hidden;'>" +
                    " <span class='catSpan'>" + globalMethods.getCategoryName(c.Category) + "</span>" +
                    "<div class='cardHeadline'>" +globalMethods.Truncate(c.HeadLine,30) + "</div></div></a>";

            }
            cards.InnerHtml = infoString;
        }

        private void loadCategory(List<Post_Category> categories)
        {

            string listElement = "";
            foreach (var i in categories)
            {
                listElement += "<li><a href='CategoryWiseNews.aspx?categoryID=" + globalMethods.EncodeID(i.Id) + "'>" + i.Name + " </a></li>";
            }
            categoryList.InnerHtml = listElement;

        }

        public void setDateTime()
        {
            txtDate.InnerText = DateTime.Now.Day.ToString();
            txtMonthYear.InnerText = getPostfix(txtDate.InnerText) + " " + DateTime.Now.Date.ToString("MMMM yyyy");
            txtEvent.InnerText = DateTime.Now.Date.ToString("dddd");
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
            para.InnerHtml = scrollerText;

        }
    }
}