using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Advertisement : System.Web.UI.Page
    {
        DataDataContext db = new DataDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGrid();
            }

        }

        private void loadGrid()
        {
            var adds = db.Advertisements.OrderByDescending(n => n.Id);
            grdPost.DataSource = adds;
            grdPost.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                Advertisement add = new Advertisement();
                add.Headline = txtHeadline.Text;
                add.Updto = Convert.ToDateTime(txtDate.Text);
                add.PublishedOn = DateTime.Now;
                add.PhoneNumber = txtPhone.Text;

                db.Advertisements.InsertOnSubmit(add);
                db.SubmitChanges();
                int addID = db.Advertisements.OrderByDescending(n => n.Id).Select(n => n.Id).FirstOrDefault();
                uploadImage(addID);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Success", "alert('Successfully saved add!')", true);
                loadGrid();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", $"alert('Failed to save!{ex.Message}')", true);
            }

        }

        private void uploadImage(int addID)
        {
            string path = $"AddImage/{addID}/";
            string serverPath = Server.MapPath(path);
            var newImage = new Bitmap(240, 120);
            using (var g = Graphics.FromImage(newImage))
            {
                g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                MemoryStream ms = new MemoryStream(fImage.FileBytes);
                g.DrawImage(System.Drawing.Image.FromStream(ms), 0, 0, 240, 120);
            }
            if (!Directory.Exists(serverPath))
            {
                Directory.CreateDirectory(serverPath);
            }


            //Saving original
            File.WriteAllBytes(serverPath + addID + ".jpg", fImage.FileBytes);
            //Save thumbnail
            File.WriteAllBytes(serverPath + addID + "_thumb.jpg", (byte[])new ImageConverter().ConvertTo(newImage, typeof(byte[])));

            var add = db.Advertisements.Where(n => n.Id == addID).SingleOrDefault();
            add.ImagePath = $"{path}{add.Id}.jpg";
            add.ThumbnailPath = $"{path}{add.Id}_thumb.jpg";
            db.SubmitChanges();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void grdPost_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "editPost")
            {

            }
            else if (e.CommandName == "sendPost")
            {

            }
            else if (e.CommandName == "deletePost")
            {
                deleteAdd(id);
                loadGrid();
                
            }
        }

        private void deleteAdd(int id)
        {
            try
            {
                var add = db.Advertisements.Where(n => n.Id == id).SingleOrDefault();
                db.Advertisements.DeleteOnSubmit(add);
                db.SubmitChanges();
                Directory.Delete($"AddImage/{add.Id}", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", $"alert('Failed to save image!{ex.Message}')", true);
            }
        }

        protected void grdPost_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPost.PageIndex = e.NewPageIndex;
            loadGrid();
        }
    }
}