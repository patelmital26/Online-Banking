﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace OnlineBankingWebApplication.AdminSide
{
    public class Admin_Customer
    {

        string strcn = ConfigurationManager.ConnectionStrings["OnlineBankingDbconnect"].ConnectionString;
        //String strcn = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\Mittal\Desktop\OnlineBankingWebApplication\OnlineBankingWebApplication\App_Data\OnlineBanking.mdf;Integrated Security=True;User Instance=True";
        public int CustomerId { get; set; }
        public int AccountNo { get; set; }
        public int TransactionID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string CustomerName { get; set; }
        public string Address { get; set; }
        public string ContactNumber { get; set; }
        public string Email { get; set; }
        public int LoginID { get; set; }
        public string SecQuestion { get; set; }
        public string SecAnswer { get; set; }
        public string BranchCode { get; set; }
        public string Location { get; set; }
       
        public void Insert_RegistrationInfo()
        {

            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_InsertCustomerDetails", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserName", UserName);
            cmd.Parameters.Add("@Password", Password);
            cmd.Parameters.Add("@CustomerName", CustomerName);
            cmd.Parameters.Add("@Address", Address);
            cmd.Parameters.Add("@ContactNumber", ContactNumber);
            cmd.Parameters.Add("@Email", Email);
            cmd.Parameters.Add("@SecQuestion", SecQuestion);
            cmd.Parameters.Add("@SecAnswer", SecAnswer);
            cmd.Parameters.Add("@BranchCode", BranchCode);
            cmd.Parameters.Add("@Location", Location);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public DataTable Cutomer_Display(string AccountNo)
        {
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_CustomerTransctionList", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@AccountNo", AccountNo);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            cn.Close();
            return dt;
        }

        public DataTable EditCutomer_TransactionList()
        {
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_EditCustomerTransactionList", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TransactionID", TransactionID);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            cn.Close();
            return dt;
        }

        public void Delete_CustomerTransctionList(int TransactionID)
        {

            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_DeleteCustomerTransactionList", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TransactionID", TransactionID);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public DataTable EditCutomer_Profile()
        {
            SqlConnection cn = new SqlConnection(strcn);
            cn.Open();
            SqlCommand cmd = new SqlCommand("usp_EditCustomerProfile", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CustomerID",CustomerId);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            cn.Close();
            return dt;
        }
    }
}


