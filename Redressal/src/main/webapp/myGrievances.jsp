<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
if (request.getSession().getAttribute("validUser") == null) {
	String errormsg = "You are not logged in. Please login first!!";
	request.setAttribute("errormsg", errormsg);
	request.getRequestDispatcher("login.jsp").forward(request, response);
} else if ((Integer) request.getSession().getAttribute("roleid") != 3) {
	String errormsg = "You are not logged in. Please login first!!";
	request.setAttribute("errormsg", errormsg);

	if (session != null) {
		session.invalidate();
	}
	request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, shrink-to-fit=no, user-scalable=no">
<title>My Grievances</title>
<link rel="stylesheet" href="assets/css/feedbackStyle.css">
<link rel="shortcut icon" href="assets/images/fav.jpg">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
<link rel="stylesheet"
	href="assets/plugins/image-hover/imagehover.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="assets/css/styles.css" rel="stylesheet" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
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

<script>
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient)
	})
	
	$("#submit").click(function () {
            var text = $("#textarea").val();
            $("#modal_body").html(text);
        });
	
	function fetchComplaint(complid)
            {
                $("input:text").val(complid);
            }


</script>

</head>

<body>

	<!--Navbar -->
	<jsp:include page="navbarCustomer.jsp" />

	<!--###################### Slider Starts Here ############################-->

	<div class="page-title titl-2">
		<div class="container">
			<div class="row">
				<h2>My Grievances</h2>
				<p>
					Home <i class="fas fa-angle-double-right"></i> My Grievances
				</p>
			</div>
		</div>
	</div>

	<!--###################### About Company Starts Here ############################-->
	<section class="with-medical">
		<div class="container">
			<div class="row">

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> Grievance List
					</div>

					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Give your
										Feedback</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="addFeedback" method="post">

										<div class="form-group">
											<h1 id="complid"></h1>
											<input type="text" hidden name="complid" /> <label
												for="message-text" class="col-form-label">Feedback:</label>
											<textarea class="form-control" id="message-text"
												name="feedback"></textarea>
										</div>
										<div class="form-group">
											<label for="rating">Give rating</label> <br> <span
												class="star-rating"> <input type="radio"
												name="rating" value="1"><i></i> <input type="radio"
												name="rating" value="2"><i></i> <input type="radio"
												name="rating" value="3"><i></i> <input type="radio"
												name="rating" value="4"><i></i> <input type="radio"
												name="rating" value="5" required><i></i>

											</span>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<input type="submit" class="btn btn-primary" />
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
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

					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>Sl no.</th>
									<th>Complaint Time</th>
									<th>Product</th>
									<th>Model</th>
									<th>Subject</th>
									<th>Description</th>
									<th>Technician</th>
									<th>Progress</th>
									<th>Status</th>
									<th>Feedback</th>
								</tr>
							</thead>
							<tfoot>

								<tr>
									<th>Sl no.</th>
									<th>Complaint Time</th>
									<th>Product</th>
									<th>Model</th>
									<th>Subject</th>
									<th>Description</th>
									<th>Technician</th>
									<th>Progress</th>
									<th>Status</th>
									<th>Feedback</th>
								</tr>
							</tfoot>
							<tbody>
								<s:iterator value="complaintList">
									<tr>
										<td></td>
										<td><s:property value="compltime" /></td>
										<td><s:property value="prodname" /></td>
										<td><s:property value="prodmodel" /></td>
										<td><s:property value="subject" /></td>
										<td><s:property value="description" /></td>
										<td><s:property value="techname" /></td>
										
										<s:if test="endprog!=NULL && endprog !=''">
											<td><s:property value="endprog" /></td>
										</s:if>
										<s:elseif test = "ongoingprog!=NULL && ongoingprog !=''">
											<td><s:property value="ongoingprog" /></td>
										</s:elseif>
										<s:elseif test = "startprog!=NULL && startprog !=''">
											<td><s:property value="startprog" /></td>
										</s:elseif>
										<s:else>
											<td style="font-size: 80%; color: #C0C0C0;">Grievance registered </td>
										</s:else>
										
										<s:if test="res_status==0">
											<td>Unresolved</td>
										</s:if>
										<s:else>
											<td>Resolved</td>
										</s:else>
										<td style="display: none;"><input type="text"
											id="textarea" value="<s:property value="complid" />"></input></td>
										<s:if test="feedback_status==1">
											<td style="font-size: 70%;font-weight: bold; color: green;"><i class="fa fa-circle-check"></i> feedback submitted</td>
										</s:if>
										<s:else>
										<s:if test="res_status==1">
											<td><button type="button"
													class="btn btn-sm btn-outline-secondary"
													data-toggle="modal" data-target="#exampleModal"
													data-whatever="@getbootstrap"
													onclick="fetchComplaint(<s:property value="complid" />)">Add
													Feedback</button></td>
										</s:if>
										<s:else>
											<td style="font-size: 80%; color:#C0C0C0;">not resolved
												yet</td>
										</s:else>
										</s:else>

									</tr>
								</s:iterator>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--key features -->
    <jsp:include page="keyFeaturesCustomer.jsp"/>



	<!--###################### Footer Starts Here ############################-->

	<!--Navbar -->
	<jsp:include page="footerCustomer.jsp" />


</body>
<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/scroll-nav/js/jquery.easing.min.js"></script>
<script src="assets/js/script.js"></script>
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


</html>