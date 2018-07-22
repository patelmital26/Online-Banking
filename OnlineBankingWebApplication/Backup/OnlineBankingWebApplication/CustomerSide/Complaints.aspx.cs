using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;


namespace OnlineBankingWebApplication.CustomerSide
{
    public partial class Complaints : System.Web.UI.Page
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

        protected void Btnsubmit_Click(object sender, EventArgs e)
        {

            u.Email = TextEmailAdd.Text;
            u.ContactNumber = TextPhoneno.Text;
            u.TypeofComplaints = DropComplaints.SelectedValue;
            u.AccountNo = Convert.ToInt32(DropAccountNo.SelectedValue);
            u.Insert_ComplaintsInfo();
            Lblmsg.Text = "Complaints Successfully";
            TextEmailAdd.Text = String.Empty;
            TextPhoneno.Text = String.Empty;
            
        }

        protected void LnkbtnBacktoCustProfile_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("Cust_Profile.aspx?CustomerID=" + CustomerID);
        }

        }
    }
