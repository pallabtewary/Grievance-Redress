<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, shrink-to-fit=no, user-scalable=no">
    <title>Contact Us</title>

    <link rel="shortcut icon" href="assets/images/fav.jpg">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
    <link rel="stylesheet" href="assets/plugins/image-hover/imagehover.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
<script>
    function avoidSpace()
    {
	    var textarea = document.getElementById("message");
	    var firstchar = ($("textarea").val().substring(0,1));
	    while(firstchar.charCodeAt(0) == 32)
	    {
	        var temp = textarea.value;
	        var str = temp.slice(1);
	        textarea.value = str;
	        firstchar = ($("textarea").val().substring(0,1));        
		}
	}
</script>

</head>

<body>

    <!--Navbar -->
    <jsp:include page="navbarCustomer.jsp"/> 

    
    <div class="page-title titl-2">
        <div class="container">
            <div class="row">
                <h2>Contact Us</h2>
                <p> Home <i class="fas fa-angle-double-right"></i> Contact Us </p>
            </div>
        </div>
    </div>
    
    

       <div style="margin-top:0px;" class="row no-margin">
        
        <iframe style="width:100%" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d471220.56313305674!2d88.04952067043779!3d22.675752066447867!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f882db4908f667%3A0x43e330e68f6c2cbc!2sKolkata%2C%20West%20Bengal!5e0!3m2!1sen!2sin!4v1643630160076!5m2!1sen!2sin"  height="450" frameborder="0" style="border:0" allowfullscreen></iframe>


      </div>

      <div class="row contact-rooo no-margin">
        <div class="container">
           <div class="row">
               
          
            <div style="padding:20px" class="col-sm-7">
                
            <h2 style="font-size:18px">Contact Form</h2>
            <form onsubmit="return sendEmail(); return false;" action="sendmessage" method="post">             
                 <div  class="row cont-row">
                    <div  class="col-sm-3"><label>Enter Message</label><span>:</span></div>
                    <div class="col-sm-8">
                        <textarea rows="5" placeholder="Enter Your Message" class="form-control input-sm" id = "message" name ="message" onkeyup = "avoidSpace()"  required></textarea>
                    </div>
                </div>
                 <div style="margin-top:10px;" class="row">
                    <div style="padding-top:10px;" class="col-sm-3"><label></label></div>
                    <div class="col-sm-8">
                        <button class="btn btn-success btn-sm" type="submit">Send Message</button>
                        <!-- <button class="btn btn-success btn-sm" onclick="sendEmail()">dEMO</button> -->
                        <s:if test="ctr>0">
                        <div class = "alert alert-success mt-2" role = "alert"><s:property value="msg" /></div>
                    </s:if>
                    <s:elseif test= "ctr==-1">
                        <div class = "alert alert-danger mt-2" role = "alert"><s:property value="msg" /></div>
                    </s:elseif>
                    </div>
                </div>
            </form>
            </div>
              
             <div class="col-sm-5">
                    
                  <div style="margin:50px" class="serv">          
              
          <h2 style="margin-top:10px;">How to Contact us</h2>

    Grievance Redressal <br>
         Group B,
    Kolkata<br>
    fill all the required details<br>
    and send the message to us <br>
    one of our representative will get in touch with you <br>
    24 X 7 Customer services.
   
           </div>    
         </div>
      </div>
    </div>
</div>

<!--key features -->
    <jsp:include page="keyFeaturesCustomer.jsp"/>

<!--Footer -->
    <jsp:include page="footerCustomer.jsp"/>
<!-- SMTP javascript library -->
<script src="https://smtpjs.com/v3/smtp.js"></script>
<script>
       /*  function sendEmail() {
        	alert("Calling");
        	var name = '${sessionScope.validUser.getFirstname()}' + " " + '${sessionScope.validUser.getLastname()}' ;
        	var email = '${sessionScope.validUser.getEmail()}';
        	var phone = '${sessionScope.validUser.getPhno()}' ;
            Email.send({
                Host: "smtp.elasticemail.com",
                Username: "contact.grievanceredress@gmail.com",
                Password: "2F279EE01BE7931F7F74BA644A9848F5892F",
                To: 'onlinegrievanceredressal@gmail.com',
                From: "contact.grievanceredress@gmail.com",
                Subject: "Contact Enquiry from "+name+,
                Body: ""
            }).then(
                message => alert(message) 
            );
        } */
        function sendEmail() {
        	alert("Calling");
        	var name = '${sessionScope.validUser.getFirstname()}' + " " + '${sessionScope.validUser.getLastname()}' ;
        	var email = '${sessionScope.validUser.getEmail()}';
        	var phone = '${sessionScope.validUser.getPhno()}' ;
            Email.send({
                Host: "smtp.elasticemail.com",
                Username: "contactUs.grievanceredress@gmail.com",
                Password: "1E0584BD6DDF4B52931DAF3BA642075568C4",
                To: 'onlinegrievanceredressal@gmail.com',
                From: "contactUs.grievanceredress@gmail.com",
                Subject: "New Message: From "+name,
                Body: "Name: "+name
                +"<br>Email: "+email
                +"<br>Phone: "+phone
                +"<br>Message: " + document.getElementById('message').value
            }).then(
                message => alert(message)
            );
        }
    </script>
    <script>
    function test(){
    var name = '${sessionScope.validUser.getPhno()}' ;
    alert(name);}
    </script>
</body>
<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/scroll-nav/js/jquery.easing.min.js"></script>
<script src="assets/js/script.js"></script>


</html>