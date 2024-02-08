using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing.Web_Forms
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LogIn_button(object sender, EventArgs e)
        {
            var email = emailTextBox.Text;
            var password = passwordTextBox.Text;
            using (var context = new FreelancingDBEntities())
            {
                var user = context.Users.Where(u => u.Email == email).FirstOrDefault();
                if (user == null)
                {
                    string script = "alert('email does not exist');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
                else
                {
                    if (password != user.Password)
                    {
                        string script = "alert('password is incorrect');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                    else
                    {
                        Session["user"] = user;
                        if (user.User_type == "Freelancer")
                        {
                            Response.Redirect("freelancerHome.aspx");
                        }
                        else
                        {
                            Response.Redirect("clientHome.aspx");
                        }
                    }
                }
            }
        }
    }
}