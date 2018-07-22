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
    public partial class Profile : System.Web.UI.Page
    {
        Admin_Customer ac = new Admin_Customer();
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;

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
                }
            }
        }
        
        protected void SearchAccoutTranBtn_Click(object sender, EventArgs e)
        {
            if (DropAccountNo.SelectedValue != null)
            {
                DataTable dt = new DataTable();
                int AcctNo = Convert.ToInt32(DropAccountNo.SelectedValue);
                dt = ac.Cutomer_Display(AcctNo);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_GetCustFullDetailByAcctNo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AccountNo", DropAccountNo.SelectedValue);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                LblCustomernm.Text = Convert.ToString(reader["CustomerName"]);
                LblAddress.Text = Convert.ToString(reader["Address"]);
                LblContactNumber.Text = Convert.ToString(reader["ContactNumber"]);
                LblEmail.Text = Convert.ToString(reader["Email"]);
                LblUserName.Text = Convert.ToString(reader["UserName"]);
                LblPassword.Text = Convert.ToString(reader["Password"]);
                LblBranchCode.Text = Convert.ToString(reader["BranchCode"]);
                LblLocation.Text = Convert.ToString(reader["Location"]);
                LblTotalBalance.Text = Convert.ToString(reader["TotalBalance"]);                
            }
            cn.Close();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                Response.Redirect("~/AdminSide/EditCustomerTransaction.aspx?TransactionID=" + row.Cells[0].Text);
            }
            if (e.CommandName == "DeleteButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                int TransactionID = Convert.ToInt32(row.Cells[0].Text);
                ac.Delete_CustomerTransctionList(TransactionID);
            }
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx"); 
        }

        protected void LinkBtnManageAccounts_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminSide/ManageAccounts.aspx");
        }

        protected void LinkBtnEditCustomerTransaction_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminSide/EditCustomerTransaction.aspx");
        }

        protected void LinkBtnManageComplaints_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminSide/ManageComplaints.aspx");
        }

        protected void LinkBtnEditCustomerComplaints_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminSide/EditCustomerComplaints.aspx");
        }

        protected void LinkBtnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminSide/Login.aspx");
        }

        protected void LinkBtnDeleteAccount_Click(object sender, EventArgs e)
        {

            if (DropAccountNo.SelectedValue != null)
            {
                int AcctNo = Convert.ToInt32(DropAccountNo.SelectedValue);
                ac.Delete_CustomerAccount(AcctNo);
                lblDeleteMsg.Text = "Successfully Delete Account #" + AcctNo;
                
            }
            else
            {
                lblDeleteMsg.Text = "Please Select Account # From DropDown List to Delete Account";
            }
        }

        
    }
}