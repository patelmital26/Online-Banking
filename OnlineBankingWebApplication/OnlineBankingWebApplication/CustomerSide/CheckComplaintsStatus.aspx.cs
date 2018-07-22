using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineBankingWebApplication.CustomerSide
{
    public partial class BillPayment : System.Web.UI.Page
    {
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        User u = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["CustomerID"] as string))
            {
                Response.Redirect("CustomerLogin.aspx");
            }
            else
            {
                string CustomerID = Request.QueryString["CustomerID"];
                if (CustomerID != null)
                {
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
        }
        protected void GridViewCheckComplaints_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnStatus_Click(object sender, EventArgs e)
        {
            if (DropAccountNo.SelectedValue != null)
            {
                int AccountNo = Convert.ToInt32(DropAccountNo.SelectedValue);
                SqlConnection cn = new SqlConnection(strcn);
                cn.Open();
                SqlCommand cmd = new SqlCommand("usp_CheckCompliantsStatus", cn);
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@AccountNo", AccountNo);
                    cmd.Parameters.Add("@text", SqlDbType.VarChar, 50);
                    cmd.Parameters["@text"].Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                }
                DataTable dt = new DataTable();
                if (cmd.Parameters["@text"].Value.ToString() == "No Complaints!")
                {
                    LblMessage.Text = "No Complaints found for this Account";
                }
                else
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    LblMessage.Text = "";
                }
                cn.Close();
                GridViewCheckComplaints.DataSource = dt;
                GridViewCheckComplaints.DataBind();
            }
        }

        protected void LnkbtnBacktoCustProfile_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("Cust_Profile.aspx?CustomerID=" + CustomerID);
        }
    }
}