using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;

namespace JagratBharat
{
    /// <summary>
    /// Summary description for getImage
    /// </summary>
    public class getImage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            using (dbDataContext db = new dbDataContext())
            {
                try
                {
                    var postID = Convert.ToInt32(context.Request.QueryString["PostID"]);
                    string Size = context.Request.QueryString["Size"].ToString().ToLower();
                    var post = db.Posts.Where(n => n.Id == postID).SingleOrDefault();
                    if (post != null)
                    {
                        var img = BinaryToImage(post.Image.ToArray());
                        var imgArray = GetBytesFromImage(generateImage(img, Size));
                        context.Response.ContentType = "image/jpg";
                        context.Response.OutputStream.Write(imgArray, 0, imgArray.Length);
                        context.Response.Flush();
                        context.Response.End();
                    }
                }
                catch (Exception)
                {
                    context.Response.Write("No image found!");
                   
                }

            }

        }
        public static Image BinaryToImage(byte[] imageBytes)
        {
            if (imageBytes == null)
            {
                return null;
            }

            MemoryStream ms = new MemoryStream();
            ms.Write(imageBytes, 0, imageBytes.Length);
            return Image.FromStream(ms);

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
                    Width = 240,
                    Height = 120
                };
                var newImage = new Bitmap(newSize.Width, newSize.Height);
                using (var g = Graphics.FromImage(newImage))
                {
                    g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                    g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                    g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                    g.DrawImage(img, 0, 0, newSize.Width, newSize.Height);
                }
                return newImage;

            }
            else
            {
                var newImage = new Bitmap(img.Width, img.Height);
                using (var g = Graphics.FromImage(newImage))
                {
                    g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                    g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                    g.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                    g.DrawImage(img, 0, 0, img.Width, img.Height);
                }
                return newImage;
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