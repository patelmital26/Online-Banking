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
    public partial class EditCustomerComplaints : System.Web.UI.Page
    {
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["AdminId"] as string))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string ComplaintsID = Request.QueryString["ComplaintsID"];
                if (ComplaintsID != null)
                {
                    if (!IsPostBack)
                    {
                        SqlConnection cn = new SqlConnection(strcn);
                        cn.Open();
                        SqlCommand cmd = new SqlCommand("usp_EditCustomerComplaintsList", cn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@ComplaintsID", ComplaintsID);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            reader.Read();
                            txtComplaintsID.Text = Convert.ToString(reader["ComplaintsID"]);
                            txtAccountNo.Text = Convert.ToString(reader["AccountNo"]);
                            txtLastModifiedDate.Text = Convert.ToString(reader["LastModified"]);
                            txtTypeofComplaints.Text = Convert.ToString(reader["TypeofComplaints"]);
                            DropStatus.SelectedValue = Convert.ToString(reader["Status"]);
                            txtEmail.Text = Convert.ToString(reader["Email"]);
                            txtContactNo.Text = Convert.ToString(reader["ContactNumber"]);
                            txtComplaintDate.Text = Convert.ToString(reader["ComplaintDate"]);
                        }
                        cn.Close();
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection cn1 = new SqlConnection(strcn);
            cn1.Open();
            SqlCommand cmd1 = new SqlCommand("usp_UpdateCompliantStatus", cn1);
            cmd1.CommandType = CommandType.StoredProcedure;

            cmd1.Parameters.Add("@ComplaintsID", txtComplaintsID.Text);
            cmd1.Parameters.Add("@AccountNo", txtAccountNo.Text);
            cmd1.Parameters.Add("@ComplaintDate", txtComplaintDate.Text);
            cmd1.Parameters.Add("@TypeofComplaints", txtTypeofComplaints.Text);
            cmd1.Parameters.Add("@Status", DropStatus.SelectedValue);
            cmd1.Parameters.Add("@Email", txtEmail.Text);
            cmd1.Parameters.Add("@ContactNumber", txtContactNo.Text);
            cmd1.Parameters.Add("@LastModified", txtLastModifiedDate.Text);

            int result = cmd1.ExecuteNonQuery();
            cn1.Close();

            if (result == 1)
            {
                Lblmsg.Text = "Record Updated Successfully";
            }
            Response.Redirect("Profile.aspx");

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageComplaints.aspx");
        }
    }
}