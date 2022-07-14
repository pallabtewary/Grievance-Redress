package com.redress.actions;

import com.redress.dao.CustomerDAO;
import com.redress.interfaces.CustomerInterface;
import com.redress.models.Complaint;
import com.redress.models.Product;
import com.redress.models.ProductOwned;
import com.redress.models.User;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

public class CustomerAction implements CustomerInterface{

    HttpSession session = ServletActionContext.getRequest().getSession(false);
    User validUser = (User) session.getAttribute("validUser");
    
    private String message;
    private String subject;
    private String description;
    private String feedback;
    private int ownid;
    private int rating;
    private int complid;
    

	private List<User> userList = null;
    private List<Complaint> complaintList = null;
    private List<Product> productList = null;
    private List<ProductOwned> ProductOwnedList = null;
    
    private int ctr = 0;
    private boolean noData = false;
    private String msg = "";
   
    
    CustomerDAO customer = new CustomerDAO();
    Timestamp date = new Timestamp(new Date().getTime());
    private static final Logger logger = Logger.getLogger(CustomerAction.class);
    
    @Override
	public String editFeedbackByComplaintID() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String showComplaintByUserAndComplaintID() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String showFeedbackByComplaintID() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public String showCustomerInfoByUserID() {
		logger.info("inside CustomerAction showCustomerInfoByUserID method. Showing customer info");
		try {
            setUserList(new ArrayList<User>());
            setUserList(customer.report(validUser.getPid()));

            if (!userList.isEmpty()) {
                setNoData(false);
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "REPORT";
	}
	
	@Override
	public String showComplaintsByUserID() {
		logger.info("inside CustomerAction showComplaintsByUserID method. Showing user complaints");
		try {
            setComplaintList(new ArrayList<Complaint>());
            setComplaintList(customer.complaintListbyPid(validUser.getPid()));

            if (!complaintList.isEmpty()) {
                setNoData(false);
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "PIDCOMPLAINTLIST";
	}

	@Override
	public String showProductsOwnedByUserID() {
		logger.info("inside CustomerAction showProductsOwnedByUserID method. Showing Products owned by user");
		try {

            setProductOwnedList(new ArrayList<ProductOwned>());
            setProductOwnedList(customer.productsByPid(validUser.getPid()));

            if (!ProductOwnedList.isEmpty()) {
                setNoData(false);
            } else {
                setNoData(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "PRODUCTOWNEDLIST";
	}
	
	@Override
	public String addComplaint() {
		logger.info("inside CustomerAction addComplaint method. Registering complaint");
		try {
            setCtr(customer.ComplaintRegister(date, subject, description, validUser.getPid(), ownid));
            if (getCtr() > 0) {
                setMsg("Complaint Registered Successfully");
            } else {
                setMsg("Some error occured! Try again..");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "ADDCOMPLAINT";
	}
	
	@Override
	public String addFeedback() {
		logger.info("inside CustomerAction addFeedback method. Getting feedback");
		try {
            setCtr(customer.FeedbackRegister(complid, feedback, rating));
            if (getCtr() > 0) {
            	customer.updateFeedbackStatus(complid);
                setMsg("Feedback Submitted Successfully");
            } else {
                setMsg("Some error occured!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "ADDFEEDBACK";
	}
	
	@Override
	public String sendMessage() {
		logger.info("inside CustomerAction sendMessage method. Getting help request message");
        try {
            setCtr(customer.sendMessage(validUser.getFirstname(), validUser.getEmail(), validUser.getPhno(), message, validUser.getPid(), validUser.getUsername()));
            if (getCtr() > 0) {
                setMsg("Message sent Successfully");
            } else {
                setMsg("Some error occured! Try again..");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "SENDMESSAGE";
	}
	
	
	//Fields encapsulation
	
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getCtr() {
		return ctr;
	}
	public void setCtr(int ctr) {
		this.ctr = ctr;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public boolean isNoData() {
		return noData;
	}
	public void setNoData(boolean noData) {
		this.noData = noData;
	}
	public List<Complaint> getComplaintList() {
		return complaintList;
	}
	public void setComplaintList(List<Complaint> complaintList) {
		this.complaintList = complaintList;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getOwnid() {
		return ownid;
	}
	public void setOwnid(int ownid) {
		this.ownid = ownid;
	}
	public List<ProductOwned> getProductOwnedList() {
		return ProductOwnedList;
	}
	public void setProductOwnedList(List<ProductOwned> productOwnedList) {
		ProductOwnedList = productOwnedList;
	}
    public int getComplid() {
		return complid;
	}
	public void setComplid(int complid) {
		this.complid = complid;
	}

}