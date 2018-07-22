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
          <span class="glyphicon glyphicon-user"></span>
        <asp:TextBox ID="Txtunm" runat="server" placeholder="Username" Height="30px"></asp:TextBox>
        <br /><br />
        <span class="glyphicon glyphicon-lock"></span>
        <asp:TextBox ID="Txtpwd" runat="server" placeholder="Password" 
            TextMode="Password" Height="30px"></asp:TextBox>
        <br /><br />
        <span class="glyphicon glyphicon-user"></span>
        <asp:TextBox ID="TxtCustnm" runat="server" placeholder="Customer Name" 
            Height="29px"></asp:TextBox>
        <br /><br />
         <span class="glyphicon glyphicon-home"></span><asp:TextBox ID="TxtAdd" 
            runat="server" placeholder="Address" Height="30px"></asp:TextBox>
        <br /><br />
        <span class="glyphicon glyphicon-phone"></span>
        <asp:TextBox ID="TxtContno" runat="server" placeholder="Contact Number" 
            MaxLength="11" Height="30px"></asp:TextBox>
        <br /><br />
        <span class="glyphicon glyphicon-envelope"></span>
        <asp:TextBox ID="TxtEmail" runat="server" placeholder="Email" Height="30px"></asp:TextBox>
        <br /><br />

        <span class="glyphicon glyphicon-question-sign"></span> 
        <asp:DropDownList ID="DrplistSecQuestion" runat="server">
            <asp:ListItem>What is your favorite Food?</asp:ListItem>
            <asp:ListItem>What is your favorite Resturant?</asp:ListItem>
            <asp:ListItem>What place you like to Visit?</asp:ListItem>
            <asp:ListItem>What is your mother&#39;s madien Name?</asp:ListItem>
        </asp:DropDownList>
        <br /><br />

        <span class="glyphicon glyphicon-pencil"></span>
        <asp:TextBox ID="TxtSecAnswer" runat="server" placeholder="Sec Answer" Height="30px"></asp:TextBox>
        <br /><br />

        <span class="glyphicon glyphicon-globe"></span>
        <asp:DropDownList ID="DrplistLocation" runat="server">
            <asp:ListItem>Nadiad</asp:ListItem>
            <asp:ListItem>Anand</asp:ListItem>
            <asp:ListItem>Baroda</asp:ListItem>
            <asp:ListItem>Surat</asp:ListItem>
        </asp:DropDownList>
        <br /><br />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="BtnRegister" runat="server" Text="Sign Up" 
            onclick="BtnRegister_Click" BackColor="Black" ForeColor="White" 
            Height="35px" />
            &nbsp;
             <asp:Button ID="BtnLogin" runat="server" Text="Login" 
             BackColor="Black" ForeColor="White" 
            Height="35px"  Width="68px" onclick="BtnLogin_Click" PostBackUrl="~/CustomerSide/CustomerLogin.aspx"/>
        
        <br />
        <asp:Label ID="Lblmsg" runat="server" ForeColor="#FF5050"></asp:Label>
    </td>
    </tr>
    </table>
    </center>
    </asp:Panel>
</asp:Content>
