<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="sessionValidation.jsp"/>
<jsp:useBean id="date" class="java.util.Date" />
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
        <title>Edit Profile</title>

        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
        <link rel="stylesheet" href="assets/plugins/image-hover/imagehover.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
        <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
        
        // Avaoid underscore as a First character in username
        
        function avoidUnderscore(message)
        {
    	    var firstchar = (message.value.charAt(0));
    	    var isUnderscore = false;
    	    while(firstchar.charCodeAt(0) == 95)
    	    {	isUnderscore = true;
    	        var temp = message.value;
    	        var str = temp.slice(1);
    	        message.value = str;
    	        firstchar = (message.value.charAt(0));        
    		}
    	    
    	    if(isUnderscore){
    	    	$('#spacemsg').html('<span style="font-size: 90%; color: grey;">( <i class="fa fa-exclamation-triangle fa-sm"></i>  "_" as a first character is not allowed ) </span>'); 

    	    }

    	    return message;
    	}
        
        // Update password
        
        function changePassword()
        {
            var password = document.getElementById("password").value;
            var email = document.getElementById("email").value;
            $.ajax({
                url: 'updatepassword',
                method: "POST",
                data: {password:password , email:email},
                success: function (data) {
                	document.getElementById("cpass").reset();
 
                	 if(data.ctr > 0){                
                	    $('#messagepassword').html('<div class = "alert alert-success mt-2" role = "alert"> Password Updated Successfully </div>');        
                	   
                	   }
                	   else{   
                	     $('#messagepassword').html('<div class = "alert alert-danger mt-2" role = "alert"> Some error occured </div>');
                	  }
                	
                },
                error: function (jqXHR, exception) {
                    console.log('Error occured!!');
                    var h = "Error";
                    alert(h);
                }
            });

            }
        
        // checking username available or not
        
            function checkUsername(username)
            {
            	var currUsername = '${sessionScope.validUser.getUsername()}';
            	
                var username = document.getElementById("username").value;
                if(currUsername == username){
                
                	$('#update').attr("disabled",false);
                	return;
                }
                $.ajax({
                    url: 'checkUsername',
                    method: "POST",
                    data: {username: username},
                    success: function (data) {
                    	if(!data.noData){                
                    	    $('#availability').html('<span style="font-size: 90%; color: red;"><i class="fa fa-times"></i> username already exist</span>');        
                    	    $('#update').attr("disabled",true);
                    	    document.getElementById("update").style.cssText = `
                        	  	  background: #000000; 
                        	  	  border: none;
                        	  	`;
                    	   }
                    	   else{   
                    	     $('#availability').html('<span style="font-size: 90%; color: green;"><i class="fa fa-check"></i> username available</span>');
                    	     $('#update').attr("disabled",false);
                    	     
                    	  }
                    	
                    },
                    error: function (jqXHR, exception) {
                        console.log('Error occured!!');
                        var h = "Error";
                        alert(h);
                    }
                });

                }
           
            var check = function() {
          	  if (document.getElementById('password').value ==
          	    document.getElementById('confirm_password').value) {
          		  $('#message').html('<span style="font-size: 90%; color: green;"><i class="fa fa-circle-check"></i> Password Matched!</span>');        
            	    $('#update_password').attr("disabled",false);
            	    
          	  } else {
          	  $('#message').html('<span style="font-size: 90%; color: red;" ><i class="fa fa-exclamation-triangle"></i> Passwords are not matching </span>');        
          	  	    $('#update_password').attr("disabled",true);
          	  	document.getElementById("update_password").style.cssText = `
          	  	  background: #000000; 
          	  	  border: none;
          	  	`;
          	  }
          	}
                
       </script>

        <style>

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: #BA68C8;
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }
            .tabs {
                display: flex;
                flex-wrap: wrap;
                max-width: 100%;
                font-family: sans-serif;
            }

            .tabs__label {
                padding: 10px 16px;
                cursor: pointer;
            }

            .tabs__radio {
                display: none;
            }

            .tabs__content {
                order: 1;
                width: 100%;
                border-bottom: 3px solid #dddddd;
                line-height: 1.5;
                font-size: 0.9em;
                display: none;
            }

            .tabs__radio:checked + .tabs__label {
                font-weight: bold;
                color: #223d50;
                border-bottom: 2px solid #223d50;
            }

            .tabs__radio:checked + .tabs__label + .tabs__content {
                display: initial;
            }

        </style>
        
        
    </head>

    <body>

        <!--Navbar -->
    <jsp:include page="navbarCustomer.jsp"/> 

        <!--###################### Slider Starts Here ############################-->

        <div class="page-title titl-2">
            <div class="container">
                <div class="row">
                    
                    <h2>Edit your Profile</h2>
                    <p> Home <i class="fas fa-angle-double-right"></i> Profile </p>
                </div>
            </div>
        </div>

         <div class="tabs">
                        <input type="radio" class="tabs__radio" name="tabs-example" id="tab1" checked>
                        <label for="tab1" class="tabs__label">Profile</label>
                        <div class="tabs__content">
                                <div class="row">
                                    <div class="col-md-4 border-right">
                                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="assets/images/profileCustomer.png" width="90">
                                            <span class="font-weight-bold">${sessionScope.validUser.getFirstname()} ${sessionScope.validUser.getLastname()}</span>
                                            <span class="text-black-50">${sessionScope.validUser.getEmail()}</span>
                                            <span class="text-black-50">Hello, ${sessionScope.validUser.getFirstname()} Welcome to Smart Security Services..
                                            </span>

                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                     <h5> Update Your Profile</h5>
                                        <div class="p-3 py-5">
                                            <s:if test="ctr>0">
                                                <div class = "alert alert-success mt-2" role = "alert"><s:property value="msg" /></div>
                                            </s:if>
                                            <s:elseif test= "ctr==-1">
                                                <div class = "alert alert-danger mt-2" role = "alert"><s:property value="msg" /></div>
                                            </s:elseif>
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <div class="d-flex flex-row align-items-center back"><i class="fa fa-arrow-left mr-1 mb-1"></i>
                                                    <h6 onclick="history.back()" style="color:#223d50"> Back</h6></a>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <form action="editprofileCustomer" method ="post">
                                                    <div class="form-floating mb-3">
                                                    <label>Username </label>
                                                        <input style = "margin-bottom:5px" class="form-control" id="username" name="username" type="text" value="${sessionScope.validUser.getUsername()}" placeholder="username" onkeyup="checkUsername(username)" onblur = "return avoidUnderscore(document.getElementById('username'))" required/> 
                                                        
                                                        <input class="form-control" id="pid" type="hidden" value="${sessionScope.validUser.getPid()}" name ="pid" />
                                                        
                                                         <span id="availability"></span>
                                                         <span id ="spacemsg"></span>
                                                    </div>
                                                   
                                                    <%-- <span style="font-size: 80%; color: grey;">username can't be changed right now.</span> --%>
                                                   
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                            <label>First name</label>
                                                                <input style = "margin-bottom:0px" class="form-control" name ="firstname" id="firstname" value="${sessionScope.validUser.getFirstname()}" type="text" placeholder="Enter your first name" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating">
                                                            <label>Last name</label>
                                                                <input style = "margin-bottom:0px" class="form-control" name ="lastname" id="lastname" value="${sessionScope.validUser.getLastname()}" type="text" placeholder="Enter your last name" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                    <label>Email address</label>
                                                        <input class="form-control" id="email" value="${sessionScope.validUser.getEmail()}" type="email" name="email" placeholder="name@example.com" />
                                                        
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                     <label>Address</label>
                                                        <input class="form-control" id="address" name="address" value="${sessionScope.validUser.getAddress()}" type ="text"  placeholder="adreess" />
                                                       
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                    <label>Phone Number</label>
                                                        <input class="form-control" id="inputEmail" type="tel" value="${sessionScope.validUser.getPhno()}" name ="phno" placeholder="Phone Number" pattern="[6789][0-9]{9}" title="Please enter valid phone number" />
                                                        
                                                    </div>


                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid"><input type = "submit" class="btn btn-success btn-block" id="update" name='update' value="Update Profile"></div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        	</div>
                    
                    <input type="radio" class="tabs__radio" name="tabs-example" id="tab2">
                    <label for="tab2" class="tabs__label">Change Password</label>
                    <div class="tabs__content">
               
                        <div class="container rounded bg-white">
                            <div class="row">
                                <div class="col-md-4 border-right">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="assets/images/profileCustomer.png" width="90">
                                        <span class="font-weight-bold">${sessionScope.validUser.getFirstname()} ${sessionScope.validUser.getLastname()}</span>
                                        <span class="text-black-50">${sessionScope.validUser.getEmail()}</span>
                                        <span class="text-black-50">Hello, ${sessionScope.validUser.getFirstname()} Welcome to Smart Security Services.
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h5> Change Your Password</h5>
                                    <div class="p-3 py-5">                                      
                                            <div id ="messagepassword"></div>                       
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <div class="d-flex flex-row align-items-center back"><i class="fa fa-arrow-left mr-1 mb-1"></i>
                                                <h6 onclick="history.back()"style="color:#223d50"> Back</h6>
                                            </div>
                                        </div>

                                        <div class="card-body">
                                            <form action="#" id="cpass">
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="email" type="hidden" value="${sessionScope.validUser.getEmail()}" name ="email" />

                                                </div>
                                                <span id ="availability"></span>
                                               
                                                <div class="form-floating mb-3">
                                                <label>New password</label>  
                                                <!-- Fake password field to avoid autofilled -->
                                                <input id="fakepassword" style="display:none" type="password" name="fakepasswordremembered">
                                                    <input class="form-control" id="password" name="password"  type ="password" onkeyup ="check()" placeholder="********" />
                                                                                                      
                                                </div>
                                                <div class="form-floating mb-3">
                                                <label>Confirm Password</label>
                                                    <input style = "margin-bottom:5px" class="form-control" id="confirm_password" name="confirm_password"  type ="password" onkeyup ="check()"  placeholder="********" />
                                                    
                                                    <span id ="message"></span>
                                                </div>


                                                <div class="mt-4 mb-0">
                                                    <div class="d-grid"><input type = "button" class="btn btn-success btn-block" id="update_password" name='update_password' value="Update Password" onclick = "changePassword()"></div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
        

  <!--key features -->
    <jsp:include page="keyFeaturesCustomer.jsp"/>
    
  <!--Footer -->
    <jsp:include page="footerCustomer.jsp"/>
    
    <script>
 $("input#username").on({
	  keypress: function(e) {
	    if (e.which === 96 || (e.which >= 32 && e.which <= 47) || (e.which >= 58 && e.which <= 64) || (e.which >= 91 && e.which <= 94) || (e.which >= 123 && e.which <= 126) ){
	    	$('#spacemsg').html('<span style="font-size: 90%; color: grey;">( <i class="fa fa-exclamation-triangle fa-sm"></i>  Usernames cannot contain spaces or special characters) </span>'); 
	    	$('#update').attr("disabled",true);
	    	return false;
	    	}
	    else{
	    	$('#spacemsg').html('');
	    	$('#update').attr("disabled",false);
	    }
	  },
		change: function() {
	    this.value = this.value.replace(/\s/g, "");
	    this.value = this.value.replace(/[^\w\s]/gi, '');
		}

	});
</script>

    </body>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/scroll-nav/js/jquery.easing.min.js"></script>
    <script src="assets/js/script.js"></script>


</html>