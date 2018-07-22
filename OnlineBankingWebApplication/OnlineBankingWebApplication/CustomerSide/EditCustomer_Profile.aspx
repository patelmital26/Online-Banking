<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="EditCustomer_Profile.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.EditUserProfile" %>
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
    <h4>Edit Customer Profile</h4>

     <span class="fa-inverse">Customer ID&nbsp; </span><asp:TextBox ID="TextCustomerID" Readonly="true"
            runat="server" Height="22px" Width="128px"></asp:TextBox>
    <br /><br />
        <span class="fa-inverse">Name&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextName" 
            runat="server" Height="22px" Width="128px"></asp:TextBox>
    <br /><br />
     <span class="fa-inverse">Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><asp:TextBox 
            ID="TextAddress" runat="server" TextMode="MultiLine" Height="22px" 
            Width="128px"></asp:TextBox>   
       <br /><br />
        <span class="fa-inverse">Contact No&nbsp;&nbsp; &nbsp;</span><asp:TextBox ID="TextContactno" 
            runat="server" MaxLength="11" Height="22px" Width="128px"></asp:TextBox>
       <br /><br />
       <span class="fa-inverse">Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><asp:TextBox 
            ID="TextEmail" runat="server" TextMode="Email" Height="22px" Width="128px"></asp:TextBox>
       <br /><br />
       <center>
           <asp:Button ID="BtnEdit" runat="server" Text="Update" BackColor="Black" 
               ForeColor="White" Height="34px" Width="70px" onclick="BtnEdit_Click" CssClass="btnprofile" />
           &nbsp;<br />
           <br />
           <asp:Label ID="Lblmsg" runat="server" ForeColor="White"></asp:Label>
       </center>
     </td>
    </tr>
    </table> 
    </center>
    </asp:Panel>
</asp:Content>
