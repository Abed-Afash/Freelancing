using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing.Web_Forms
{
    public partial class editPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Users user = (Users)Session["user"];
                var profilePicture = user.Profile_picture;
                if (profilePicture != null)
                {
                    String base64Image = Convert.ToBase64String(profilePicture);
                    imgDisplay.ImageUrl = "data:image/jpeg;base64," + base64Image;
                }
                else
                {
                    byte[] imageData = File.ReadAllBytes(Server.MapPath("../Images/placeholder.jpg"));
                    string base64Image = Convert.ToBase64String(imageData);
                    imgDisplay.ImageUrl = "data:image/jpeg;base64," + base64Image;

                }
                if (Request.QueryString["Post_id"] != null)
                {
                    int postId = Convert.ToInt32(Request.QueryString["Post_id"]);
                    using (var context = new FreelancingDBEntities())
                    {
                        var post = context.Posts.Where(p => p.Post_id == postId).FirstOrDefault();
                        var category = context.Categories.Where(c => c.Category_id == post.Category_id).FirstOrDefault();
                        titleText.Text = post.Title;
                        categoryText.Text = category.Category_name;
                        priceText.Text = post.Price.ToString();
                        descriptionText.Text = post.Description;

                    }
                }
                
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            using (var context = new FreelancingDBEntities())
            {
                if (Request.QueryString["Post_id"] != null)
                {
                    int postId = Convert.ToInt32(Request.QueryString["Post_id"]);
                    var post = context.Posts.Where(p => p.Post_id == postId).FirstOrDefault();
                    var category = context.Categories.Where(c => c.Category_name ==categoryText.Text).FirstOrDefault();
                    post.Title = titleText.Text;
                    if (category == null)
                    {
                        category = new Categories()
                        {
                            Category_name = categoryText.Text
                        };
                        context.Categories.Add(category);
                    }
                    post.Category_id = category.Category_id;
                    post.Price = Decimal.Parse(priceText.Text);
                    post.Description = descriptionText.Text;
                    if(postPic != null && postPic.HasFile)
                    {
                        Stream fileStream = postPic.PostedFile.InputStream;
                        byte[] fileBytes;
                        using (BinaryReader br = new BinaryReader(fileStream))
                        {
                            fileBytes = br.ReadBytes((int)fileStream.Length);
                        }
                        post.Image = fileBytes;
                    }
                    context.SaveChanges();
                    Response.Redirect("myPosts.aspx");
                }
            }
        }
    }
}