using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace OnlineBankingWebApplication.AdminSide
{
    public partial class ManageAccounts : System.Web.UI.Page
    {
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        //string strcn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mittal\Desktop\OnlineBankingWebApplication\OnlineBankingWebApplication\App_Data\OnlineBanking.mdf;Integrated Security=True;User Instance=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["AdminId"] as string))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string AdminId = Request.QueryString["AdminId"];

                if (!IsPostBack)
                {
                    SqlConnection cn1 = new SqlConnection(strcn);
                    cn1.Open();
                    SqlCommand cmd1 = new SqlCommand("GetAllAccountNumber", cn1);
                    cmd1.CommandType = CommandType.StoredProcedure;

                    SqlDataReader reader1 = cmd1.ExecuteReader();
                    if (reader1.HasRows)
                    {
                        DropAccountNo.DataSource = reader1;
                        DropAccountNo.DataTextField = "AccountNo";
                        DropAccountNo.DataValueField = "AccountNo";
                        DropAccountNo.DataBind();
                    }
                    cn1.Close();

                    if (DropAccountNo.SelectedValue != null)
                    {
                        SqlConnection cn = new SqlConnection(strcn);
                        cn.Open();
                        SqlCommand cmd = new SqlCommand("usp_GetCustNameAndBalanceByAcctNo", cn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@AccountNo", DropAccountNo.SelectedValue);

                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            reader.Read();
                            TextCustomerName.Text = Convert.ToString(reader["CustomerName"]);
                            TextTotalBalance.Text = Convert.ToString(reader["TotalBalance"]);
                        }
                        cn.Close();
                    }
                }
            }
        }

        protected void DropAccountNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropAccountNo.SelectedValue != null)
            {
                SqlConnection cn1 = new SqlConnection(strcn);
                cn1.Open();
                SqlCommand cmd1 = new SqlCommand("usp_GetCustNameAndBalanceByAcctNo", cn1);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@AccountNo", DropAccountNo.SelectedValue);

                SqlDataReader reader1 = cmd1.ExecuteReader();
                if (reader1.HasRows)
                {
                    reader1.Read();
                    TextCustomerName.Text = Convert.ToString(reader1["CustomerName"]);
                    TextTotalBalance.Text = Convert.ToString(reader1["TotalBalance"]);
                }
                cn1.Close();
            }
        }

        protected void BtnWithdrawal_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_ManageAccountsWithdrawal", cn);
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@AccountNo", DropAccountNo.SelectedValue);
                cmd.Parameters.Add("@Amount", TextAmount.Text);
                cmd.Parameters.Add("@TransactionType", DropTranType.SelectedValue);
                cmd.Parameters.Add("@text", SqlDbType.VarChar, 50);
                cmd.Parameters["@text"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
            }
            if (cmd.Parameters["@text"].Value.ToString() == "FAILED to Withdrawal!")
            {
                Lblmsg.Text = "Withdrawal Failed due to Insufficent Balance ";
            }
            else
            {
                Lblmsg.Text = "Withdrawal Money Sucessfully!";
            }
        }

        protected void BtnDeposit_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_ManageAccountsDeposit", cn);
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@AccountNo", DropAccountNo.SelectedValue);
                cmd.Parameters.Add("@Amount", TextAmount.Text);
                cmd.Parameters.Add("@TransactionType", DropTranType.SelectedValue);
                cmd.Parameters.Add("@text", SqlDbType.VarChar, 50);
                cmd.Parameters["@text"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
            }
           
                Lblmsg.Text = "Deposit Successfull Balance";
            }
           
        }
}