package com.redress.actions;

import com.lambdaworks.crypto.SCryptUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.redress.dao.AdminDAO;
import com.redress.interfaces.AdminInterface;
import com.redress.models.Department;
import com.redress.models.Product;
import com.redress.models.Technician;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.redress.models.User;
import java.util.ArrayList;

public class AdminAction extends CSRAction implements AdminInterface {

	private int pid;
	private int userstatus;
	private int techstatus;
	private int techid;
	private int deptid;
	private int prodid;
	private int prodstatus;

	private String prodmodel;
	private String prodname;
	private String techname;
	private String deptname;
	private int deptstatus;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String address;
	private String email;
	private String phno;
	private boolean noData;
	private int ctr;

	public int getCtr() {
		return ctr;
	}

	public void setCtr(int ctr) {
		this.ctr = ctr;
	}

	public boolean getNoData() {
		return noData;
	}

	public void setNoData(boolean noData) {
		this.noData = noData;
	}

	private List<User> csrList = null;
	private List<Department> deptList = null;

	AdminDAO admin = new AdminDAO();
	private static final Logger logger = Logger.getLogger(AdminAction.class);

	@Override
	public String showCSR() {
		logger.info("inside AdminAction showCSR method, Showing csr list");
		try {
			setCsrList(new ArrayList<User>());
			setCsrList(admin.getAllCSR());
			if (!csrList.isEmpty()) {
				setNoData(false);
			} else {
				setNoData(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "SHOWCSR";
	}

	@Override
	public String showActiveCSR() {
		try {
			setCsrList(new ArrayList<User>());
			setCsrList(admin.getAllCSR().stream().filter(csr -> csr.getUserstatus() == 1).collect(Collectors.toList()));
			if (!csrList.isEmpty()) {
				setNoData(false);
			} else {
				setNoData(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "SHOWACTIVECSR";
	}

	@Override
	public String showInactiveCSR() {
		try {
			setCsrList(new ArrayList<User>());
			setCsrList(admin.getAllCSR().stream().filter(csr -> csr.getUserstatus() == 0).collect(Collectors.toList()));
			if (!csrList.isEmpty()) {
				setNoData(false);
			} else {
				setNoData(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "SHOWINACTIVECSR";
	}

	@Override
	public String showDeletedCSR() {
		try {
			setCsrList(new ArrayList<User>());
			setCsrList(admin.getAllCSR().stream().filter(csr -> csr.getUserstatus() == 2).collect(Collectors.toList()));
			if (!csrList.isEmpty()) {
				setNoData(false);
			} else {
				setNoData(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "SHOWDELETEDCSR";
	}

	@Override
	public String updateUser() {
		logger.info("inside AdminAction updateUser method, Updating user");
		try {
			if (getSubmitType().equals("updatedata")) {
				User user = admin.fetchUserDetails(pid);
				if (user != null) {
					setPid(user.getPid());
					setUsername(user.getUsername());
					setPassword(user.getPassword());
					setFirstname(user.getFirstname());
					setLastname(user.getLastname());
					setAddress(user.getAddress());
					setEmail(user.getEmail());
					setPhno(user.getPhno());
					setUserstatus(user.getUserstatus());
				}
			} else {
				setCtr(admin.updateUser(pid, username, password, firstname, lastname, address, email, phno,
						userstatus));
				if (getCtr() > 0) {
					setMsg("User updated Successfully!");
				} else {
					setCtr(-1);
					setMsg("Some error occured!");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "UPDATEUSER";
	}

	@Override
	public String updateTechnician() {
		logger.info("inside AdminAction updateTechnician method, Updating Technician");
		try {
			if (getSubmitType().equals("updatedata")) {
				Technician tech = admin.fetchTechnicianDetails(techid);
				if (tech != null) {
					setTechid(tech.getTechid());
					setTechname(tech.getTechname());
					setDeptid(tech.getDeptid());
					setTechstatus(tech.getTechstatus());
					setDeptname(tech.getDeptname());
				}
			} else {
				setCtr(admin.updateTechnician(techid, deptid, techname, techstatus));
				if (getCtr() > 0) {
					setMsg("Technician updated Successfully!");
				} else {
					setCtr(-1);
					setMsg("Some error");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "UPDATETECHNICIAN";
	}

	@Override
	public String updateDepartment() {
		logger.info("inside AdminAction updateDepartment method, Updating Department");
		try {
			if (getSubmitType().equals("updatedata")) {
				System.out.println("Here I am");
				Department dept = admin.fetchDepartmentDetails(deptid);
				if (dept != null) {
					deptid = dept.getDeptid();
					deptname = dept.getDeptname();
					deptstatus = dept.getDeptstatus();
				}
			} else {
				setCtr(admin.updateDepartment(deptid, deptname, deptstatus));
				if (getCtr() > 0) {
					setMsg("Department updated Successfully!");
				} else {
					setMsg("Some error");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "UPDATEDEPARTMENT";
	}

	@Override
	public String updateProduct() {
		logger.info("inside AdminAction updateProduct method, Updating product");
		try {
			if (getSubmitType().equals("updatedata")) {
				Product product = admin.fetchProductDetails(prodid);
				if (product != null) {
					setProdid(product.getProdid());
					setDeptid(product.getDeptid());
					setDeptname(product.getDeptname());
					setProdname(product.getProdname());
					setProdmodel(product.getProdmodel());
					setProdstatus(product.getProdstatus());
				}
			} else {
				setCtr(admin.updateProduct(prodid, prodname, deptid, prodmodel, prodstatus));
				if (getCtr() > 0) {
					setMsg("Product updated Successfully!");
				} else {
					setMsg("Some error");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "UPDATEPRODUCT";
	}

	@Override
	public String addCustomer() {
		logger.info("inside AdminAction addProductToCustomer method, Adding Customer");
		try {
			password = SCryptUtil.scrypt("1234", 2048, 8, 1);
			setCtr(admin.addCustomers(getUsername(), getPassword(), getFirstname(), getLastname(), getAddress(),
					getEmail(), getPhno()));
			if (getCtr() > 0) {
				setMsg("Customer added successfully");
			} else {
				setCtr(-1);
				setMsg("Username or email id is already registered!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ADDCUSTOMER";
	}
	
	@Override
	public String addProductToCustomer() {
		logger.info("inside AdminAction addProductToCustomer method, Adding Product");
		try {
			setCtr(admin.addProductToCustomer(getProdid(), getPid()));
			if (getCtr() > 0) {
				setMsg("Product added Successfully!");
			} else {
				setMsg("Some error occured!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ADDPRODUCTTOCUSTOMER";
	}

	@Override
	public String addCSR() {
		logger.info("inside AdminAction addCSR method, Adding CSR");
		try {
			password = SCryptUtil.scrypt("1234", 2048, 8, 1);
			setCtr(admin.addCSR(getUsername(), getPassword(), getFirstname(), getLastname(), getAddress(), getEmail(),
					getPhno()));
			if (getCtr() > 0) {
				setMsg("CSR added successfully");
			} else {
				setCtr(-1);
				setMsg("Username or email id is already registered!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ADDCSR";
	}

	@Override
	public String addProduct() {
		logger.info("inside AdminAction addProduct method, Adding Product");
		try {
			setCtr(admin.addProduct(getDeptid(), getProdname(), getProdmodel()));
			if (getCtr() > 0) {
				setMsg("Product added Successfully!");
			} else {
				setMsg("Some error occured!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ADDPRODUCT";
	}

	@Override
	public String addTechnician() {
		logger.info("inside AdminAction addTechnician method, Adding Technician");
		try {
			setCtr(admin.addTechnician(getDeptid(), getTechname()));
			if (getCtr() > 0) {
				setMsg("Technician added Successfully!");
			} else {
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ADDTECHNICIAN";
	}

	@Override
	public String addDepartment() {
		logger.info("inside AdminAction addDepartment method, Adding Department");
		try {
			setCtr(admin.addDepartment(getDeptname()));
			if (getCtr() > 0) {
				setMsg("Department added Successfully!");
			} else {
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ADDDEPARTMENT";
	}

	@Override
	public String deleteUser() {
		logger.info("inside AdminAction deleteUser method, Deleting User");
		try {
			int isDeleted = admin.deleteUserDetails(getPid());
			if (isDeleted > 0) {
				setMsg("User deleted successfully");
			} else {
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user_delete_success";
	}

	@Override
	public String deleteTechnician() {
		logger.info("inside AdminAction deleteTechnician method, Deleting Technician");
		try {
			int isDeleted = admin.deleteTechDetails(getTechid());
			if (isDeleted > 0) {
				setMsg("Technician deleted successfully");
			} else {
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DELETETECHNICIAN";
	}

	@Override
	public String deleteDepartment() {
		try {
			int isDeleted = admin.deleteDeptDetails(getDeptid());
			if (isDeleted > 0) {
				setMsg("Department deleted successfully");
			} else {
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DELETEDEPARTMENT";
	}

	@Override
	public String deleteProduct() {
		try {
			setCtr(admin.deleteProdDetails(getProdid()));
			if (getCtr() > 0) {
				setMsg("Product deleted successfully");
			} else {
				setCtr(-1);
				setMsg("Some error");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DELETEPRODUCT";
	}

	public String listDepartmentComplaints() {
		try {
			setDeptList(new ArrayList<Department>());
			setDeptList(admin.getDeptComplaintsNum());
			if (!deptList.isEmpty()) {
				setNoData(false);
			} else {
				setNoData(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "DEPTCOMPLAINTSNUM";
	}

	@Override
	public String updatePassword() {
		try {
			System.out.println("My password" + password);
			password = SCryptUtil.scrypt(password, 2048, 8, 1);
			System.out.println("My password" + password);
			setCtr(admin.updatePassword(password, email));
			if (getCtr() > 0) {
				setMsg("Password updated Successfully! login now");
			} else {
				setCtr(-1);
				setMsg("Some error");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ActionSupport.SUCCESS;
	}

	@Override
	public String checkUsername() {
		try {
			System.out.println("My username" + username);
			setCtr(admin.checkUsername(username));
			System.out.println("ctr " + getCtr());
			if (getCtr() > 0) {
				System.out.println(getCtr());
				setMsg("Not available");
				setNoData(false);
				setPid(ctr);
			} else {
				setMsg("available");
				setNoData(true);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ActionSupport.SUCCESS;
	}

	@Override
	public String editProfile() {
		try {
			setCtr(admin.editProfile(pid, username, firstname, lastname, address, email, phno));
			if (getCtr() > 0) {
				User validUser = admin.fetchUserDetails(pid);
				HttpSession session = ServletActionContext.getRequest().getSession(false);
				session.setAttribute("validUser", validUser);

				setMsg("Profile updated Successfully!");
			} else {
				setCtr(-1);
				setMsg("Some error occured!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "EDITUSER";
	}

	public List<Department> getDeptList() {
		return deptList;
	}

	public void setDeptList(List<Department> deptList) {
		this.deptList = deptList;
	}

	public List<User> getCsrList() {
		return csrList;
	}

	public void setCsrList(List<User> csrList) {
		this.csrList = csrList;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getUserstatus() {
		return userstatus;
	}

	public void setUserstatus(int userstatus) {
		this.userstatus = userstatus;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public int getTechstatus() {
		return techstatus;
	}

	public void setTechstatus(int techstatus) {
		this.techstatus = techstatus;
	}

	public int getTechid() {
		return techid;
	}

	public void setTechid(int techid) {
		this.techid = techid;
	}

	public int getDeptid() {
		return deptid;
	}

	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}

	public String getTechname() {
		return techname;
	}

	public void setTechname(String techname) {
		this.techname = techname;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public int getProdid() {
		return prodid;
	}

	public void setProdid(int prodid) {
		this.prodid = prodid;
	}

	public int getProdstatus() {
		return prodstatus;
	}

	public void setProdstatus(int prodstatus) {
		this.prodstatus = prodstatus;
	}

	public String getProdmodel() {
		return prodmodel;
	}

	public void setProdmodel(String prodmodel) {
		this.prodmodel = prodmodel;
	}

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
	}

	public int getDeptstatus() {
		return deptstatus;
	}

	public void setDeptstatus(int deptstatus) {
		this.deptstatus = deptstatus;
	}

}