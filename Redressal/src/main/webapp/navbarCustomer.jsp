<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

.dropdown-content {
	border: 1px solid #808080;
	border-radius: 10px;
	display: none;
	position: absolute;
	position: fixed;
	background-color: #f9f9f9;
	opacity: .8;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	border-radius: 10px;
	float: none;
	color: black;
	padding: 5px 7px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #ddd;
	border-left: 4px solid black;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content a:active{
background-color: #fff;
}
.dropdown-divider {
	height: 0;
	margin: 0.5rem 0;
	overflow: hidden;
	border-top: 1px solid rgba(0, 0, 0, 0.15);
}

.element {
	border-bottom: 1px solid #555;
	margin-bottom: 5px; /* space to next menu item */
	padding-bottom: 5px; /* space between text and border bottom */
}
</style>

<!--###################### Navigation Starts Here ############################-->

<div class="header-container">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 col-md-12 left-item">
					<!--                        <ul>
                                                <li><i class="fas fa-envelope-square"></i> sales@smarteyeapps.dcom</li>
                                                <li class="d-none d-sm-block"><i class="fas fa-phone-square"></i> +123 987 887 765</li>
                                            </ul>-->
				</div>
				<div class="col-lg-5 d-none d-lg-block right-item">

					<ul>

						<li>
							<div class="dropdown">
								<button class="dropbtn">
									Hi, ${sessionScope.validUser.getFirstname()} <i
										class="fa fa-caret-down"></i>
								</button>

								<div class="dropdown-content">
									<a href="profileCustomer.jsp"><i class="fa fa-user"></i> Profile</a>
									<hr class="dropdown-divider" />
									<a href="logout"><i class="fa fa-sign-out-alt"></i> Signout</a>

								</div>
							</div>
						</li>
						<li><a href="logout"><p style="color: white">
									<i class="fa fa-sign-out-alt"></i> Signout
								</p></a></li>
						<!--                        <li><a><i class="fab fa-linkedin-in"></i></a></li>
                                                    <li> <a><i class="fab fa-pinterest-p"></i></a></li>
                                                    <li><a><i class="fab fa-twitter"></i></a></li>
                                                    <li> <a><i class="fab fa-facebook-f"></i></a></li>-->


					</ul>
				</div>
			</div>

		</div>
	</div>
	<nav id="menu-jk" class="container-fluid  no-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-12 logo">
					<img class="log" src="assets/images/logo.png" alt=""> <img
						class="log-gray" src="assets/images/logo-gray.png" alt=""> <a
						data-toggle="collapse" data-target="#nav-head" href="#nav-head"><i
						class="fas d-block d-md-none small-menu fa-bars"></i></a>
				</div>
				<div id="nav-head" class="col-md-9 nav-div d-none d-md-block">
					<ul>
						<li><a class="js-scroll-trigger" href="customerdashboard">Home</a></li>

						<li class="yc"><a class="js-scroll-trigger"
							href="ProductOwnedList">Add Grievance</a></li>
						<li><a class="js-scroll-trigger" href="complaintpid">My
								Grievances</a></li>
						<li><a class="js-scroll-trigger" href="aboutUs.jsp">About
								Us</a></li>
						<li><a class="js-scroll-trigger" href="contactUs.jsp">Contact
								Us</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</div>

