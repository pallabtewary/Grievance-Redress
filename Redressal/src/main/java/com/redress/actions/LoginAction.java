
package com.redress.actions;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import com.lambdaworks.crypto.SCryptUtil;
import com.opensymphony.xwork2.ActionSupport;
import com.redress.dao.LoginDAO;
import com.redress.models.User;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class LoginAction implements SessionAware {

	private SessionMap<String, Object> sessionMap;
	HttpSession session = ServletActionContext.getRequest().getSession(false);
	User valUser = (User) session.getAttribute("validUser");
	private String hash;
	private int pid;

	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String address;
	private String email;
	private String phno;
	private int roleid;
	private String code;
	private int userstatus;
	private boolean validUser;
	private boolean noData;
	private boolean sendEmail;
	private static String success;
	private String msg = "";
	private int ctr = 0;

	LoginDAO login = null;

	@Override
	public void setSession(Map<String, Object> map) {

		setSessionMap((SessionMap<String, Object>) map);
	}

	public boolean validatePassword(String username, String password) throws Exception {
		login = new LoginDAO();
		boolean check = false;
		setHash(login.getPasswordHash(username));
		try {
			check = SCryptUtil.check(password, getHash());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public String validateLoginCredentials() throws Exception {

		login = new LoginDAO();
		try {

			User validUser = login.validLoginCredential(username);
			if (validatePassword(username, password)) {
				validUser.setValidUser(true);
			}

			if (validUser.isValidUser()) {

				sessionMap.put("validUser", validUser);
				sessionMap.put("roleid", validUser.getRoleid());

				username = validUser.getUsername();
				password = validUser.getPassword();
				firstname = validUser.getFirstname();
				lastname = validUser.getLastname();
				email = validUser.getEmail();
				phno = validUser.getPhno();
				roleid = validUser.getRoleid();
				userstatus = validUser.getUserstatus();

				System.out.println("roleid = " + validUser.getRoleid());

//                    success = (user.getRole());
				if (roleid == 1) {
					success = "successAdmin";
				} else if (roleid == 2) {

					success = "successCSR";
				} else {
					if (userstatus == 0) {
						success = "changePassword";
					} else {
						success = "successCustomer";
					}
				}
			} else {
				setCtr(-1);
				this.msg = "Invalid Username or Password!!";
				return "failure";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}

	public String checkEmail() {
		login = new LoginDAO();
		try {
			System.out.println("My Email" + email);
			setCtr(login.checkEmail(email));
			System.out.println("ctr " + getCtr());
			if (getCtr() > 0) {
				System.out.println(getCtr());
				setMsg("Not available");
				setNoData(false);
			} else {
				setMsg("available");
				setNoData(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ActionSupport.SUCCESS;
	}

	public String changePassword() throws Exception {
		login = new LoginDAO();
		try {
			String generatedSecuredPasswordHash = SCryptUtil.scrypt(password, 2048, 8, 1);
			setCtr(login.changePassword(generatedSecuredPasswordHash, valUser.getPid()));
			if (getCtr() > 0) {
				setMsg("Password Changed Successfully.");
				return "successchangepassword";
			} else {
				setMsg("Some error!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "failurechangepassword";
	}

	public String logout() {
		if (sessionMap != null) {
			sessionMap.invalidate();
			setMsg(null);
		}
		return "success";
	}

	public String forgotPassword() {
		login = new LoginDAO();
		setCode(login.getRandom());
		boolean test = login.sendEmail(email, code);
		if (test) {
			setSendEmail(true);
			sessionMap.put("authcode", getCode());
			sessionMap.put("email", email);
			
		}
		else {
			setSendEmail(false);
		}
		return ActionSupport.SUCCESS;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
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

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public int getUserstatus() {
		return userstatus;
	}

	public void setUserstatus(int userstatus) {
		this.userstatus = userstatus;
	}

	public boolean isValidUser() {
		return validUser;
	}

	public void setValidUser(boolean validUser) {
		this.validUser = validUser;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public SessionMap<String, Object> getSessionMap() {
		return sessionMap;
	}

	public void setSessionMap(SessionMap<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}

	public int getCtr() {
		return ctr;
	}

	public void setCtr(int ctr) {
		this.ctr = ctr;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public boolean getNoData() {
		return noData;
	}

	public void setNoData(boolean noData) {
		this.noData = noData;
	}

	

	public void setCode(String code) {
		this.code = code;
	}
	public String getCode() {
		return code;
	}
	public boolean getSendEmail() {
		return sendEmail;
	}

	public void setSendEmail(boolean sendEmail) {
		this.sendEmail = sendEmail;
	}

}
