using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnlineBankingWebApplication.CustomerSide
{
    public partial class EditUserProfile : System.Web.UI.Page
    {
         string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        //string strcn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mittal\Desktop\OnlineBankingWebApplication\OnlineBankingWebApplication\App_Data\OnlineBanking.mdf;Integrated Security=True;User Instance=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            if (CustomerID != null)
            {
                if (!IsPostBack)
                {
                    SqlConnection cn = new SqlConnection(strcn);
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("usp_EditCustomerProfile", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@CustomerID", CustomerID);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        TextCustomerID.Text = Convert.ToString(reader["CustomerID"]);
                        TextName.Text = Convert.ToString(reader["CustomerName"]);
                        TextAddress.Text = Convert.ToString(reader["Address"]);
                        TextContactno.Text = Convert.ToString(reader["ContactNumber"]);
                        TextEmail.Text = Convert.ToString(reader["Email"]);
                       
                    }
                    cn.Close();
                }
            }
        }

       
        
        protected void LnkbtnBacktoUserProfile_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("Cust_Profile.aspx?CustomerID=" + CustomerID);
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            SqlConnection cn1 = new SqlConnection(strcn);
            cn1.Open();
            SqlCommand cmd1 = new SqlCommand("usp_UpdateCustomerProfile", cn1);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add("@CustomerID", TextCustomerID.Text);
            cmd1.Parameters.Add("@CustomerName",TextName.Text);
            cmd1.Parameters.Add("@Address",TextAddress.Text);
            cmd1.Parameters.Add("@ContactNumber",TextContactno.Text);
            cmd1.Parameters.Add("@Email", TextEmail.Text);

            int result = cmd1.ExecuteNonQuery();
            cn1.Close();

            if (result == 1)
            {
                Lblmsg.Text = "Record Updated Successfully";
            }
            //Response.Redirect("Cust_Profile.aspx");
        }
    }
}