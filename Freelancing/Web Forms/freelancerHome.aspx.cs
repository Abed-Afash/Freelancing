using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing.Web_Forms
{
    public partial class freelancerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Users user = (Users)Session["user"];
                var capitalized = char.ToUpper(user.First_name[0]) + user.First_name.Substring(1);
                welcomeMessage.InnerText = "Welcome " + capitalized + "!";
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

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            if (newPost.Checked)
            {
                Response.Redirect("newPost.aspx");
            }
            else {
                Response.Redirect("myPosts.aspx");
            }
        }
    }
}