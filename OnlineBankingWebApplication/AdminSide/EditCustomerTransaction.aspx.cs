using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineBankingWebApplication.AdminSide
{
   
    public partial class EditCustomerProfile : System.Web.UI.Page
    {
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        //string strcn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mittal\Desktop\OnlineBankingWebApplication\OnlineBankingWebApplication\App_Data\OnlineBanking.mdf;Integrated Security=True;User Instance=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            string TransactionID = Request.QueryString["TransactionID"];
            if (TransactionID != null)
            {
                if (!IsPostBack)
                {
                    SqlConnection cn = new SqlConnection(strcn);
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("usp_EditCustomerTransactionList", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@TransactionID", TransactionID);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        txtTransactionID.Text = Convert.ToString(reader["TransactionID"]);
                        txtAccountNo.Text = Convert.ToString(reader["AccountNo"]);
                        txtTransactionDate.Text = Convert.ToString(reader["TransactionDate"]);
                        txtTransactionType.Text = Convert.ToString(reader["TransactionType"]);
                        txtDescription.Text = Convert.ToString(reader["Description"]);
                        txtDeposit.Text = Convert.ToString(reader["Deposit"]);
                        txtWithdrawal.Text = Convert.ToString(reader["Withdrawal"]);
                    }
                    cn.Close();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection cn1 = new SqlConnection(strcn);
            cn1.Open();
            SqlCommand cmd1 = new SqlCommand("usp_UpdateTransaction", cn1);
            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.Add("@AccountNo", txtAccountNo.Text);
            cmd1.Parameters.Add("@TransactionID", txtTransactionID.Text);
            cmd1.Parameters.Add("@TransactionDate", txtTransactionDate.Text);
            cmd1.Parameters.Add("@TransactionType", txtTransactionType.Text);
            cmd1.Parameters.Add("@Description", txtDescription.Text);
            cmd1.Parameters.Add("@Deposit", txtDeposit.Text);
            cmd1.Parameters.Add("@Withdrawal", txtWithdrawal.Text);

            int result = cmd1.ExecuteNonQuery();
            cn1.Close();

            if (result == 1)
            {
                Lblmsg.Text = "Record Updated Successfully";
            }
            Response.Redirect("Profile.aspx");
        } 
    }
}