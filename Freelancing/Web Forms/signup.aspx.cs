using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                string script = "alert('Passwords don\\'t match');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            else { 
            Stream fileStream = fileProfilePic.PostedFile.InputStream;
            byte[] fileBytes;
            using (BinaryReader br = new BinaryReader(fileStream))
            {
                fileBytes = br.ReadBytes((int)fileStream.Length);
            }
            using (var context = new FreelancingDBEntities())
            {
                var email = context.Users.Where(u => u.Email == txtEmail.Text).FirstOrDefault();
                if( email != null)
                {
                    string script = "alert('Email already exists');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                }
                else
                {
                        var user = new Users
                        {
                            First_name = txtFirstName.Text,
                            Last_name = txtLastName.Text,
                            Email = txtEmail.Text,
                            Phone_number = txtPhoneNumber.Text,
                            Date_of_birth = DateTime.Parse(txtDateOfBirth.Text),
                            Password = txtPassword.Text,
                            Profile_picture = fileBytes
                        };
                    Session["user"] = user;
                    Response.Redirect("option.aspx");
                 }

                }
            }
        }
            
    }
}