<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSide/OnlineBanking.Master" AutoEventWireup="true" CodeBehind="ManageComplaints.aspx.cs" Inherits="OnlineBankingWebApplication.AdminSide.CustomerComplaints" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkBtnBackToProfile" runat="server" 
        PostBackUrl="~/AdminSide/Profile.aspx" onclick="LinkBtnBackToProfile_Click">Back To Profile</asp:LinkButton>
 <asp:Panel ID="Panel1" runat="server">
    <center>
    <br />
        <h3>Manage Customer Complaints</h3>
        <asp:GridView ID="GridViewManageComplaints" runat="server" BackColor="#325166" 
            BorderColor="Black" BorderWidth="2px" ForeColor="White" Width="1305px" 
            AutoGenerateColumns="false" Height="150px"
            OnRowCommand="GridViewManageComplaints_RowCommand">
            <Columns>
                <asp:BoundField DataField="ComplaintsID" HeaderText="Complaint ID" /> 
                <asp:BoundField DataField="AccountNo" HeaderText="Account No" /> 
                <asp:BoundField DataField="ComplaintDate" HeaderText="Complaint Date" />  
                <asp:BoundField DataField="TypeofComplaints" HeaderText="Complaint Description"/>  
                <asp:BoundField DataField="Status" HeaderText="Status" />  
                <asp:BoundField DataField="Email" HeaderText="Email" />  
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                <asp:BoundField DataField="LastModified" HeaderText="Last Modified Date" />
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
    </center>
    </asp:Panel>
    </asp:Content>
