<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="assets/images/logologin.png" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Forgot Password</title>

<link
	href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/login.css">
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
      
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
      
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>

<style type="text/css">
::selection {
	background: rgba(26, 188, 156, 0.3);
}

.wrapper {
	width: 100%;
	background: #fff;
	border-radius: 5px;
}

.wrapper form .row {
	height: 45px;
	margin-bottom: 15px;
	position: relative;
}

.wrapper form .row input {
	height: 100%;
	width: 100%;
	outline: none;
	padding-left: 60px;
	border-radius: 5px;
	border: 1px solid lightgrey;
	font-size: 16px;
	transition: all 0.3s ease;
}

form .row input:focus {
	border-color: #16a085;
	box-shadow: inset 0px 0px 2px 2px rgba(26, 188, 156, 0.25);
}

form .row input::placeholder {
	color: #999;
}

.wrapper form .row i {
	position: absolute;
	width: 47px;
	height: 100%;
	color: #fff;
	font-size: 18px;
	background: #2596be;
	border: 1px solid #16a085;
	border-radius: 5px 0 0 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.wrapper form .pass {
	height: 18px;
}

.wrapper form .pass a {
	color: #2596be;
	font-size: 17px;
	text-decoration: none;
}

.wrapper form .pass a:hover {
	text-decoration: underline;
}

.wrapper form .button input {
	color: #fff;
	font-size: 20px;
	font-weight: 500;
	padding-left: 0px;
	background: #2596be;
	border: 1px solid #2596be;
	cursor: pointer;
}

form .button input:hover {
	background: #12876f;
}

.field-icon {
	float: right;
	margin-left: -25px;
	margin-top: 15px;
	position: relative;
	z-index: 2;
}
#back{
color:grey;
background:white;
border:grey;

}
#back:hover {
  background-color: #F8F8F8;
  outline:none;
  text-decoration: underline;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;
  border-radius: 10px;
  
}

