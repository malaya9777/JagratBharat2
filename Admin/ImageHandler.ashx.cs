using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;

namespace Admin
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            using(DataDataContext db = new DataDataContext())
            {
                var postID = Convert.ToInt32(context.Request.QueryString["PostID"]);
                string Size = context.Request.QueryString["Size"].ToString().ToLower();
                var post = db.Posts.Where(n => n.Id == postID).SingleOrDefault();
                if (post != null)
                {
                    var img = GlobalMethods.BinaryToImage(post.Image.ToArray());
                    var imgArray = GetBytesFromImage(generateImage(img, Size));
                    context.Response.ContentType = "image/jpg";
                    context.Response.OutputStream.Write(imgArray, 0, imgArray.Length);
                    context.Response.Flush();
                    context.Response.End();
                }

            }
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        
        public Image generateImage(Image img, string size)
        {
            if (size == "thumbnail")
            {
                var newSize = new Size
                {
                    Width = 80,
                    Height = 40
                };
                var newImage = new Bitmap(newSize.Width, newSize.Height);
                using (var g = Graphics.FromImage(newImage))
                {
                    g.DrawImage(img, 0, 0, newSize.Width, newSize.Height);
                }
                return newImage;

            }
            else
            {
                return img;
            }
        }
        public byte[] GetBytesFromImage(Image img)
        {
            MemoryStream ms = new MemoryStream();
            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms.ToArray();
        }
    }
}