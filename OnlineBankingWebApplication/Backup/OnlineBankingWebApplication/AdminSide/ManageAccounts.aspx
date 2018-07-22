<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/OnlineBanking.Master" AutoEventWireup="true" CodeBehind="ManageAccounts.aspx.cs" Inherits="OnlineBankingWebApplication.AdminSide.ManageAccounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkBtnBackToProfile" runat="server" PostBackUrl="~/AdminSide/Profile.aspx">Back To Profile</asp:LinkButton> 
     <asp:Panel ID="Panel1" runat="server">
    <center>
    <table border="2">
    <tr>
    <td>
    <h2>Manage Accounts</h2>
        <span class="fa-inverse">Account No &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <asp:DropDownList 
            ID="DropAccountNo" runat="server" AutoPostBack="true"
        Height="25px" onselectedindexchanged="DropAccountNo_SelectedIndexChanged" 
            Width="95px">
            
    </asp:DropDownList>
    <br />
        <span class="fa-inverse"> Customer Name
         </span>&nbsp;
        <asp:TextBox ID="TextCustomerName" 
        runat="server" Height="23px" ReadOnly="true" Width="95px"></asp:TextBox>
    <br />
        <span class="fa-inverse"> Total Balance
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <asp:TextBox ID="TextTotalBalance" 
        runat="server" Height="23px" ReadOnly="true" Width="96px"></asp:TextBox>
    <br />
        <span class="fa-inverse">Amount </span>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp
        <asp:TextBox ID="TextAmount" 
        runat="server" Height="23px" Width="95px" TextMode="Number"></asp:TextBox>
        <br />
        <span class="fa-inverse">Transaction Type</span>&nbsp;<asp:DropDownList 
            ID="DropTranType" runat="server" Height="25px" Width="95px">
            <asp:ListItem>Cash</asp:ListItem>
            <asp:ListItem>Check payment</asp:ListItem>
            <asp:ListItem>Bank Transfer</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextAmount" ErrorMessage="Amount Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
    <center>
    <asp:Button ID="BtnWithdrawal" runat="server" Text="Withdrawal" BackColor="Black" 
            ForeColor="White" onclick="BtnWithdrawal_Click"/>
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="BtnDeposit" runat="server" Text="Deposit" BackColor="Black" 
            ForeColor="White" onclick="BtnDeposit_Click" />
        <br />
        <asp:Label ID="Lblmsg" runat="server" ForeColor="#FF5050"></asp:Label>
    </center>
</td>
</tr>
</table>
</center>
</asp:Panel>
</asp:Content>
