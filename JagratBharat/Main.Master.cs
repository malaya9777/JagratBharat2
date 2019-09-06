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
                    var categories = db.Post_Categories.Take(4).ToList();
                    loadCategory(categories);
                }
            }
        }
        private void loadCategory(List<Post_Category> categories)
        {

            string listElement = "";
            foreach (var i in categories)
            {
                listElement += "<li><a href='CategoryWiseNews.aspx?categoryID=" + globalMethods.EncodeID(i.Id) + "'>" + i.Name + " </a></li>";
            }
            listElement+= "<li><a href='#'>More <i class=\"fa fa-sort-down\"></i></a></li>";
            category_list.InnerHtml = listElement;

        }
    }
}