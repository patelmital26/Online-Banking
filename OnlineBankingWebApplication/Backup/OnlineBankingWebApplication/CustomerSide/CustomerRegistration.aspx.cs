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
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        User u = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            u.UserName = Txtunm.Text;
            u.Password = Txtpwd.Text;
            u.CustomerName = TxtCustnm.Text;
            u.Address = TxtAdd.Text;
            u.ContactNumber = TxtContno.Text;
            u.Email = TxtEmail.Text;
            u.SecQuestion = DrplistSecQuestion.SelectedValue;
            u.SecAnswer = TxtSecAnswer.Text;
            u.Location = DrplistLocation.SelectedValue;
            if (DrplistLocation.SelectedValue == "Surat")
            {
                u.BranchCode = "NBI674569";
            }
            else if (DrplistLocation.SelectedValue == "Nadiad")
            {
                u.BranchCode = "NBI346564";
            }
            else if (DrplistLocation.SelectedValue == "Baroda")
            {
                u.BranchCode = "NBI534565";
            }
            else if(DrplistLocation.SelectedValue == "Anand")
            {
                u.BranchCode = "NBI235454";
            }
            u.Insert_RegistrationInfo();
            Lblmsg.Text = "Customer Successfully Registered!";
            Txtunm.Text = "";
            Txtpwd.Text = "";
            TxtCustnm.Text = "";
            TxtAdd.Text = "";
            TxtContno.Text = "";
            TxtEmail.Text = "";
            TxtSecAnswer.Text = "";
            
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            
            int CustomerID = 0;
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_UserLogin", cn);
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Username", Txtunm.Text);
                cmd.Parameters.Add("@Password", Txtpwd.Text);

                CustomerID = Convert.ToInt32(cmd.ExecuteScalar());
            }
            if (CustomerID == -1 || CustomerID == 0)
            {
                Lblmsg.Text = "Username or password is incorrect.";
            }
            else
            {
                Response.Redirect("Cust_Profile.aspx?CustomerID=" + CustomerID);
            }
        }
        }
    }
