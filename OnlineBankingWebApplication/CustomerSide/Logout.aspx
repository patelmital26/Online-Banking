<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Login Again..!</h3>
<asp:Panel ID="Panel1" runat="server">
    <center>
    <table border="2">
    <tr>
    <td bgcolor="#214761">
    <h4>Online Banking</h4>
        <span class="glyphicon glyphicon-user"></span><asp:TextBox ID="Txtusernm" 
            runat="server" placeholder="Username" Height="30px"></asp:TextBox>
        <br /><br />
        <span class="glyphicon glyphicon-lock"></span><asp:TextBox ID="Txtpwd" 
            runat="server" placeholder="Password" 
            TextMode="Password" Height="30px"></asp:TextBox>
        <br /><br />
        <center>
            <asp:Button ID="BtnLogin" runat="server" Text="Login" BackColor="Black" 
                ForeColor="White" Height="31px" Width="64px" onclick="BtnLogin_Click" />
        </center>
        
        <asp:Label ID="Lblmsg" runat="server" ForeColor="Red"></asp:Label>
    </td>
    </tr>
    </table>
    </center>
    </asp:Panel>
</asp:Content>
