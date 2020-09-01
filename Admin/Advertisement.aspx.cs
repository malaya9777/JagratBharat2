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
            var adds = db.Advertisements.OrderByDescending(n => n.Id).Select(n=>new
            {
                n.Id,
                n.Headline,
                n.PublishedOn,
                n.PublishedTill,
                n.ImagePath,
                n.ThumbnailPath,
                n.PhoneNumber,
                n.Status,
                SendButtonCss = n.Status == true ? "btn green" : "btn orange",
                SendButtonTxt = n.Status == true ? "Depublish" : "Publish",
            });
            grdPost.DataSource = adds;
            grdPost.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                Advertisement add;
                if (btnSubmit.Text!="Update")
                {
                    add = new Advertisement();
                }
                else
                {
                    int loadedID = Convert.ToInt32(Session["EditID"]);
                    add = db.Advertisements.Where(n => n.Id == loadedID).SingleOrDefault();                    
                }
                add.Headline = txtHeadline.Text;
                add.PublishedTill = Convert.ToDateTime(txtDate.Text);
                add.PublishedOn = DateTime.Now;
                add.PhoneNumber = txtPhone.Text;
                add.Status = false;

                if (btnSubmit.Text == "Submit")
                {
                    db.Advertisements.InsertOnSubmit(add);
                }                
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
                Session["EditID"] = id;
                btnSubmit.Text = "Update";
                editPost(id);
            }
            else if (e.CommandName == "sendPost")
            {
                launchedPost(id);
                loadGrid();
            }
            else if (e.CommandName == "deletePost")
            {
                deleteAdd(id);            
                
            }
        }

        private void launchedPost(int id)
        {
            try
            {
                var add = db.Advertisements.Where(n => n.Id == id).SingleOrDefault();
                if(add.Status == false||add.Status == null)
                {
                    add.Status = true;
                }
                else
                {
                    add.Status = false;
                }
                
                db.SubmitChanges();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", $"alert('Something is worng!{ex.Message}')", true);
            }

        }

        private void editPost(int id)
        {
            try
            {
                var add = db.Advertisements.Where(n => n.Id == id).SingleOrDefault();
                txtHeadline.Text = add.Headline;
                txtDate.Text = Convert.ToDateTime(add.PublishedTill).ToString("dd-MMM-yyyy");
                txtPhone.Text = add.PhoneNumber;
                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Error", $"alert('Something is worng!{ex.Message}')", true);
            }
        }

        private void deleteAdd(int id)
        {
            try
            {
                var add = db.Advertisements.Where(n => n.Id == id).SingleOrDefault();
                db.Advertisements.DeleteOnSubmit(add);
                db.SubmitChanges();
                Directory.Delete(Server.MapPath($"AddImage/{add.Id}"), true);
                loadGrid();
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