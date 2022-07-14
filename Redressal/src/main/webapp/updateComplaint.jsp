<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
if (request.getSession().getAttribute("validUser") == null) {
	String errormsg = "You are not logged in. Please login first!!";
	request.setAttribute("errormsg", errormsg);
	request.getRequestDispatcher("login.jsp").forward(request, response);
} else if ((Integer) request.getSession().getAttribute("roleid") != 2) {
	String errormsg = "You are not logged in. Please login first!!";
	request.setAttribute("errormsg", errormsg);

	if (session != null) {
		session.invalidate();
	}
	request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Update Complaint</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="assets/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="navbarCSR.jsp" />
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">Update Complaint</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Update Complaint details.</li>
				</ol>

				<s:if test="ctr>0">
					<div class="alert alert-success mt-2" role="alert">
						<s:property value="msg" />
					</div>
				</s:if>
				<s:elseif test="ctr==-1">
					<div class="alert alert-danger mt-2" role="alert">
						<s:property value="msg" />
					</div>
				</s:elseif>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> Update Complaint
					</div>

					<div class="card-body">
						<form action="updatecomplaint" method="post">

							<div class="form-floating mb-3">
								<input class="form-control" id="pid" type="hidden"
									name="complid" placeholder="complid"
									value='<s:property value="complid"/>' readonly />
							</div>

							<div class="form-floating mb-3">

								<input class="form-control" id="username" type="text"
									name="compltime" placeholder="complaint time"
									value='<s:property value="compltime"/>' readonly /> <label
									for="username">Complaint Time</label>

							</div>

							<div class="form-floating mb-3">
								<input class="form-control" id="inputEmail" type="text"
									name="subject" placeholder="subject"
									value='<s:property value="subject"/>' readonly /> <label
									for="subject">Subject</label>
							</div>
							<div class="form-floating mb-3">
								<input class="form-control" id="address" name="description"
									type="text" placeholder="description"
									value='<s:property value="description"/>' readonly /> <label
									for="description">Description</label>
							</div>
							<div class="form-floating mb-3">
								<input class="form-control" id="firstname" type="text"
									name="firstname" placeholder="Customer Name"
									value='<s:property value="firstname"/> <s:property value="lastname"/>'
									readonly /> <label for="firstname">Customer Name</label>
							</div>

							<div class="row mb-3">
								<div class="col-md-6">
									<div class="form-floating mb-3 mb-md-0">
										<input class="form-control" type="text" name="prodname"
											placeholder="Phone Number"
											value='<s:property value="prodname"/>' readonly /> <label
											for="phno">Product Name</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating">
										<input class="form-control" type="text" name="prodmodel"
											placeholder="Phone Number"
											value='<s:property value="prodmodel"/>' readonly /> <label
											for="phno">Product Model</label>
									</div>
								</div>
							</div>

							<div class="form-floating mb-3">
								<select class="form-select" name="techid" required>
								<s:if test="techname != null">								
											<option value="<s:property value="techid"/>" selected>
											<s:property value="techname" />
										</option>
										</s:if>
										<s:else>
									<option value="" disabled selected>Select Technician</option>
									</s:else>
									<s:iterator value="technicianList">
										<option value="<s:property value="techid"/>">
											<s:property value="techname" />
										</option>
									</s:iterator>
								</select>
								<label for="phno">Technician Name</label>

							</div>
							<div class="form-floating mb-3">
								<input class="form-control" id="startprog" type="text"
									name="startprog" placeholder="Phone Number"
									value='<s:property value="startprog"/>' /> <label
									for="startprog">Start Progress</label>
							</div>
							<div class="form-floating mb-3">
								<input class="form-control" id="ongoing" type="text"
									name="ongoingprog" placeholder="Phone Number"
									value='<s:property value="ongoingprog"/>' /> <label
									for="ongoingprog">Ongoing Progress</label>
							</div>
							<div class="form-floating mb-3">
								<input class="form-control" id="endprog" type="text"
									name="endprog" placeholder="Phone Number"
									value='<s:property value="endprog"/>' /> <label for="endprog">End
									Progress</label>
							</div>
							<div class="form-floating mb-3">
								<select class="form-control" name="compl_status"
									id="compl_status" required>
									<option value="1">Accept</option>
									<option value="2">Reject</option>
								</select> <label for="compl_status">Complaint Status</label>
								<!--<span style="font-size: 80%; color: grey;">0 - Inactive / 1 - Active / 2 - Delete </span>-->
							</div>
							<div class="form-floating mb-3">
								<select class="form-control" name="res_status" id="compl_status"
									required>

									<option value="0">Unresolved</option>
									<option value="1">Resolved</option>

								</select> <label for="res_status">Resolution Status</label>
								<!--<span style="font-size: 80%; color: grey;">0 - Inactive / 1 - Active / 2 - Delete </span>-->
							</div>


							<div class="mt-4 mb-0">
								<div class="d-grid">
									<input type="submit" class="btn btn-primary btn-block"
										name="submitType" value="Update Complaint">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="footer.jsp" />
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="assets/js/datatables-simple-demo.js"></script>
</body>
</html>
