using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OnlineBankingWebApplication.AdminSide
{
    public partial class Registration : System.Web.UI.Page
    {
        Admin_Customer ac = new Admin_Customer();
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            ac.UserName = Txtunm.Text;
            ac.Password = Txtpwd.Text;
            ac.CustomerName = TxtCustnm.Text;
            ac.Address = TxtAdd.Text;
            ac.ContactNumber = TxtContno.Text;
            ac.Email = TxtEmail.Text;
            ac.SecQuestion = DrplistSecQuestion.SelectedValue;
            ac.SecAnswer = TxtSecAnswer.Text;
            ac.Location = DrplistLocation.SelectedValue;
            if (DrplistLocation.SelectedValue == "Surat")
            {
                ac.BranchCode = "NBI674569";
            }
            else if (DrplistLocation.SelectedValue == "Nadiad")
            {
                ac.BranchCode = "NBI346564";
            }
            else if (DrplistLocation.SelectedValue == "Baroda")
            {
                ac.BranchCode = "NBI534565";
            }
            else if (DrplistLocation.SelectedValue == "Anand")
            {
                ac.BranchCode = "NBI235454";
            }
            ac.Insert_RegistrationInfo();
            Lblmsg.Text="Customer Registered Successfully";
            Txtunm.Text = String.Empty;
            Txtpwd.Text = String.Empty;
            TxtCustnm.Text = String.Empty;
            TxtAdd.Text = String.Empty;
            TxtContno.Text = String.Empty;
            TxtEmail.Text = String.Empty;
            TxtSecAnswer.Text = String.Empty;
        }
    }
}