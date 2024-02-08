using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing.Web_Forms
{
    public partial class userProfile : System.Web.UI.Page
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
            if (Request.QueryString["User_id"] != null)
            {
                int userId = Convert.ToInt32(Request.QueryString["User_id"]);
                using (var context = new FreelancingDBEntities())
                {
                    var userInstance = context.Users.Where(u => u.User_id == userId).FirstOrDefault();
                    nametext.InnerText = userInstance.First_name + " " + userInstance.Last_name;
                    if (userInstance.Profile_picture != null)
                    {
                        String base64Image = Convert.ToBase64String(userInstance.Profile_picture);
                        Image1.ImageUrl = "data:image/jpeg;base64," + base64Image;
                    }
                    else
                    {
                        byte[] imageData = File.ReadAllBytes(Server.MapPath("../Images/placeholder.jpg"));
                        string base64Image = Convert.ToBase64String(imageData);
                        Image1.ImageUrl = "data:image/jpeg;base64," + base64Image;
                    }
                    var freelancer = context.Freelancers.Where(f => f.User_id == userInstance.User_id).FirstOrDefault();
                    var category = context.Categories.Where(c => c.Category_id == freelancer.Category_id).FirstOrDefault();
                    categorytext.InnerText = category.Category_name;
                    typetext.InnerText = "Freelancer";
                    if (freelancer.Experience == "0")
                    {
                        experiencetext.InnerText = "Has no experience yet";
                    }
                    else
                    {
                        experiencetext.InnerText = "Has " + freelancer.Experience + " years of experience";
                    }
                    phonetext.InnerText = userInstance.Phone_number;
                    emailtext.InnerText = userInstance.Email;
                    freelancerObject = freelancer;
                }
            }

        }
        public Freelancers freelancerObject { get; set; }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
                // Check if the freelancer has a CV
                if (freelancerObject != null && freelancerObject.CV != null && freelancerObject.CV.Length > 0)
                {
                    // Retrieve CV data from the database
                    byte[] cvData = freelancerObject.CV;

                    // Send the CV to the client for download
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", "attachment; filename=CV.pdf");
                    Response.BinaryWrite(cvData);
                    Response.End();
                }
                else
                {
                string script = "alert('No CV to display');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }


        }
    }
}