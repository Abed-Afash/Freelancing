using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Freelancing
{
    public partial class experience : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("option.aspx");

        }
        protected void Next(object sender, EventArgs e)
        {
            var experience = "";
            if (newFreelancer.Checked) {
                experience = "0";
            }
            else if (someExperience.Checked)
            {
                experience = years.Text;
            }
            Session["experience"] = experience;
            Response.Redirect("category.aspx");
        }
    }
}