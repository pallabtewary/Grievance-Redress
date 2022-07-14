package com.redress.interfaces;

public interface CustomerInterface {
	
	public abstract String showCustomerInfoByUserID();
	public abstract String showComplaintsByUserID();
	public abstract String showComplaintByUserAndComplaintID();		//To be implemented
	public abstract String showFeedbackByComplaintID();				//To be implemented
	public abstract String showProductsOwnedByUserID();
	

	public abstract String addComplaint();
	public abstract String addFeedback();
	public abstract String editFeedbackByComplaintID();				//To be implemented
	
	public abstract String sendMessage();
}
