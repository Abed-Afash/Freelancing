using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Freelancing.Web_Forms
{
    public partial class posts : System.Web.UI.Page
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
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-3F0N9CE\\SQLEXPRESS;Initial Catalog=FreelancingDB;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlDataAdapter sda = new SqlDataAdapter("select Post_id, Title, Price, Image , First_name , Last_name from Posts, Users, Freelancers Where Freelancers.User_id = Users.User_id and Freelancers.Freelancer_id = Posts.Freelancer_id", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
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