using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace OnlineBankingWebApplication.CustomerSide
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        //String strcn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mittal\Desktop\OnlineBankingWebApplication\OnlineBankingWebApplication\App_Data\OnlineBanking.mdf;Integrated Security=True;User Instance=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            int CustomerID = 0;
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_UserLogin", cn);
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Username", Txtusernm.Text);
                cmd.Parameters.Add("@Password", Txtpwd.Text);

                CustomerID = Convert.ToInt32(cmd.ExecuteScalar());
            }
            if (CustomerID == -1 || CustomerID == 0)
            {
                Lblmsg.Text = "Username or password is incorrect.";
            }
            else
            {
                Session["CustomerID"] = Txtusernm.Text;
                Response.Redirect("Cust_Profile.aspx?CustomerID=" + CustomerID);
            }
          
        }

    } 
  }
   