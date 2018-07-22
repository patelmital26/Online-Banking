<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerSide/OnlineBanking_Customer.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OnlineBankingWebApplication.CustomerSide.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="content">
	<div class="full-width-container block-1">
		<div class="camera_container">
			<div id="camera_wrap">
				<div class="item" data-src="images/slider_img2.jpg">
					<div class="camera_caption fadeIn">
						<h3 style="color:#b8ced8;">Take Charge Of Your Money With 24/7 Access</h3>
						<center><b style="color:#b8ced8;">Contact Us by</b></center>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-envelope-o"></span></a>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-phone"></span></a>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-map-marker"></span></a>
					</div>
				</div>
				<div class="item" data-src="images/slider_img4.jpg">
					<div class="camera_caption fadeIn">
						<h3 style="color: rgba(255, 255, 255, 0.9);">Frist Time New Customer Get 150 Rupees Bonus!Sign Up Online</h3>
					    <<center><b style="color: rgba(255, 255, 255, 0.9);">Contact Us by</b></center>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-envelope-o"></span></a>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-phone"></span></a>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-map-marker"></span></a>
					</div>
				</div>
                <div class="item" data-src="images/slider_img3.jpg">
					<div class="camera_caption fadeIn">
						<h3 style="color:Maroon;">No Monthly/Service Fees!</h3>
						<center><b style="color:Maroon";>Contact Us by</b></center>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-envelope-o"></span></a>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-phone"></span></a>
						<a href="index-4.html" class="btn bd-ra"><span class="fa fa-map-marker"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
    <br />
	<div class="full-width-container block-2">
		<div class="container">
			<div class="row">
				<div class="grid_12">
					<header>
						<h3><span>Welcome to Our National Bank of India</span></h3>
					</header>
                    <br />
				<p>The customer can access his/her account from anywhere just by inputting the correct Username and Password. It would offer different online services, like balance enquiry, money transfer, opening new account, view transactions.</p>
                 <p>The administrator would be able to perform various operations like creating a bank account for the customer and performing functions like transfers, withdrawals, and deposits based on customer’s request. The administrator also has the privilege to close the customer’s account on the request of the bank customer.</p>
                    
				</div>
			</div>
		</div>
	</div>
	<div class="full-width-container block-3 parallax-block" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="grid_12">
					<header>
						<h2><span>Services</span></h2>
					</header>
				</div>
                <div class="grid_12">
				    <div class="grid_3">
                     <i class="fa fa-clock-o" style="font-size:48px;color:lightblue;"></i>
					    <h4>24/7 Online Access</h4>
				    </div>
                    <div class="grid_3">
                    <i class="fa fa-lock" style="font-size:48px;color:red"></i>
					    <h4>Safe and Secure</h4>
				    </div>
                  <div class="grid_3">
                      <i class="fa fa-gift" style="font-size:48px;color:purple;"></i>
					    <h4>First Time Sign Up Bonus</h4>
				    </div>
                    <div class="grid_3">
                    <i class="fa fa-file-text-o" style="font-size:48px;color:gold;"></i>
					    <h4>View Accounts Balance </h4>
				    </div>
                    <div class="grid_3">
                     <i class="fa fa-laptop" style="font-size:48px;color:maroon;"></i>
					    <h4>View Recent Transactions </h4>
				    </div>
                    <div class="grid_3">
                     <i class="fa fa-money" style="font-size:48px;color:green;"></i>
					    <h4>Transfer Money</h4>
				    </div>
                </div>
                <div class="grid_12">
                    <div class="grid_3">
                     <i class="fa fa-comment-o" style="font-size:48px;color:blue;"></i>
					    <h4>Report Complaints</h4>
				    </div>
                    <div class="grid_3">
                     <i class="fa fa-user" style="font-size:48px;color:black;"></i>
					    <h4>Update Customer Profile </h4>
				    </div>
                    <div class="grid_3">
                     <i class="fa fa-key" style="font-size:48px;color:Aqua;"></i>
					    <h4>Change Password </h4>
				    </div>
               </div>
             </div>  
		</div>
        <hr />
	<div class="full-width-container block-4">
		<div class="container">
			<div class="row">
				<div class="grid_12">
					<header>
						<h2><span>News & Events</span></h2>
					</header>
				</div>
			</div>
			<div class="row">
				<div id="owl-carousel" class="owl-carousel">
					<div class="grid_4">
						<div class="">
							<div class="img_container"><img src="images/index_img-1.jpg" alt="img"></div>
							<%--<div class="owl-text">Lorem ipsum</div>--%>
						</div>
					</div>
					<div class="grid_4">
						<div class="">
							<div class="img_container"><img src="images/index_img-2.jpg" alt="img"></div>
							<%--<div class="owl-text">Derto minert</div>--%>
						</div>
					</div>
					<div class="grid_4">
						<div class="">
							<div class="img_container"><img src="images/index_img-3.jpg" alt="img"></div>
							<%--<div class="owl-text">Sedrotr selimto</div>--%>
						</div>
					</div>
					<div class="grid_4">
						<div class="">
							<div class="img_container"><img src="images/index_img-2.jpg" alt=""></div>
							<%--<div class="owl-text">Derto minert</div>--%>
						</div>
					</div>
					<div class="grid_4">
						<div class="">
							<div class="img_container"><img src="images/index_img-3.jpg" alt=""></div>
							<%--<div class="owl-text">Sedrotr selimto</div>--%>
						</div>
					</div>
					<div class="grid_4">
						<div class="">
							<div class="img_container"><img src="images/index_img-1.jpg" alt=""></div>
							<%--<div class="owl-text">Lorem ipsum</div>--%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="full-width-container block-5">
		<div class="container">
			<div class="row">
				<div class="grid_12">
					<header>
						<h2><span>About Us</span></h2>
					</header>
				</div>
				<div class="grid_7 preffix_1">
				    National Bank of India welcomes you to explore the premier bank in India.<br /><br />
                    The NBI Bank is recently open in 2017. Our bank primary goal is to serve customers the best bank online service.<br /><br />
                    NBI has several bank locations through Gujarat, India. In near future, NBI bank is planning to open new branch location through out India.<br /><br />
                    Our bank offer free Rs. 150 bonus for new customer who sign up online for new bank account.
				</div>
			</div>
		</div>
	</div>
</section>
</asp:Content>
