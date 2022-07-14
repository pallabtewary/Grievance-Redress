/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.redress.models;

/**
 *
 * @author ANIRBAN
 */
public class Department {

    private int deptid;
    private String deptname;
    private int deptstatus;
    private int noOfComplaints;

    /**
     * @return the deptid
     */
    public int getDeptid() {
        return deptid;
    }

    /**
     * @param deptid the deptid to set
     */
    public void setDeptid(int deptid) {
        this.deptid = deptid;
    }

    /**
     * @return the deptname
     */
    public String getDeptname() {
        return deptname;
    }

    /**
     * @param deptname the deptname to set
     */
    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    /**
     * @return the deptstatus
     */
    public int getDeptstatus() {
        return deptstatus;
    }

    /**
     * @param deptstatus the deptstatus to set
     */
    public void setDeptstatus(int deptstatus) {
        this.deptstatus = deptstatus;
    }

    /**
     * @return the noOfComplaints
     */
    public int getNoOfComplaints() {
        return noOfComplaints;
    }

    /**
     * @param noOfComplaints the noOfComplaints to set
     */
    public void setNoOfComplaints(int noOfComplaints) {
        this.noOfComplaints = noOfComplaints;
    }
}
