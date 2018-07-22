using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace OnlineBankingWebApplication.CustomerSide
{
    public partial class Cust_Profile : System.Web.UI.Page
    {
        User u = new User();
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        //string strcn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mittal\Desktop\OnlineBankingWebApplication\OnlineBankingWebApplication\App_Data\OnlineBanking.mdf;Integrated Security=True;User Instance=True";
       

        protected void Page_Load(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            if (CustomerID != null)
            {
                SqlConnection cn = new SqlConnection(strcn);
                cn.Open();
                SqlCommand cmd = new SqlCommand("usp_GetCustomerInfo", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerID", CustomerID);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    LblCustnm.Text = Convert.ToString(reader["CustomerName"]);
                    LblAdd.Text = Convert.ToString(reader["Address"]);
                    LblPhoneno.Text = Convert.ToString(reader["ContactNumber"]);
                    LblEmail.Text = Convert.ToString(reader["Email"]);
                }
                cn.Close();

                if (!IsPostBack)
                {
                    SqlConnection cn1 = new SqlConnection(strcn);
                    cn1.Open();
                    SqlCommand cmd1 = new SqlCommand("usp_GetCustomerAccountList", cn1);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.Add("@CustomerID", CustomerID);

                    SqlDataReader reader1 = cmd1.ExecuteReader();
                    if (reader1.HasRows)
                    {
                        DropAccountNo.DataSource = reader1;
                        DropAccountNo.DataTextField = "AccountNo";
                        DropAccountNo.DataValueField = "AccountNo";
                        DropAccountNo.DataBind();
                    }
                    cn1.Close();
                }
            }
            else
            {
                Response.Redirect("CustomerLogin.aspx");
            }
          }

        protected void BtnAccountDetails_Click(object sender, EventArgs e)
        {  
            if(DropAccountNo.SelectedValue != null)
            {
               SqlConnection cn1 = new SqlConnection(strcn);
               cn1.Open();
               SqlCommand cmd1 = new SqlCommand("usp_GetAccountDetails", cn1);
               cmd1.CommandType = CommandType.StoredProcedure;
               cmd1.Parameters.Add("@AccountNo", DropAccountNo.SelectedValue);

               SqlDataReader reader1 = cmd1.ExecuteReader();
               if (reader1.HasRows)
               {
                   reader1.Read();
                   LblTotalBalance.Text = Convert.ToString(reader1["TotalBalance"]);
                   LblBranchCode.Text = Convert.ToString(reader1["BranchCode"]);
                   LblBranchLocation.Text = Convert.ToString(reader1["Location"]);
               }
               DataTable dt = new DataTable();
               int AcctNo = Convert.ToInt32(DropAccountNo.SelectedValue);
               dt = u.Transaction_Display(AcctNo);
               GridView1.DataSource = dt;
               GridView1.DataBind();
               cn1.Close();
            }
        }

        protected void BtnOpennewAccount_Click(object sender, EventArgs e)
        {
            if(DropListLocation.SelectedValue != null)
            {
               SqlConnection cn1 = new SqlConnection(strcn);
               cn1.Open();
               SqlCommand cmd1 = new SqlCommand("usp_InsertNewAccountDetails", cn1);
               cmd1.CommandType = CommandType.StoredProcedure;
               cmd1.Parameters.Add("@CustomerID", Request.QueryString["CustomerID"]);
               if (DropListLocation.SelectedValue == "Surat")
               {
                   cmd1.Parameters.Add("@BranchCode", "NBI674569");
               }
               else if (DropListLocation.SelectedValue == "Nadiad")
               {
                   cmd1.Parameters.Add("@BranchCode", "NBI346564");
               }
               else if (DropListLocation.SelectedValue == "Baroda")
               {
                   cmd1.Parameters.Add("@BranchCode", "NBI534565");
               }
               else if (DropListLocation.SelectedValue == "Anand")
               {
                   cmd1.Parameters.Add("@BranchCode", "NBI235454");
               }
               cmd1.Parameters.Add("@Location", DropListLocation.SelectedValue);

               cmd1.ExecuteNonQuery();
               cn1.Close();

                SqlConnection cn2 = new SqlConnection(strcn);
                    cn2.Open();
                    SqlCommand cmd2 = new SqlCommand("usp_GetCustomerAccountList", cn2);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.Add("@CustomerID", Request.QueryString["CustomerID"]);

                    SqlDataReader reader2 = cmd2.ExecuteReader();
                    if (reader2.HasRows)
                    {
                        DropAccountNo.DataSource = reader2;
                        DropAccountNo.DataTextField = "AccountNo";
                        DropAccountNo.DataValueField = "AccountNo";
                        DropAccountNo.DataBind();
                    }
                    cn1.Close();
                
            }
        }

        protected void DropAccountNo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void LinkBtnTransferMoney_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("TransferMoney.aspx?CustomerID=" + CustomerID);
        }

        protected void LinkBtnEditCustomerProfile_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("EditCustomer_Profile.aspx?CustomerID=" + CustomerID);
        }

        protected void LinkBtnLogout_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("Logout.aspx?CustomerID=" + CustomerID);
        }

        protected void LinkBtnChangePwd_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("ChangePassword.aspx?CustomerID=" + CustomerID);
        }
        
       }
    }
