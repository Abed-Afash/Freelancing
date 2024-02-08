using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing.Web_Forms
{
    public partial class postDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Post_id"] != null)
                {
                    Users user = (Users)Session["user"];
                    var profilePicture = user.Profile_picture;
                    int postId = Convert.ToInt32(Request.QueryString["Post_id"]);
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
                    using (var context = new FreelancingDBEntities())
                    {
                        var post = context.Posts.Where(p => p.Post_id == postId).FirstOrDefault();
                        var category = context.Categories.Where(c => c.Category_id == post.Category_id).FirstOrDefault();
                        PostObject = post;
                        titleText.InnerText = post.Title;
                        categoryText.InnerText = category.Category_name;
                        priceText.InnerText = "USD " + post.Price.ToString() + " / Hour";
                        descriptionText.InnerText = post.Description;
                        dateText.InnerText = post.Date.ToString();
                        var freelancer = context.Freelancers.Where(f => f.Freelancer_id == post.Freelancer_id).FirstOrDefault();
                        var userInstance = context.Users.Where(u => u.User_id == freelancer.User_id).FirstOrDefault();
                        userIdText.InnerText = userInstance.First_name + " " + userInstance.Last_name;
                        UserObject = userInstance;
                    }
                }
            }
            DataBind();
        }
        public Posts PostObject { get; set; }
        public Users UserObject { get; set; }
        protected string GetImageSrc(object imageData)
        {
            if (imageData != null && imageData != DBNull.Value)
            {
                byte[] bytes = (byte[])imageData;
                if (bytes.Length > 0)
                {
                    string base64String = Convert.ToBase64String(bytes);
                    return "data:image/jpeg;base64," + base64String;
                }
            }
            return "~/Images/placeholder.jpg";
        }
    }
}