using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing.Web_Forms
{
    public partial class editProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Users user = (Users)Session["user"];
                UserObject = user;
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
                using (var context = new FreelancingDBEntities())
                {
                    txtFirstName.Text = user.First_name;
                    txtLastName.Text = user.Last_name;
                    txtPhoneNumber.Text = user.Phone_number;
                    if (user.User_type == "Freelancer")
                    {
                        var freelancer = context.Freelancers.Where(f => f.User_id == user.User_id).FirstOrDefault();
                        txtLinkedIn.Text = freelancer.Linkedin_link;
                        txtExperience.Text = freelancer.Experience;
                        var category = context.Categories.Where(c => c.Category_id == freelancer.Category_id).FirstOrDefault();
                        txtCategory.Text = category.Category_name;
                    }
                    else
                    {
                        var client = context.Clients.Where(c => c.User_id == user.User_id).FirstOrDefault();
                        if (client.Company_name != null)
                        {
                            txtCompanyName.Text = client.Company_name;
                        }
                    }
                }
            }
        }
        public Users UserObject { get; set; }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                string script = "alert('Passwords don\\'t match');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            else
            {
                Users user = (Users)Session["user"];
                using (var context = new FreelancingDBEntities())
                {
                    var userInstance = context.Users.Where(u => u.User_id == user.User_id).FirstOrDefault();
                    userInstance.First_name = txtFirstName.Text;
                    userInstance.Last_name = txtLastName.Text;
                    userInstance.Phone_number = txtPhoneNumber.Text;
                    userInstance.Password = txtPassword.Text;
                    if (userInstance.User_type == "Freelancer")
                    {
                        var freelancer = context.Freelancers.Where(f => f.User_id == userInstance.User_id).FirstOrDefault();
                        freelancer.Linkedin_link = txtLinkedIn.Text;
                        freelancer.Experience = txtExperience.Text;
                        var category = context.Categories.Where(c => c.Category_name == txtCategory.Text).FirstOrDefault();
                        if (category == null)
                        {
                            category = new Categories()
                            {
                                Category_name = txtCategory.Text
                            };
                            context.Categories.Add(category);
                        }
                        freelancer.Category_id = category.Category_id;
                        if (fileCV != null && fileCV.HasFile)
                        {
                            Stream fileStream = fileCV.PostedFile.InputStream;
                            byte[] fileBytes;
                            using (BinaryReader br = new BinaryReader(fileStream))
                            {
                                fileBytes = br.ReadBytes((int)fileStream.Length);
                            }
                            freelancer.CV = fileBytes;
                        }
                    }
                    else
                    {
                        var client = context.Clients.Where(c => c.User_id == userInstance.User_id).FirstOrDefault();
                        client.Company_name = txtCompanyName.Text;
                    }
                    if (fileProfilePic != null && fileProfilePic.HasFile)
                    {
                        Stream fileStream = fileProfilePic.PostedFile.InputStream;
                        byte[] fileBytes;
                        using (BinaryReader br = new BinaryReader(fileStream))
                        {
                            fileBytes = br.ReadBytes((int)fileStream.Length);
                        }
                        userInstance.Profile_picture = fileBytes;
                    }
                    context.SaveChanges();
                    Session["user"] = userInstance;
                    Response.Redirect("profile.aspx");
                }
            }
        }
    }
}