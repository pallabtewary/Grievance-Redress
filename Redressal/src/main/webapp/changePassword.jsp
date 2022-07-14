<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/login.css">
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
	margin: -8px 0 20px 0;
}

.wrapper form .pass a {
	color: #16a085;
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
            <img src="assets/images/login.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <div class="brand-wrapper">
                <img src="assets/images/logologin.png" alt="logo" class=""
									width="25%" height="auto">
              </div>
              <p class="login-card-description">Choose your Password </p>
              <div class="wrapper">
								 <form action="forcetochangepassword.action" method = "post">								
									<div class="row">
										<i class="fas fa-key"></i> <input type="password"
											name="password" id="password" class="form-control"
											placeholder="***********" >									
 											<span id = "togglepassword" class="fa fa-fw fa-eye field-icon"></span>
 											</div>
									
									<div class="row button">
										 <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="Update">
									</div>
									<div class="row">
										 <s:if test="msg !=''">
											<div class="alert alert-warning mt-2" role="alert" style ="width:105%">
												<s:property value="msg" />
												<c:out value='${requestScope.errormsg}' />
											</div>
										</s:if>
									</div>
								</form>
							</div>
              <!-- <form action="forcetochangepassword.action" method = "post">
                    <div class="form-group mb-4">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="***********">
                  </div>
                  <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="Update">
                </form> -->
            </div>
          </div>
        </div>
      </div>
     
    </div>
  </main>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
