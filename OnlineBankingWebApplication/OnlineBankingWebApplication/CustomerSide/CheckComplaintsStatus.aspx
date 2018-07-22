<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="CheckComplaintsStatus.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.BillPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
      <asp:LinkButton ID="LnkbtnBacktoCustProfile" runat="server" 
          onclick="LnkbtnBacktoCustProfile_Click">Back To Customer Profile</asp:LinkButton>
    <br />
    <center>
     <h3>Complaints Status</h3>
    <br /><br />
      Select Account No: 
    <asp:DropDownList ID="DropAccountNo" runat="server" 
        Height="30px" Width="120px" AutoPostBack="True">
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:Button ID="BtnStatus" runat="server" Text="Check Compliants Status" 
            BackColor="Black" ForeColor="White" Height="33px" Width="173px" 
        onclick="BtnStatus_Click" style="font-weight: 700" CssClass="btnprofile"/>
        <br />
        <br />
        <asp:Label ID="LblMessage" runat="server" ForeColor="blue"></asp:Label>
        </center>
        <hr />
           <center>
        <asp:GridView ID="GridViewCheckComplaints" runat="server" BackColor="#325166" 
            BorderColor="Black" BorderWidth="2px" ForeColor="White" Width="1226px" 
            AutoGenerateColumns="false" Height="150px"
            onselectedindexchanged="GridViewCheckComplaints_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ComplaintsID" HeaderText="Complaint ID" /> 
                <asp:BoundField DataField="AccountNo" HeaderText="Account No" /> 
                <asp:BoundField DataField="ComplaintDate" HeaderText="Complaint Date" />  
                <asp:BoundField DataField="TypeofComplaints" HeaderText="Complaint Description"/>  
                <asp:BoundField DataField="Status" HeaderText="Status" />  
                <asp:BoundField DataField="Email" HeaderText="Email" />  
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                <asp:BoundField DataField="LastModified" HeaderText="Last Modified Date" />
            </Columns>
        </asp:GridView>
    </center>
</asp:Content>