</style>
<script>
function showInfo(){
	toastr.options.timeOut = 15000; // 15s
    toastr.info('Please check your SPAM folder also if not find in INBOX.');
    $('#linkButton').click(function() {
       toastr.success('Click Button');
    });
};
	function success() {
		if (document.getElementById("email").value === "") {
			document.getElementById('continue').disabled = true;
		} else {
			document.getElementById('continue').disabled = false;
		}
	};

	function checkEmail() {
		var email = document.getElementById("email").value;
		$
				.ajax({
					url : 'checkEmail',
					method : "POST",
					data : {
						email : email
					},
					success : function(data) {
						if (data.noData) {
							$('#availability')
									.html(
											'<span class = "alert alert-danger mt-2" style="font-size: 100%;"><span class="fa fa-exclamation-triangle" /> Your email id is not registered with us !</span>');
							$('#continue').attr("disabled", true);
						} else {
							$('#availability').html('');
							$('#continue').attr("disabled", false);

						}

					},
					error : function(jqXHR, exception) {
						console.log('Error occured!!');
						var h = "Error";
						alert(h);
					}
				});

	}

	var code; // Declaring a global variable to store the otp
	function sendOtp() {

		var d = document.getElementById('continue');
		var x = document.getElementById('btn');
		document.getElementById('continue').remove();
		/* $("input#continue").attr("class", "spinner-grow"); */
		x.innerHTML += '<button style =" background-color:#72bbd5" id="sending-otp" class="btn btn-block login-btn mb-4" type="button" disabled> <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span> Sending.... </button>'
		
		
		var email = document.getElementById("email").value;
					$.ajax({
					url : 'forgotPassword',
					method : "POST",
					data : {
						email : email
					},
					success : function(data) {
						if (data.sendEmail) {
							showInfo();
							code = data.code;
							$('#availability').html('<span class = "alert alert-success mt-2"> <span class="fa fa-circle-check" /> OTP sent successfully</span>');
							var d = document.getElementById('otp');
							var x = document.getElementById('btn');
							document.getElementById('email').type = 'hidden';
							document.getElementById('sending-otp').remove();
							d.innerHTML += "<i class='fa fa-lock'></i><input type='text' id='otpv' name = 'otp' placeholder = 'Enter OTP'><br >";
							x.innerHTML += "<input name='verify' id='verify'class='btn btn-block login-btn mb-4' type='button' onclick='verifyOtp()' value='Verify'>";
						} else {
							$('#availability')
									.html(
											'<span class = "alert alert-warning mt-2"> <span class="fa fa-exclamation-triangle" /> Some error occured! Try again </span>');
							var x = document.getElementById('btn');
							document.getElementById('sending-otp').remove();
							x.innerHTML += '<input name="continue" id="continue" class="btn btn-block login-btn mb-4" type="button"value="Continue" onclick = "sendOtp()" disabled>';

							$('#continue').attr("disabled", false);
						}

					},
					error : function(jqXHR, exception) {
						console.log('Error occured!!');
						var h = "Error";
						alert(h);
					}
				});

	};

	function verifyOtp() {

		var otpEntered = document.getElementById("otpv").value;
		if (otpEntered == code) {
			var d = document.getElementById('otp');
			var x = document.getElementById('btn');
			document.getElementById('otpv').remove();
			document.getElementById('verify').remove();
			document.getElementById('extra-div').className += 'row'; // adding class to the div
			var e = document.getElementById('extra-div');
			d.innerHTML += "<i class='fas fa-key'></i><input type='password' id='password' name = 'password' placeholder = 'New Password'onkeyup = 'check()'><br >";
			e.innerHTML += "<i class='fas fa-key'></i><input type='password' id='confirm-password' name = 'confirm-password' placeholder = 'Confirm Password' onkeyup = 'check()'><br >";
			x.innerHTML += "<input name='update' id='update'class='btn btn-block login-btn mb-4' type='submit' value='Update' disabled>";
			$('#availability')
					.html(
							'<span class = "alert alert-success mt-2" style="font-size: 100%;"><span class="fa-solid fa-circle-check"/> OTP Verified </span>');

		} else {
			$('#availability')
					.html(
							'<span class = "alert alert-danger mt-2"><span class="fa-solid fa-circle-xmark"/> Wrong OTP  entered </span>');
		}

	};
	
	  var check = function() {
		  $('#availability').html('');
      	  if (document.getElementById('password').value ==
      	    document.getElementById('confirm-password').value) {
      		  $('#messagepw').html('<span style="font-size: 100%; color: green;"><i class="fa fa-circle-check"></i> Password Matched!</span><br>');        
        	    $('#update').attr("disabled",false);
      	  } else {
      	  $('#messagepw').html('<span style="font-size: 100%; color: red;" ><i class="fa fa-exclamation-triangle"></i> Passwords are not matching </span><br>');        
      	  	    $('#update').attr("disabled",true);
      	  }
      	};
</script>

</head>

<body>

	<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
		<div class="container">
			<div class="card login-card">
				<div class="row no-gutters">
					<div class="col-md-5">
						<img src="assets/images/login.jpg" alt="login"
							class="login-card-img">
							
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<div class="brand-wrapper">
								<img src="assets/images/logologin.png" alt="logo" class=""
									width="25%" height="auto">
							</div>
							<p class="login-card-description">Forgot Password</p>
							<div class="wrapper">
								<br>
								<form action="changePassword"
									onkeydown="return event.key != 'Enter';">
									<div class="row" id="otp">
										<i class="fa fa-envelope" id = "ev"></i> <input type="text" name="email"
											id="email" class="form-control"
											placeholder="Enter your Email" onblur="checkEmail()"
											onkeyup="success()">
									</div>
									<div id="extra-div"></div>
									<span id="messagepw"></span>
									<div class="row button" id="btn">
										<input name="continue" id="continue"
											class="btn btn-block login-btn mb-4" type="button"
											value="Continue" onclick="sendOtp()" disabled>

									</div>
									<div class="row button" id="btn">
										<a href= "login.jsp" id="back" aria-label ="back"
											class="btn btn-block login-btn mb-4" role="button"
											 > Back </a>

									</div>
									<div class="row">
										<span id="availability">
									</div>

								</form>
							</div>

						</div>
					</div>
				</div>
			</div>

		</div>
	</main>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script>
		$('#load2').on('click', function() {
			var $this = $(this);
			$this.button('loading');
			setTimeout(function() {
				$this.button('reset');
			}, 8000);
		});
	</script>
</body>
<script>
	togglepassword.addEventListener('click', function() {
		var x = document.getElementById("password");
		$(this).toggleClass("fa-eye fa-eye-slash");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	});
</script>
</html>
