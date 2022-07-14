package com.redress.actions;

import com.redress.dao.AdminDAO;
import com.redress.dao.CSRDAO;
import com.redress.dao.CustomerDAO;
import com.redress.models.Complaint;
import com.redress.models.User;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class CSRDashboard {
	private String msg = "";
	private List<User> userList = null;
	private List<Complaint> complaintList = null;
	private List<Complaint> resolvedComplaint = null;
	private List<Complaint> unresolvedComplaint = null;
	private List<Complaint> rejectedComplaint = null;
	private List<Complaint> newComplaint = null;

	AdminDAO admin = new AdminDAO();
	CSRDAO csr = new CSRDAO();
	CustomerDAO customer = new CustomerDAO();

	public String execute() throws Exception {

		HttpSession session = ServletActionContext.getRequest().getSession(false);
		User validUser = (User) session.getAttribute("validUser");
		if (session == null || session.getAttribute("validUser") == null) {
			setMsg("You are not logged in. Please login first!! ");
			return "login";
		} else {
			setUserList(new ArrayList<User>());
			setUserList(admin.getAllCustomers());
			System.out.println(validUser.getPid());
			setComplaintList(new ArrayList<Complaint>());
			setComplaintList(customer.complaintListbyPid(validUser.getPid()));
			setNewComplaint(csr.newComplaintList());
			setResolvedComplaint(csr.resolvedComplaintList());
			setUnresolvedComplaint(csr.unResolvedComplaintList());
			setRejectedComplaint(csr.rejectedComplaintList());
			return "success";
		}

	}

	// Getters and Setters

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

	public List<Complaint> getComplaintList() {
		return complaintList;
	}

	public void setComplaintList(List<Complaint> complaintList) {
		this.complaintList = complaintList;
	}

	public List<Complaint> getUnresolvedComplaint() {
		return unresolvedComplaint;
	}

	public void setUnresolvedComplaint(List<Complaint> unresolvedComplaint) {
		this.unresolvedComplaint = unresolvedComplaint;
	}

	public List<Complaint> getNewComplaint() {
		return newComplaint;
	}

	public void setNewComplaint(List<Complaint> newComplaint) {
		this.newComplaint = newComplaint;
	}

	public void setResolvedComplaint(List<Complaint> resolvedComplaint) {
		this.resolvedComplaint = resolvedComplaint;
	}

	public List<Complaint> getResolvedComplaint() {
		return resolvedComplaint;
	}

	public List<Complaint> getRejectedComplaint() {
		return rejectedComplaint;
	}

	public void setRejectedComplaint(List<Complaint> rejectedComplaint) {
		this.rejectedComplaint = rejectedComplaint;
	}

}
