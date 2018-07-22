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
    public partial class TransferMoney : System.Web.UI.Page
    {
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        //String strcn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mittal\Desktop\OnlineBankingWebApplication\OnlineBankingWebApplication\App_Data\OnlineBanking.mdf;Integrated Security=True;User Instance=True";
        protected void Page_Load(object sender, EventArgs e)
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
                        DropTransferFrom.DataSource = reader1;
                        DropTransferFrom.DataTextField = "AccountNo";
                        DropTransferFrom.DataValueField = "AccountNo";
                        DropTransferFrom.DataBind();
                    }
                    cn1.Close();

                    SqlConnection cn2 = new SqlConnection(strcn);
                    cn2.Open();
                    SqlCommand cmd2 = new SqlCommand("usp_GetCustomerAccountList", cn2);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.Add("@CustomerID", CustomerID);

                    SqlDataReader reader2 = cmd2.ExecuteReader();
                    if (reader2.HasRows)
                    {
                        DropTransferTo.DataSource = reader2;
                        DropTransferTo.DataTextField = "AccountNo";
                        DropTransferTo.DataValueField = "AccountNo";
                        DropTransferTo.DataBind();
                    }
                    cn2.Close();
                }
                if (DropTransferFrom.SelectedValue != null)
                {
                    int i = DropTransferFrom.Items.Count;
                    for (int j = 0; j < i; j++)
                    {
                        if (DropTransferFrom.Items[j].Selected == true)
                        {
                            DropTransferTo.Items.Remove(DropTransferFrom.Items[j].ToString());
                            i--;
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("CustomerLogin.aspx");
            }

        }

        protected void BtnTransfer_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_TransferMoney", cn);
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TransferFrom", DropTransferFrom.SelectedValue);
                cmd.Parameters.Add("@TransferTo", DropTransferTo.SelectedValue);
                cmd.Parameters.Add("@Amount", TextAmount.Text);
                cmd.Parameters.Add("@text", SqlDbType.VarChar, 50);
                cmd.Parameters["@text"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
            }
            if (cmd.Parameters["@text"].Value.ToString() == "FAILED!")
            {
                Lblmsg.Text = "Transfer Failed due to Insufficent Balance ";
            }
            else
            {
                Lblmsg.Text = "Transfer Money Sucessfully!";
            } 
        }

        protected void DropTransferFrom_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropTransferFrom.SelectedValue != null)
            {
                string CustomerID = Request.QueryString["CustomerID"];
                DropTransferTo.Items.Clear();
                SqlConnection cn2 = new SqlConnection(strcn);
                cn2.Open();
                SqlCommand cmd2 = new SqlCommand("usp_GetCustomerAccountList", cn2);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.Add("@CustomerID", CustomerID);

                SqlDataReader reader2 = cmd2.ExecuteReader();
                if (reader2.HasRows)
                {
                    DropTransferTo.DataSource = reader2;
                    DropTransferTo.DataTextField = "AccountNo";
                    DropTransferTo.DataValueField = "AccountNo";
                    DropTransferTo.DataBind();
                }
                cn2.Close();

                int i = DropTransferFrom.Items.Count;
                for (int j = 0; j < i; j++)
                {
                    if (DropTransferFrom.Items[j].Selected == true)
                    {
                        DropTransferTo.Items.Remove(DropTransferFrom.Items[j].ToString());
                        i--;
                    }
                }
            } 
        }

        protected void DropTransferTo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LnkbtnBacktoUserProfile_Click(object sender, EventArgs e)
        {
            string CustomerID = Request.QueryString["CustomerID"];
            Response.Redirect("Cust_Profile.aspx?CustomerID=" + CustomerID);
        }

        protected void TextAmount_TextChanged(object sender, EventArgs e)
        {
            if (TextAmount.Text != null)
            {
                BtnTransfer.Enabled = true;
            }
            else
            {
                BtnTransfer.Enabled = false;
            }
        }
    }
}