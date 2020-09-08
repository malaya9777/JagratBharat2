using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JagratBharat
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               using(dbDataContext db = new dbDataContext())
                {
                    var categories = db.Post_Categories.ToList();
                    loadCategory(categories);
                    loadAdvertisement();
                }
            }
        }

        private void loadAdvertisement()
        {
            using(dbDataContext db = new dbDataContext())
            {
                string htmlData = "";
                foreach(var ad in db.Advertisements.Where(n=> n.Status==true).OrderByDescending(n => n.Id).Take(4))
                {
                    htmlData += $"<div class='advertisement' onclick='windown.location=\"tel:{ad.PhoneNumber}\"' style='background-image:url({ad.ThumbnailPath});'><a href='tel:{ad.PhoneNumber}' class='callNow'>Call Now</a></div>";
                }
                advertimement_top.InnerHtml = htmlData;
                advertisement_bottom.InnerHtml = htmlData;
            }
           
        }

        private void loadCategory(List<Post_Category> categories)
        {

            string listElement = "";
            foreach (var i in categories.Take(5))
            {
                listElement += "<li><a href='CategoryWiseNews.aspx?categoryID=" + globalMethods.EncodeID(i.Id) + "'>" + i.Name + " </a></li>";
            }
            listElement+= "<li><a href='#' id='moreCategory'>More <i class=\"fa fa-sort-down\"></i></a></li>";
            category_list.InnerHtml = listElement;
            loadRestCategory(categories);

        }

        private void loadRestCategory(List<Post_Category> categories)
        {
            string listElement = "";
            foreach (var i in categories.Skip(5))
            {
                listElement += "<a href='CategoryWiseNews.aspx?categoryID=" + globalMethods.EncodeID(i.Id) + "'>" + i.Name + " </a></li>";
            }           
            moreCategoryContainer.InnerHtml = listElement;
        }
    }
}