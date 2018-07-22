<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/OnlineBanking.Master" AutoEventWireup="true" CodeBehind="EditCustomerComplaints.aspx.cs" Inherits="OnlineBankingWebApplication.AdminSide.EditCustomerComplaints" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            color: #ffffff;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
        }
    </style>
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
   <h4>Update Customer Complaints</h4>   
   </td>
   </tr> 
       <tr> 
           <td class="style1">Complaints ID</td>    
           <td>    
               <asp:TextBox ID="txtComplaintsID" runat="server" ReadOnly="true" />    
           </td>    
       </tr> 
       <tr> 
           <td class="style1">Account No</td>    
           <td>    
               <asp:TextBox ID="txtAccountNo" runat="server" ReadOnly="true" />    
           </td>    
       </tr>     
       <tr>    
           <td class="style1">Complaint Date</td>    
           <td>    
               <asp:TextBox ID="txtComplaintDate" runat="server" />    
           </td>    
       </tr>    
       <tr>    
           <td class="style2"><span class="style1">Type of Complaints</span></td>    
           <td>    
               <asp:TextBox ID="txtTypeofComplaints" runat="server" />    
           </td>    
       </tr>    
       <tr>    
           <td class="style1">Status</td>    
           <td>    
               <asp:DropDownList ID="DropStatus" runat="server">
                   <asp:ListItem>Pending</asp:ListItem>
                   <asp:ListItem>In Progress</asp:ListItem>
                   <asp:ListItem>Completed</asp:ListItem>
               </asp:DropDownList>
           </td>    
       </tr>    
       <tr>    
           <td class="style1">Email</td>    
           <td>    
               <asp:TextBox ID="txtEmail" runat="server" />    
           </td>    
       </tr> 
       <tr>    
           <td class="style1">Contact Number</td>    
           <td>    
               <asp:TextBox ID="txtContactNo" runat="server" />    
           </td>    
       </tr> 
         <tr>    
           <td class="style1">Last Modified Date</td>    
           <td>    
               <asp:TextBox ID="txtLastModifiedDate" runat="server" />    
           </td>    
       </tr> 
       <tr>    
           <td align="center" colspan="2">    
               <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                   onclick="btnUpdate_Click"/>    
               &nbsp;&nbsp;   
               <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                   onclick="btnCancel_Click"/>    
               &nbsp;<br />
               <asp:Label ID="Lblmsg" runat="server" ForeColor="Red"></asp:Label>
           </td>    
       </tr>    
   </table>    
   </div>   
    </center>
    </asp:Panel>
</asp:Content>
