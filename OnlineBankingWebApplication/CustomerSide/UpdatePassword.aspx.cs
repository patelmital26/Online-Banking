using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBankingWebApplication.CustomerSide
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LnkbtnBacktoUserProfile_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("Cust_Profile.aspx?CustomerID=" + CustomerID);
        }
    }
}