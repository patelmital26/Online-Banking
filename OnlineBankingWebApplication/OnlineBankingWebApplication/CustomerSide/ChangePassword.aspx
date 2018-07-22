<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.ChangePassword1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <br />
    <asp:LinkButton ID="LnkbtnBacktoCustProfile" runat="server" 
        onclick="LnkbtnBacktoUserProfile_Click">Back To Customer Profile</asp:LinkButton>
    <asp:Panel ID="Panel1" runat="server">
    <center>
    <table border="2">
    <tr>
    <td>
    <h4>Change Password</h4>
        <span class="fa-inverse"><strong>Security Question:</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="Dropsecquestion" runat="server">
            <asp:ListItem>What is your favorite food?</asp:ListItem>
            <asp:ListItem>What is your favorite Resturant?</asp:ListItem>
            <asp:ListItem>What place you like to visit?</asp:ListItem>
            <asp:ListItem Value="What is your mother's madien name? ">What is your mother </asp:ListItem>
         </asp:DropDownList>
         <br /><br class="fa-inverse" />
         <span class="fa-inverse"><strong>Security Answer</strong>:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="Txtsecanswer" runat="server"></asp:TextBox>
         <br /><br class="fa-inverse" />
         <center>
         <span class="fa-inverse"><strong>New Password</strong>:</span><asp:TextBox 
                 ID="Txtnewpwd" runat="server" TextMode="Password"></asp:TextBox>
         <br /><br class="fa-inverse" />
         <asp:Button ID="BtnChangepwd" runat="server" Text="Change Password" Height="32px" 
                 Width="126px" BackColor="Black" ForeColor="White" 
                 onclick="BtnChangepwd_Click" CssClass="btnprofile"/>
             <br />
             <br />
             <asp:Label ID="Lblmsg" runat="server" ForeColor="White"></asp:Label>
             <br />
         </center>
</td>
</tr>
</table>
</center>
</asp:Panel>
</asp:Content>
