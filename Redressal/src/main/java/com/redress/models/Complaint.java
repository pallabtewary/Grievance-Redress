package com.redress.models;

public class Complaint {
	private int complid;
	private String compltime;
	private String subject;
	private String description;
	private int pid;
	private int techid;
	private int compl_status;
	private String startprog;
	private String ongoingprog;
	private String endprog;
	private int res_status;
	private String techname;
	private String username;
	private String firstname;
	private String lastname;
	private String prodmodel;
	private String prodname;
	private int feedback_status;

	public int getFeedback_status() {
		return feedback_status;
	}

	public void setFeedback_status(int feedback_status) {
		this.feedback_status = feedback_status;
	}

	public int getComplid() {
		return complid;
	}

	public void setComplid(int complid) {
		this.complid = complid;
	}

	public String getCompltime() {
		return compltime;
	}

	public void setCompltime(String compltime) {
		this.compltime = compltime;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getTechid() {
		return techid;
	}

	public void setTechid(int techid) {
		this.techid = techid;
	}

	public int getCompl_status() {
		return compl_status;
	}

	public void setCompl_status(int compl_status) {
		this.compl_status = compl_status;
	}

	public String getStartprog() {
		return startprog;
	}

	public void setStartprog(String startprog) {
		this.startprog = startprog;
	}

	public String getOngoingprog() {
		return ongoingprog;
	}

	public void setOngoingprog(String ongoingprog) {
		this.ongoingprog = ongoingprog;
	}

	public String getEndprog() {
		return endprog;
	}

	public void setEndprog(String endprog) {
		this.endprog = endprog;
	}

	public int getRes_status() {
		return res_status;
	}

	public void setRes_status(int res_status) {
		this.res_status = res_status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getTechname() {
		return techname;
	}

	public void setTechname(String techname) {
		this.techname = techname;
	}
}
