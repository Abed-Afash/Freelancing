using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing
{
    public partial class option : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           


        }
        protected void joinButton_Click(object sender, EventArgs e)
        {
            Users user = (Users)Session["user"];
            if (clientRadio.Checked)
            {
                user.User_type = "Client";
                Session["user"] = user;
                Response.Redirect("client.aspx");
            }
            else if (freelancerRadio.Checked)
            {
                user.User_type = "Freelancer";
                Session["user"] = user;
                Response.Redirect("experience.aspx");
            }
        }
    }
}