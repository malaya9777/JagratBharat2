using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DataDataContext db = new DataDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadCategoryGrid();
                loadUserDetails();
                loadUserList();
                loadLatesNews();
                loadScroller();
                loadHoroscope();
            }
        }

        private void loadHoroscope()
        {
            var horosocpe = db.Zodiacs.Select(n => new
            {
                n.Id,
                zodiac = n.Zodiac_English + "(" + n.Zodiac_Odia + ")",
                hs = db.Horoscopes.Where(m => m.Zodiac_ID == n.Id && m.Date == DateTime.Now.Date).Select(o => o.Horoscope_English).FirstOrDefault()
            }).ToList();
            grdHoroscope.DataSource = horosocpe;
            grdHoroscope.DataBind();
        }

        private void loadScroller()
        {
            var news = db.Posts.Where(n=>n.Submitted==true).OrderByDescending(n => n.PostedOn).Select(n => new
            {
                n.Id,
                headline = GlobalMethods.Truncate(n.HeadLine, 20),
                css = n.SelectedScroller==true?"checked":"unchecked"
            });
            grdScroller.DataSource = news;
            grdScroller.DataBind();
            var selectedNews = db.Posts.Where(n => n.SelectedScroller == true).Count();
            var totalNews = news.Count();
            selected.InnerText ="Selected : "+ selectedNews + "/" + totalNews;
        }

        private void loadLatesNews()
        {
            var latestNews = db.Posts.OrderByDescending(n => n.PostedOn).Select(n => new
            {
                headLine = GlobalMethods.Truncate(n.HeadLine, 20),
                link = "preview.aspx?ID=" + n.Id,
                posted = n.Submitted
            }).ToList();
            grdNews.DataSource = latestNews;
            grdNews.DataBind();
        }

        private void loadUserList()
        {
            var userList = db.Users.Select(n => new
            {
                usreName = n.Name,
                createdOn = n.CreatedOn,
                userRole = n.Role==1?"Admin":"User",
                active = n.Active
            }).ToList();
            grdUserList.DataSource = userList;
            grdUserList.DataBind();
        }

        private void loadUserDetails()
        {
            var user = db.Users;
            boxActivated.InnerText = db.Users.Where(n => n.Active == true).Count() + " Users activated";
            boxDeactivated.InnerText = db.Users.Where(n => n.Active == false).Count() + " Users deactivated";
            boxTotal.InnerText = " Total users " + db.Users.Count();
        }

        private void loadCategoryGrid()
        {
            var categories = db.Post_Categories.Select(n => new { n.Id, n.Name }).ToList();
            if (categories.Count > 0)
            {
                grdCategories.DataSource = categories;
            }
            else
            {
                var emptyCategory = new List<dynamic> { new { Id = 0, Name = "" } };
                grdCategories.DataSource = emptyCategory;
            }
            grdCategories.DataBind();
        }

        protected void grdCategories_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdCategories.EditIndex = e.NewEditIndex;
            loadCategoryGrid();
        }

        protected void grdCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = grdCategories.Rows[e.RowIndex];

            int Id = Convert.ToInt32((row.Cells[1].Text));
            string Name = ((TextBox)row.Cells[2].Controls[0]).Text;
            var category = db.Post_Categories.Where(n => n.Id == Id).SingleOrDefault();
            category.Name = Name;
            db.SubmitChanges();
            grdCategories.EditIndex = -1;
            loadCategoryGrid();

        }

        protected void grdCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdCategories.EditIndex = -1;
            loadCategoryGrid();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var category = new Post_Category();
            category.Name = txtCategory.Text;
            db.Post_Categories.InsertOnSubmit(category);
            db.SubmitChanges();
            loadCategoryGrid();
        }     

        protected void grdScroller_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int postID = Convert.ToInt32(e.CommandArgument);
            var selectedPost = db.Posts.Where(n => n.Id == postID).SingleOrDefault();
            if(selectedPost.SelectedScroller==null || selectedPost.SelectedScroller == false)
            {
                selectedPost.SelectedScroller = true;
                db.SubmitChanges();
            }
            else
            {
                selectedPost.SelectedScroller = false;
                db.SubmitChanges();
            }
            loadScroller();
        }

        protected void grdNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdNews.PageIndex = e.NewPageIndex;
            loadLatesNews();
        }

        protected void grdScroller_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdScroller.PageIndex = e.NewPageIndex;
            loadScroller();
        }
    }
}