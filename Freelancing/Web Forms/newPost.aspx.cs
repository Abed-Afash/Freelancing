using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing.Web_Forms
{
    public partial class newPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            using (var context = new FreelancingDBEntities())
            {
                Users user = (Users)Session["user"];
                var freelancer = context.Freelancers.Where(f => f.User_id == user.User_id).FirstOrDefault();
                Stream fileStream = postPic.PostedFile.InputStream;
                byte[] fileBytes;
                using (BinaryReader br = new BinaryReader(fileStream))
                {
                    fileBytes = br.ReadBytes((int)fileStream.Length);
                }
                var category = context.Categories.Where(c => c.Category_name == categoryText.Text).FirstOrDefault();
                if (category == null)
                {
                    category = new Categories()
                    {
                        Category_name = categoryText.Text
                    };
                    context.Categories.Add(category);
                }
                var post = new Posts()
                {
                    Freelancer_id = freelancer.Freelancer_id,
                    Title = titleText.Text,
                    Description = descriptionText.Text,
                    Price = decimal.Parse(priceText.Text),
                    Date = DateTime.UtcNow,
                    Category_id = category.Category_id,
                    Image = fileBytes
                };
                context.Posts.Add(post);
                context.SaveChanges();
                Response.Redirect("freelancerHome.aspx");

            }
        }
    }
}