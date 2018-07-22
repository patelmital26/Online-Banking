using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OnlineBankingWebApplication.AdminSide
{
    public partial class Login : System.Web.UI.Page
    {
        Admin_Customer ac = new Admin_Customer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string unm = "", pwd = "";
            unm = "Admin";
            pwd = "Admin_123";
            
            if (Txtusernm.Text == unm && Txtpwd.Text == pwd)
            {
                Session["AdminId"] = Txtusernm.Text;
                Response.Redirect("Profile.aspx"); //Admin Page -> Profile
            }
      
            else
            {
                Lblmsg.Text = "Invalid Username or Password";
            }
           
        }
    }
}