<!doctype html>

<%
    response.setHeader("Cache-control","no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("validUser") == null) {
        String errormsg = "You are not logged in. Please login first!!";
        request.setAttribute("errormsg", errormsg);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    else if((Integer)request.getSession().getAttribute("roleid") != 3){
        String errormsg = "You are not logged in. Please login first!!";
        request.setAttribute("errormsg", errormsg);
        
        if(session!=null){  
        session.invalidate();
    }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
<html lang="en">

	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, shrink-to-fit=no, user-scalable=no">
	    <title> About us</title>
	
	    <link rel="shortcut icon" href="assets/images/fav.jpg">
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    <link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
	    <link rel="stylesheet" href="assets/plugins/image-hover/imagehover.min.css">
	    <link rel="stylesheet" href="assets/css/animate.css">
	    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
	</head>

<body>
 <!--Navbar -->
    <jsp:include page="navbarCustomer.jsp"/> 

    <!--###################### Slider Starts Here ############################-->
    
    <div class="page-title titl-2">
        <div class="container">
            <div class="row">
                <h2>About Us</h2>
                <p> Home <i class="fas fa-angle-double-right"></i> About US </p>
            </div>
        </div>
    </div>


    <!--###################### About Company Starts Here ############################-->
    <section class="with-medical">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <img src="assets/images/about.jpg" alt="">
                </div>
                <div class="col-lg-6 col-md-12 txtr">
                    <h4>About us <br>
                        <span>Online Grievance Redressal</span>
                    </h4>
                    <p>
Grievance Redressal System is an online platform to receive and act on complaints 
reported by our customers , 
enabling prompt actions on any issue raised by them and to avail services more effectively. 
                   Once you raised your complaint our technician will get in touch with you within next 24 hours
                    <br>  </p>
                </div>

            </div>
        </div>
    </section>

<!--key features -->
    <jsp:include page="keyFeaturesCustomer.jsp"/>

 <!--Footer -->
    <jsp:include page="footerCustomer.jsp"/> 

</body>
<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/scroll-nav/js/jquery.easing.min.js"></script>
<script src="assets/js/script.js"></script>
</html>