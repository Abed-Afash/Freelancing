using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing
{
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Next(object sender, EventArgs e)
        {
            Users user = (Users)Session["user"];
            var experience = Session["experience"];
            var cv = cvUpload;
            Stream fileStream = cv.PostedFile.InputStream;
            byte[] fileBytes;
            using (BinaryReader br = new BinaryReader(fileStream))
            {
                fileBytes = br.ReadBytes((int)fileStream.Length);
            }
            using (var context = new FreelancingDBEntities())
            {

                var categoryInstance = context.Categories.Where(c => c.Category_name == preferredCategory.Text).FirstOrDefault();
                if (categoryInstance == null)
                {
                    categoryInstance = new Categories()
                    {
                        Category_name = preferredCategory.Text
                    };
                    context.Categories.Add(categoryInstance);
                }

                var freelancerInstance = new Freelancers()
                {
                    User_id = user.User_id,
                    Experience = (String)experience,
                    Linkedin_link = linkedInLink.Text,
                    Category_id = categoryInstance.Category_id,
                    CV = fileBytes
                };
                context.Users.Add(user);
                context.Freelancers.Add(freelancerInstance);
                context.SaveChanges();
                Session["user"] = user;
                Response.Redirect("freelancerHome.aspx");
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("experience.aspx");
        }
    }
}