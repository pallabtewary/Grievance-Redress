package com.redress.interfaces;

public interface AdminInterface extends CSRInterface {

	//Show CSR details
	public abstract String showCSR();
	public abstract String showActiveCSR();
	public abstract String showInactiveCSR();
	public abstract String showDeletedCSR();
	
	//Edit functions
	public abstract String updateUser();
	public abstract String updateTechnician();
	public abstract String updateDepartment();
	public abstract String updateProduct();
	
	//Add functions
	public abstract String addCustomer();
	public abstract String addCSR();
	public abstract String addProduct();
	public abstract String addProductToCustomer();
	public abstract String addTechnician();
	public abstract String addDepartment();
	
	//Delete functions
	public abstract String deleteUser();
	public abstract String deleteTechnician();
	public abstract String deleteDepartment();
	public abstract String deleteProduct();
	
	//Utility functions
	public abstract String editProfile();
	public abstract String listDepartmentComplaints();
	public abstract String updatePassword();
	public abstract String checkUsername();
	
}
