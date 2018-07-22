<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/OnlineBanking.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OnlineBankingWebApplication.AdminSide.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style6
        {
            color: #FFFFFF;
            background-color: #214761;
        }
        .style7
        {
            width: 301px;
        }
        .style8
        {
            width: 289px;
        }
        .style9
        {
            width: 290px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center><h3>Welcome to Our National Bank of India</h3></center>
<br />
<div>
    <asp:Panel ID="Panel1" runat="server">
    <center>
       <strong>Search AccountNo</strong>:&nbsp;&nbsp;
        <asp:TextBox ID="TxtAccountNo" runat="server" MaxLength="8" TextMode="Number" 
            ></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button1" runat="server" BackColor="#325166" ForeColor="White" 
            Height="39px" Text="Search" Width="92px" 
            onclick="SearchAccoutTranBtn_Click" />
            <asp:Panel ID="Panel2" runat="server">
        </center>
            <hr />
    <center>
     <table border="2">
     <tr align="center">
     <td colspan="2">
     <h4>Customer Profile</h4>
     </td>
     </tr>
    <tr>
    <td class="style9">
        <strong><span class="style6">Customer Name:</span></strong></span><asp:Label 
            ID="LblCustomernm" runat="server" Text="" CssClass="fa-inverse"></asp:Label>
        <br/>
       <strong><span class="fa-inverse">Address:</span></strong><asp:Label ID="LblAddress" 
            runat="server" Text="" CssClass="style6"></asp:Label>
        <br class="style6"/>
        <strong><span class="fa-inverse">Contact Number:</span></strong><asp:Label ID="LblContactNumber" 
            runat="server" Text="" CssClass="style6"></asp:Label>
        <br class="style6" />
        <strong><span class="fa-inverse">Email:</span></strong><asp:Label ID="LblEmail" runat="server" 
            Text="" CssClass="style6"></asp:Label>

     </td>
      <td class="style9">
          <strong><span class="fa-inverse">User Name:</span></strong><asp:Label ID="LblUserName" 
              runat="server" Text="" CssClass="fa-inverse"></asp:Label>
        <br class="fa-inverse" />
          <strong><span class="fa-inverse">Password:</span></strong><asp:Label ID="LblPassword" 
              runat="server" Text="" CssClass="fa-inverse"></asp:Label>
        <br class="fa-inverse" />
          <strong><span class="fa-inverse">Branch Code:</span></strong><asp:Label ID="LblBranchCode" 
              runat="server" Text="" CssClass="fa-inverse"></asp:Label>
        <br class="fa-inverse"/>
          <strong><span class="fa-inverse">Branch Location:</span></strong><asp:Label ID="LblLocation" 
              runat="server" Text="" CssClass="fa-inverse"></asp:Label>
        <br class="fa-inverse"/>
          <strong><span class="fa-inverse">Total Balance:</span></strong><asp:Label ID="LblTotalBalance" 
              runat="server" Text="" CssClass="fa-inverse"></asp:Label>
     </td>

    </tr>
    </table> 
    </center>
    </asp:Panel>
        <hr />
        <h4>Customer Transction List</h4>
        <asp:GridView ID="GridView1" runat="server" BackColor="#325166" 
            BorderColor="Black" BorderWidth="2px" ForeColor="White" Width="965px" 
            AutoGenerateColumns="false" Height="193px"
            OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" /> 
                 <asp:BoundField DataField="AccountNo" HeaderText="AccountNo" /> 
                <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" />  
                <asp:BoundField DataField="TransactionType" HeaderText="TransactionType" />  
                <asp:BoundField DataField="Description" HeaderText="Description" />  
                <asp:BoundField DataField="Deposit" HeaderText="Deposit" />  
                <asp:BoundField DataField="Withdrawal" HeaderText="Withdrawal" />
                <asp:BoundField DataField="TotalBalance" HeaderText="TotalBalance" />
                <asp:TemplateField HeaderText="Edit">  
                   <ItemTemplate>  
                   <center>
                      <asp:LinkButton ID="LinkEdit" runat="server" Width="60" Text="Edit" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">
                         <span class="glyphicon glyphicon-edit"></span> 
                      </asp:LinkButton>
                      </center>
                   </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkDelete" runat="server" CommandName="DeleteButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    </ItemTemplate>
                 </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>   
</div>
</asp:Content>
