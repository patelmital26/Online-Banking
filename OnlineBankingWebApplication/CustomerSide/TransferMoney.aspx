<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="TransferMoney.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.TransferMoney" %>
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
    <h4>Transfer Money</h4>
        <span class="fa-inverse"><strong>Transfer from:</strong></span>
        <asp:DropDownList ID="DropTransferFrom" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropTransferFrom_SelectedIndexChanged">
        </asp:DropDownList>
    <br class="fa-inverse" /><br class="fa-inverse" />
        <span class="fa-inverse"><strong>Transfer To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></span><asp:DropDownList 
            ID="DropTransferTo" runat="server" 
    style="margin-left: 0px" AutoPostBack="True" 
            onselectedindexchanged="DropTransferTo_SelectedIndexChanged">
    </asp:DropDownList>
    <br /><br class="fa-inverse" />
        <span class="fa-inverse"><strong>Amount:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></span>
        <asp:TextBox ID="TextAmount" runat="server" Width="80px" TextMode="Number" 
            ontextchanged="TextAmount_TextChanged"></asp:TextBox>
        <br /><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextAmount" ErrorMessage="Amount Field is Required" 
            ForeColor="Red"></asp:RequiredFieldValidator>
    <center>    
    <asp:Button ID="BtnTransfer" runat="server" Text="Transfer" BackColor="Black" 
            ForeColor="White" Height="32px" Width="71px" onclick="BtnTransfer_Click" />
    <br />
    <asp:Label ID="Lblmsg" runat="server" Text=""></asp:Label>
    </center>
    </td>
    </tr>
    </table>
    </center>
    </asp:Panel>
</asp:Content>
