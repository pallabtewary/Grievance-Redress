package com.redress.interfaces;

public interface CSRInterface {

	//Show Customer details
	public abstract String showAllCustomers();
	public abstract String showActiveCustomers();
	public abstract String showInactiveCustomers();
	public abstract String showDeletedCustomers();
	
	//Show Technician details
	public abstract String showAllTechnicians();
	public abstract String showActiveTechnicians();
	public abstract String showInactiveTechnicians();
	public abstract String showTechniciansByDeptID();
		
	//Show Department details
	public abstract String showAllDepartments();
	public abstract String showActiveDepartments();
	public abstract String showInactiveDepartments();
		
	//Show Product details
	public abstract String showAllProducts();
	public abstract String showActiveProducts();
	public abstract String showInactiveProducts();
		
	//Show Complaint details
	public abstract String showAllComplaints();
	public abstract String showResolvedComplaints();
	public abstract String showUnresolvedComplaints();
	public abstract String showInitiatedComplaints();
	public abstract String showRejectedComplaints();
	public abstract String showComplaintByComplaintID();
	public abstract String showComplaintsByUserID();
		
	//Defects on Product
	public abstract String showAllCustomerDefects();
	public abstract String showCustomerDefectByOwnerID();
		
	//Update a Complaint
	public abstract String updateComplaint();
	
}
