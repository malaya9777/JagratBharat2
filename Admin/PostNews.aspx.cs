using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class PostNews : System.Web.UI.Page
    {
        DataDataContext db = new DataDataContext();
        // Initial Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            imgPreview.Visible = false;
            if (!IsPostBack)
            {
                Session.Remove("PostID");
                loadCategories();
                loadPostGrid();
                checkPreviliage(GlobalMethods.getUserRole(Convert.ToInt32(Session["LoginID"])));
            }
        }

        private void checkPreviliage(int? v)
        {
            if (v == 1)
            {
                notAllowed.Visible = false;
            }
            else
            {
                grdPost.Visible = false;
            }
        }

        // Load Post GridView
        private void loadPostGrid()
        {
            var posts = db.Posts.OrderByDescending(n=>n.PostedOn).Select(n => new
            {
                n.Id,
                ThumbnailImageURL = "ImageHandler.ashx?PostID=" + n.Id + "&Size=thumbnail",
                OriginalImageURL = "ImageHandler.ashx?PostID=" + n.Id + "&Size=original",
                PreviewURL = "Preview.aspx?ID=" + n.Id,
                SendButtonCss = n.Submitted == true ? "btn green" : "btn orange",
                SendButtonTxt = n.Submitted == true ? "Depublish" : "Publish",
                HeadLine = GlobalMethods.Truncate(n.HeadLine, 15),
                n.Submitted
            }).ToList();

            grdPost.DataSource = posts;
            grdPost.DataBind();

        }
        // Load Categories to dropdown
        private void loadCategories()
        {
            var categories = db.Post_Categories.ToList();
            ddlCategory.DataSource = categories;
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataValueField = "Id";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("Select Category", "0"));
        }

        // Upload each Paragraphs into new Records 
        private void uploadParagraphs(string[] msgs, int postID)
        {
            foreach (var msg in msgs)
            {
                if (msg != string.Empty)
                {
                    Post_Paragraph p = new Post_Paragraph();
                    p.PostID = postID;
                    p.Paragraphs = msg;
                    db.Post_Paragraphs.InsertOnSubmit(p);
                    db.SubmitChanges();
                }
            }
        }

        // Split text into String Array
        public string[] splitText(string body)
        {
            var newText = body.Replace("\n", "`");
            return newText.Split('`');
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Post post;
            bool recordExists;
            if (Session["PostID"] != null)
            {
                int ID = Convert.ToInt32(Session["PostID"]);
                post = db.Posts.Where(n => n.Id == ID).SingleOrDefault();
                recordExists = true;
            }
            else
            {
                post = new Post();
                recordExists = false;
                //To Load the previous status

            }
            post.HeadLine = txtHeadline.Text;
            post.Category = Convert.ToInt32(ddlCategory.SelectedValue);
            post.NewsDate = Convert.ToDateTime(txtNewsDate.Text);
            post.PostedOn = DateTime.Now;
            post.PostedBy = Convert.ToInt32(Session["LoginId"]);
            if (fImage.HasFile)
            {
                System.Drawing.Image m = GlobalMethods.reduceImageSize(GlobalMethods.BinaryToImage(fImage.FileBytes));
                MemoryStream ms = new MemoryStream();
                m.Save(ms, ImageFormat.Jpeg);
                post.Image = ms.ToArray();
            }
            post.VideoPath = videoEmbed.Text;
            if (!recordExists)
            {
                post.Submitted = false;
                db.Posts.InsertOnSubmit(post);
                db.SubmitChanges();
                var postID = db.Posts.OrderByDescending(n => n.Id).Select(n => n.Id).OrderByDescending(n => n).FirstOrDefault();

                //Upload splited paragraph
                uploadParagraphs(splitText(txtBody.Text), postID);
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "loadBlank", "alert('Post ID:" + postID + " generated Successfully!')", true);
            }
            else
            {

                db.SubmitChanges();
                removeOldParagraphs(post.Id);
                uploadParagraphs(splitText(txtBody.Text), post.Id);
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "loadBlank", "alert('Post ID:" + post.Id + " updated Successfully!')", true);
            }
            resetAll(sender, e);

        }

        // Relode the page
        private void resetAll(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }


        // Remove Old paragraph to add new Paragraph
        private void removeOldParagraphs(int id)
        {
            var paragraphs = db.Post_Paragraphs.Where(n => n.PostID == id);
            db.Post_Paragraphs.DeleteAllOnSubmit(paragraphs);
            db.SubmitChanges();
        }


        protected void grdPost_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var PostID = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "editPost")
            {
                loadDatatoEdit(PostID);
            }
            else if (e.CommandName == "sendPost")
            {
                submitPost(PostID);
            }else if(e.CommandName == "deletePost")
            {
                deletePost(PostID);
            }
        }

        private void deletePost(int postID)
        {
            var post = db.Posts.Where(n => n.Id == postID).SingleOrDefault();
            db.Posts.DeleteOnSubmit(post);
            db.SubmitChanges();
            loadPostGrid();
        }


        // Change Submit status to true to make it public
        private void submitPost(int postID)
        {
            var post = db.Posts.Where(n => n.Id == postID).SingleOrDefault();
            if (post.Submitted == true)
            {
                post.Submitted = false;
            }
            else
            {
                post.Submitted = true;
            }
            db.SubmitChanges();
            loadPostGrid();
        }


        // Load Data to Edit Panel
        private void loadDatatoEdit(int postID)
        {
            Session["PostID"] = postID;
            btnSubmit.Text = "Update";
            var post = db.Posts.Where(n => n.Id == postID).FirstOrDefault();
            ddlCategory.SelectedValue = post.Category.ToString();
            txtHeadline.Text = post.HeadLine;
            txtNewsDate.Text = Convert.ToDateTime(post.NewsDate).ToString("dd-MMM-yyyy");
            txtBody.Text = loadParagraphs(postID);
            videoEmbed.Text = post.VideoPath;
            loadImagePreview(postID);
        }


        // Load Image Preview in the side of FileUploader
        private void loadImagePreview(int postID)
        {
            imgPreview.Visible = true;
            imgPreview.ImageAlign = ImageAlign.AbsMiddle;
            imgPreview.BorderStyle = BorderStyle.Solid;
            imgPreview.BorderWidth = 5;
            imgPreview.BorderColor = Color.Orange;
            imgPreview.ImageUrl = "ImageHandler.ashx?PostID=" + postID + "&Size=thumbnail";
            imgPreview.AlternateText = "ImageHandler.ashx?PostID=" + postID + "&Size=original";
        }


        // To retrice Paragraph from Paragraphs table and insert to multiline textbox  
        private string loadParagraphs(int postID)
        {
            var paragraphs = db.Post_Paragraphs.Where(n => n.PostID == postID).ToList();
            string _paragraph = "";
            foreach (var paragraph in paragraphs)
            {
                _paragraph += paragraph.Paragraphs + "\n";
            }
            return _paragraph;
        }

        protected void grdPost_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPost.PageIndex = e.NewPageIndex;
            loadPostGrid();
        }
    }
}