<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/OnlineBanking.Master" AutoEventWireup="true" CodeBehind="EditCustomerTransaction.aspx.cs" Inherits="OnlineBankingWebApplication.AdminSide.EditCustomerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkBtnBackToProfile" runat="server" PostBackUrl="~/AdminSide/Profile.aspx">Back To Profile</asp:LinkButton>
 <asp:Panel ID="Panel1" runat="server">
    <center>
     <div>    
   <table>   
   <tr>
   <td  align="center" colspan="2">
   <h4>Edit Customer Transaction</h4>   
   </td>
   </tr> 
       <tr> 
           <td class="fa-inverse">Transaction ID</td>    
           <td>    
               <asp:TextBox ID="txtTransactionID" runat="server" ReadOnly="true" />    
           </td>    
       </tr> 
       <tr> 
           <td class="fa-inverse">Account No</td>    
           <td>    
               <asp:TextBox ID="txtAccountNo" runat="server" ReadOnly="true" />    
           </td>    
       </tr>     
       <tr>    
           <td class="fa-inverse">Transaction Date</td>    
           <td>    
               <asp:TextBox ID="txtTransactionDate" runat="server" />    
           </td>    
       </tr>    
       <tr>    
           <td><span class="fa-inverse">Transaction Type</span></td>    
           <td>    
               <asp:TextBox ID="txtTransactionType" runat="server" />    
           </td>    
       </tr>    
       <tr>    
           <td class="fa-inverse">Description</td>    
           <td>    
               <asp:TextBox ID="txtDescription" runat="server" />    
           </td>    
       </tr>    
       <tr>    
           <td class="fa-inverse">Deposit</td>    
           <td>    
               <asp:TextBox ID="txtDeposit" runat="server" />    
           </td>    
       </tr> 
       <tr>    
           <td class="fa-inverse">Withdrawal</td>    
           <td>    
               <asp:TextBox ID="txtWithdrawal" runat="server" />    
           </td>    
       </tr> 
       <tr>    
           <td align="center" colspan="2">    
               <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                   onclick="btnUpdate_Click"/>    
               &nbsp;&nbsp;   
               <asp:Button ID="btnCancel" runat="server" Text="Cancel"/>    
               &nbsp;<br />
               <asp:Label ID="Lblmsg" runat="server" ForeColor="Red"></asp:Label>
           </td>    
       </tr>    
   </table>    
   </div>   
    </center>
    </asp:Panel>
</asp:Content>
