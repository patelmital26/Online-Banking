<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/OnlineBanking.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineBankingWebApplication.AdminSide.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
    <center>
    <table border="2">
    <tr>
    <td>
    <h2>Online Banking</h2>
        <span class="glyphicon glyphicon-user"></span><asp:TextBox ID="Txtusernm" runat="server" placeholder="Username"></asp:TextBox>
        <br /><br />
        <span class="glyphicon glyphicon-lock"></span><asp:TextBox ID="Txtpwd" runat="server" placeholder="Password" 
            TextMode="Password"></asp:TextBox>
        <br /><br />
        <center>
            <asp:Button ID="BtnLogin" runat="server" Text="Login" 
            onclick="BtnLogin_Click" BackColor="Black" ForeColor="White" Height="35px" 
                Width="59px"/>
        </center>
        
        <asp:Label ID="Lblmsg" runat="server" ForeColor="Red"></asp:Label>
    </td>
    </tr>
    </table>
    </center>
    </asp:Panel>
</asp:Content>
