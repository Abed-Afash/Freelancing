using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing.Web_Forms
{
    public partial class client : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("client.aspx");
        }

        protected void Next(object sender, EventArgs e)
        {
            Users user = (Users)Session["user"];
            using (var context = new FreelancingDBEntities())
            {
                var clientInstance = new Clients()
                {
                    User_id = user.User_id,
                    Company_name = companyNameTextBox.Text
                };

                context.Users.Add(user);
                context.Clients.Add(clientInstance);
                context.SaveChanges();
                Session["user"] = user;
                Response.Redirect("clientHome.aspx");
            }
            
        }
    }
}