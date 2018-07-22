<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="Cust_Profile.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.Cust_Profile" EnableViewState="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class= "general-container display-table">
    <div class="profile-left column">
		<div class= "quickLink-box">
			<div class="boxtitle">Quick Links </div>
			<hr>
            <ul>
			  <li>
                  <asp:LinkButton ID="LinkBtnEditCustomerProfile" runat="server" 
                      onclick="LinkBtnEditCustomerProfile_Click">Edit Customer Profile</asp:LinkButton>
			  <li> 
                  <asp:LinkButton ID="LinkBtnTransferMoney" runat="server" 
                      onclick="LinkBtnTransferMoney_Click">Transfer Money</asp:LinkButton>
			  <li> 
                  <asp:LinkButton ID="LinkBtnForgotPwd" runat="server" 
                      onclick="LinkBtnChangePwd_Click">Change Password</asp:LinkButton>
			  <li>
                  <asp:LinkButton ID="LinkBtnLogout" runat="server" onclick="LinkBtnLogout_Click">Logout</asp:LinkButton>
			</ul>

		</div>
	</div>
    <div class="profile-right column">
	    <div class= "customerDetails-box">
		        <div class="boxtitle">WELCOME, <asp:Label ID="LblCustnm" runat="server" Text="Label"></asp:Label></div>
           </div>
		   <hr>
		   <div class="display-table">
				   <div class= "customerDetailsLeft-box column">
				       <ul>
					      <li><i class="fa fa-globe" aria-hidden="true"></i>
                               Address:<asp:Label ID="LblAdd" runat="server" Text="" CssClass="label"></asp:Label></li>
					      <li> <i class="fa fa-phone" aria-hidden="true"></i>
						       Phone No: <asp:Label ID="LblPhoneno" runat="server" Text="" CssClass="label"></asp:Label></li>
					      <li> <i class="fa fa-envelope-o" aria-hidden="true"></i>
					           Email: <asp:Label ID="LblEmail" runat="server" Text="" CssClass="label"></asp:Label></li>
					    </ul>
			        </div>
				 
			     <div class= "customerDetailsMiddle-box column verticalLine">
                        <label>Select Account No:&nbsp; </label>
                             &nbsp;<asp:DropDownList ID="DropAccountNo" 
                            runat="server" onselectedindexchanged="DropAccountNo_SelectedIndexChanged">
                        </asp:DropDownList>
                        <div class="select"> 
                             </select> 
                        </div>
                        <div class="input">
                            <asp:Button ID="BtnAccountDetails" runat="server" Text="View Account Details" 
                                onclick="BtnAccountDetails_Click" BackColor="Black" ForeColor="White" 
                                Height="42px" 
                                style="font-family: Rockwell; font-weight: 700; font-size: small" />
                        </div>
                        <label><strong>Branch Location: </strong></label>
                            <asp:DropDownList ID="DropListLocation" runat="server" CssClass="label" 
                            Height="20px">
                                <asp:ListItem>Anand</asp:ListItem>
                                <asp:ListItem>Nadiad</asp:ListItem>
                                <asp:ListItem>Baroda</asp:ListItem>
                                <asp:ListItem>Surat</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<div class="select">
                            </select> 
                       </div>  
                       <div class="input">
                           <asp:Button ID="BtnOpennewAccount" runat="server" Text="Open New Account" 
                               BackColor="Black" ForeColor="White" Height="41px" 
                               style="font-family: Rockwell; font-size: small; font-weight: 700" 
                               onclick="BtnOpennewAccount_Click" />
                       </div>
			   </div>
				   <div class= "customerDetailsRight-box column verticalLine">
				          <ul>
					          <li> <i class="fa fa-money" aria-hidden="true"></i> 
					          Total Balance: 
                              <asp:Label ID="LblTotalBalance" runat="server" Text="" CssClass="label"></asp:Label></li>
					          <li> <i class="fa fa-university" aria-hidden="true"></i> 
					          Branch Code:
                              <asp:Label ID="LblBranchCode" runat="server" Text="" CssClass="label"></asp:Label></li>
					          <li> <i class="fa fa-globe" aria-hidden="true"></i>
					          Branch Location: 
                              <asp:Label ID="LblBranchLocation" runat="server" Text="" CssClass="label"></asp:Label> </li>
					      </ul>
                    </div>
                    </div>
		   </div>
		</div>
    <div class="container">
        <div class='col-md-12'>
            <hr />
                <asp:GridView ID="GridView1" runat="server" ForeColor="White" 
                AutoGenerateColumns="false">
                <Columns>
                <asp:TemplateField HeaderText="TransactionDate">
                <ItemTemplate>
                <%#Eval("TransactionDate")%>
                </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="TransactionType">
                <ItemTemplate>
                <%#Eval("TransactionType")%>
                </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                <%#Eval("Description")%>
                </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Deposit">
                <ItemTemplate>
                <%#Eval("Deposit")%>
                </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Withdrawal">
                <ItemTemplate>
                <%#Eval("Withdrawal")%>
                </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Total Balance">
                <ItemTemplate>
                <%#Eval("TotalBalance")%>
                </ItemTemplate>
                </asp:TemplateField>
                </Columns>
                </asp:GridView>

        </div>
    </div>
</asp:Content>
