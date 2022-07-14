<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<!--###################### Footer Starts Here ############################-->

<footer>
   <div class="foot-det">
       
   
    <div class="container foot-cont">
        <div class="row">
            <div class="col-md-4">
                <div class="foot-about">
                    <h4>GrievanceRedress</h4>
                    <p>If you have any issues with your Product, You can simply Register Your Grievance here <br> <br>
                        Our Technician will get in touch with you within next 24 hours. <br>
                        Customer Satisfaction is the First Priority for us..
                    </p>
                    <ul>
                            <li><a><i class="fab fa-github"></i></a></li>
                            <li><a><i class="fab fa-linkedin-in"></i></a></li>
                            <li> <a><i class="fab fa-pinterest-p"></i></a></li>
                            <li><a><i class="fab fa-twitter"></i></a></li>
                            <li> <a><i class="fab fa-facebook-f"></i></a></li>
                        </ul>
                </div>
            </div>
            <div class="col-md-4 menu-foot">
                <h4>Menu</h4>
                <ul>
                    <li><a href="customerdashboard">Home</a></li>
                    <li><a href="addGrievance.jsp">Add Grievance</a></li>
                    <li><a href="complaintpid">My Grievances</a></li>
                    <li><a href="aboutUs.jsp">About us</a></li>
                    <li><a href="contactUs.jsp">Contacts</a></li>
                </ul>
            </div>
            <div class="col-md-4 cont-foot">
                <h4>Contacts</h4>
                <h5>Group B</h5>
                <p>Kolkata</p>
                <a href="">groupb_project@groupb.com</a>
            </div>
        </div>
    </div>
    <div class="copy-right">
        <div class="container">
            <p><fmt:formatDate value="${date}" pattern="yyyy" /> Designed and Developed by Group-B</p>
        </div>
    </div>
    </div>
</footer>
   
