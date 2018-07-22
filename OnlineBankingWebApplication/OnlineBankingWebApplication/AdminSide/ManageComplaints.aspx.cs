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
    public partial class CustomerComplaints : System.Web.UI.Page
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
                if (!IsPostBack)
                {
                    SqlConnection cn = new SqlConnection(strcn);
                    cn.Open();
                    SqlCommand cmd = new SqlCommand("usp_ViewAllCompliants", cn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    GridViewManageComplaints.DataSource = dt;
                    GridViewManageComplaints.DataBind();
                    cn.Close();
                }
            }
        }

        protected void GridViewManageComplaints_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewManageComplaints.Rows[index];
                Response.Redirect("~/AdminSide/EditCustomerComplaints.aspx?ComplaintsID=" + row.Cells[0].Text);
            }
            if (e.CommandName == "DeleteButton")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewManageComplaints.Rows[index];
                int ComplaintsID = Convert.ToInt32(row.Cells[0].Text);
                ac.Delete_CustomerComplaintsList(ComplaintsID);
            }
        }

        protected void LinkBtnBackToProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminSide/Profile.aspx");
        }

    }
}