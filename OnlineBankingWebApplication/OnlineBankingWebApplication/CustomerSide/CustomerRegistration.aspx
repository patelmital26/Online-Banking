<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.CustomerRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
    <center>
    <table>
    <tr>
    <td bgcolor="#214761">
    <h4>Customer Registration</h4>
        <i class="fa fa-user" style="font-size:20px;color:lightblue;">
        &nbsp;
        <asp:TextBox ID="Txtunm" runat="server" placeholder="Username" Height="30px" CssClass="Textbox"></asp:TextBox></i>
        <br /><br />
         <i class="fa fa-lock" style="font-size:20px;color:lightblue;">
         &nbsp;&nbsp;
        <asp:TextBox ID="Txtpwd" runat="server" placeholder="Password" 
            TextMode="Password" Height="30px"></asp:TextBox></i>
        <br /><br />
       <i class="fa fa-user" style="font-size:20px;color:lightblue;">
       &nbsp;
        <asp:TextBox ID="TxtCustnm" runat="server" placeholder="Customer Name" 
            Height="29px"></asp:TextBox></i>
        <br /><br />
         <i class="fa fa-home" style="font-size:20px;color:lightblue;">
         &nbsp;
         <asp:TextBox ID="TxtAdd" 
            runat="server" placeholder="Address" Height="30px"></asp:TextBox></i>
        <br /><br />
         <i class="fa fa-phone" style="font-size:20px;color:lightblue;">
         &nbsp;
        <asp:TextBox ID="TxtContno" runat="server" placeholder="Contact Number" 
            MaxLength="11" Height="30px"></asp:TextBox></i>
        <br /><br />
         <i class="fa fa-envelope" style="font-size:18px;color:lightblue;">
         &nbsp;
        <asp:TextBox ID="TxtEmail" runat="server" placeholder="Email" Height="30px"></asp:TextBox></i>
        <br /><br />

        <i class="fa fa-exclamation-circle" style="font-size:20px;color:lightblue;">
        &nbsp;
        <asp:DropDownList ID="DrplistSecQuestion" runat="server" Height="19px" 
            Width="185px">
            <asp:ListItem>What is your favorite Food?</asp:ListItem>
            <asp:ListItem>What is your favorite Resturant?</asp:ListItem>
            <asp:ListItem>What place you like to Visit?</asp:ListItem>
            <asp:ListItem>What is your mothers madien Name?</asp:ListItem>
        </asp:DropDownList></i>
        <br /><br />

         <i class="fa fa-pencil" style="font-size:20px;color:lightblue;">
         &nbsp;
        <asp:TextBox ID="TxtSecAnswer" runat="server" placeholder="Sec Answer" Height="30px"></asp:TextBox></i>
        <br /><br />

        <i class="fa fa-globe" style="font-size:20px;color:lightblue;">
        &nbsp;
        <asp:DropDownList ID="DrplistLocation" runat="server">
            <asp:ListItem>Nadiad</asp:ListItem>
            <asp:ListItem>Anand</asp:ListItem>
            <asp:ListItem>Baroda</asp:ListItem>
            <asp:ListItem>Surat</asp:ListItem>
        </asp:DropDownList></i>
        <br /><br />
        <br />
        &nbsp;&nbsp;
        <asp:Button ID="BtnRegister" runat="server" Text="Sign Up" 
            onclick="BtnRegister_Click" BackColor="Black" ForeColor="White" 
            Height="35px" CssClass="btnprofile" Width="118px" />
            
             <asp:Button ID="BtnLogin" runat="server" Text="Login" 
             BackColor="Black" ForeColor="White"  CssClass="btnprofile"
            Height="35px"  Width="68px" onclick="BtnLogin_Click" PostBackUrl="~/CustomerSide/CustomerLogin.aspx"/>
        
        <br /><br />
        <asp:Label ID="Lblmsg" runat="server" ForeColor="White"></asp:Label>
    </td>
    </tr>
    </table>
    </center>
    </asp:Panel>
</asp:Content>
