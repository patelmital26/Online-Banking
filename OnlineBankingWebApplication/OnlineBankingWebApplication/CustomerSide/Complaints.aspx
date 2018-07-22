<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.Complaints" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
   <asp:LinkButton ID="LnkbtnBacktoCustProfile" runat="server" 
        onclick="LnkbtnBacktoCustProfile_Click">Back To Customer Profile</asp:LinkButton>
    <asp:Panel ID="Panel1" runat="server">
    <center>
    <table border="2">
    <tr>
    <td>
    <h4>Complaints</h4>
    <br />
        <span class="fa-inverse">Email Address: &nbsp; </span>
        <asp:TextBox ID="TextEmailAdd" runat="server" CssClass="fa-inverse" 
            placeholder="Enter Email" ForeColor="Black" MaxLength="25" 
            TextMode="Email"></asp:TextBox>
        <br class="fa-inverse" />
        <br />
        <span class="fa-inverse">Enter Phone: </span>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextPhoneno" runat="server" placeholder="Enter phone" 
            ForeColor="Black" MaxLength="11"></asp:TextBox>
        <br /><br />
        <span class="fa-inverse">Complaints:</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropComplaints" runat="server" Height="40px" 
            Width="175px">
            <asp:ListItem>Money Transfer Problem</asp:ListItem>
            <asp:ListItem>Deposit Problem</asp:ListItem>
            <asp:ListItem>Unable to View Account Balance</asp:ListItem>
            <asp:ListItem>Transaction History Problem</asp:ListItem>
            <asp:ListItem>Unable to Change Password</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <span class="fa-inverse">Account No:</span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropAccountNo" runat="server" AutoPostBack="True">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <center>
        <asp:Button ID="Btnsubmit" runat="server" Text="Submit" BackColor="Black" 
            ForeColor="White" Height="33px" Width="80px" onclick="Btnsubmit_Click" CssClass="btnprofile" />
            <br />
            <br />
            <asp:Label ID="Lblmsg" runat="server" ForeColor="White"></asp:Label>
         </center>
        </td>
        </tr>
        </table>
        </center>
    </asp:Panel>
</asp:Content>
