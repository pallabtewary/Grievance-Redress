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
<title>Login</title>

<link
	href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/login.css">
 <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

.wrapper form .pass{

height:18px;

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

</style>

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
							<p class="login-card-description">Sign into your account</p>
							<div class="wrapper">
								<form action="logon.action" method="post">
									<div class="row">
										<i class="fa fa-user"></i> <input type="text" name="username"
											id="username" class="form-control" placeholder="Username">
									</div>
									<div class="row">
										<i class="fas fa-key"></i> <input type="password"
											name="password" id="password" class="form-control"
											placeholder="***********" >
<%-- 											<span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password" id ="toggle-password"></span>
 --%>									
 											<span id = "togglepassword" class="fa fa-fw fa-eye field-icon"></span>
 											</div>
									<div class="row pass"><a href="forgotPassword.jsp">Forgot password?</a></div>
									<div class="row button">
										<input name="login" id="login"
											class="btn btn-block login-btn mb-4" type="submit"
											value="Login">
									</div>
									<div class="row">
										<s:if test="msg !=null">
										<s:if test="ctr>0">
                                                <div class = "alert alert-success mt-2" role = "alert"><s:property value="msg" /></div>
                                            </s:if>
                                            <s:elseif test= "ctr==-1">
											<div class="alert alert-warning mt-2" role="alert" style ="width:105%">
												<s:property value="msg" />
												<c:out value='${requestScope.errormsg}' />
											</div>
											</s:elseif>
										</s:if>
									</div>
								</form>
							</div>
														
							
							<!--  <form action="logon.action" method = "post">
                  <div class="form-group">
                  
                  <div class="input-icons">
                    <label for="username" class="sr-only">Username</label>
                    <i class="fa fa-user icon"></i>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Username">
                  </div>
                  </div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">Password</label>
                    <i class="fa fa-lock icon"></i>
                    <input type="password" name="password" id="password" class="form-control" placeholder="***********">
                  </div>
                  <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="Login"> 
                </form> -->

							<!-- <a href="#!" class="forgot-password-link">Forgot password?</a> -->

							<!-- <nav class="login-card-footer-nav">
                  <a href="#!">Terms of use.</a>
                  <a href="#!">Privacy policy</a>
                  
                  <span style="color: red;"><s:property value="msg" /> <c:out value='${requestScope.msg}'/></span>
                  
                </nav> -->
							<%--  <s:if test="msg !=null">
                        <div class = "alert alert-warning mt-2" role = "alert"><s:property value="msg" /><c:out value='${requestScope.errormsg}'/></div>
              </s:if>  --%>

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
</body>
<script>
togglepassword.addEventListener('click',function(){
	var x = document.getElementById("password");
	$(this).toggleClass("fa-eye fa-eye-slash");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	})
</script>
</html>
