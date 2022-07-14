<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="sessionValidation.jsp"/>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, shrink-to-fit=no, user-scalable=no">
    <title> Online Grievance Redressal System</title>

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
<!--slider -->
    <jsp:include page="sliderCustomer.jsp"/>
<!--services -->
    <jsp:include page="servicesCustomer.jsp"/>
<!--about -->
    <jsp:include page="aboutCompany.jsp"/>
<!--key features -->
    <jsp:include page="keyFeaturesCustomer.jsp"/>
<!--testimonial -->
    <jsp:include page="testimonialCustomer.jsp"/>


    <!--###################### Client Details Starts Here ############################-->
    <div class="client-container container-fluid">
        <div class="container">
            <div class="row client-row">
                <div class="col-md-3 col-6 br bb clinent-cover">
                    <img src="assets/images/partner/l1.png" alt="">
                </div>
                <div class="col-md-3 col-6 br bb clinent-cover">
                    <img src="assets/images/partner/l2.png" alt="">
                </div>
                <div class="col-md-3 col-6 br bb clinent-cover">
                    <img src="assets/images/partner/l3.png" alt="">
                </div>
                <div class="col-md-3 col-6 bb clinent-cover">
                    <img src="assets/images/partner/l5.png" alt="">
                </div>
                <div class="col-md-3 col-6 br clinent-cover">
                    <img src="assets/images/partner/l5.png" alt="">
                </div>
                <div class="col-md-3 col-6 br clinent-cover">
                     <img src="assets/images/partner/l3.png" alt="">
                </div>
                <div class="col-md-3 col-6 br clinent-cover">
                     <img src="assets/images/partner/l2.png" alt="">
                </div>
                <div class="col-md-3 col-6 clinent-cover">
                    <img src="assets/images/partner/l1.png" alt="">
                </div>
            </div>
        </div>
    </div>


    
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