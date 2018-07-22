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
    public partial class ChangePassword1 : System.Web.UI.Page
    {
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            if (CustomerID != null)
            {
                
            }
            else
            {
                Response.Redirect("CustomerLogin.aspx");
            }
        }

        protected void LnkbtnBacktoUserProfile_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("Cust_Profile.aspx?CustomerID=" + CustomerID);
        }

        protected void BtnChangepwd_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_ChangeCustomerPassword", cn);
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerID", CustomerID);
                cmd.Parameters.Add("@SecQuestionEntered", Dropsecquestion.SelectedValue);
                cmd.Parameters.Add("@SecAnswerEntered", Txtsecanswer.Text);
                cmd.Parameters.Add("@NewPassword", Txtnewpwd.Text);
                cmd.Parameters.Add("@text", SqlDbType.VarChar, 50);
                cmd.Parameters["@text"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
            }
            if (cmd.Parameters["@text"].Value.ToString() == "INVALID Information")
            {
                Lblmsg.Text = "Information Entered does not match our record. Try Again!";
            }
            else
            {
                Lblmsg.Text = "Successfully Updated the New Password!";
            }
        }
    }
}