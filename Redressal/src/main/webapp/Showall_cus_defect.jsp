<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<title>Customer Defects</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<style>
body {
	counter-reset: Serial; /* Set the Serial counter to 0 */
}

tr td:first-child:before {
	counter-increment: Serial; /* Increment the Serial counter */
	content: counter(Serial); /* Display the counter */
}
</style>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="navbarCSR.jsp" />
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">Customer Defects</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">View Customer defects</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> Defects
					</div>
					<div class="card-body">
						<s:if test="noData==false">
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: #E0E0E1;">
										<th>Sl no.</th>
										<th>Customer Defect</th>


									</tr>
								</thead>
								<s:iterator value="customerdefect">
									<tr>
										<td></td>
										<td><s:property value="cus_def" /></td>



									</tr>
								</s:iterator>
							</table>
						</s:if>
						<s:else>
							<div style="color: red;">No Data Found.</div>
						</s:else>
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
