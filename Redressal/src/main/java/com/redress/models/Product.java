/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.redress.models;

/**
 *
 * @author ANIRBAN
 */
public class Product {

    private int prodid;
    private int deptid;
    private int pid;
    private String prodmodel;
    private String prodname;
    private String deptname;
    private int prodstatus;
    private int ownid;
    
    /**
     * @return the prodid
     */
    public int getProdid() {
        return prodid;
    }

    /**
     * @param prodid the prodid to set
     */
    public void setProdid(int prodid) {
        this.prodid = prodid;
    }

    public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

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
     * @return the prodmodel
     */
    public String getProdmodel() {
        return prodmodel;
    }

    /**
     * @param prodmodel the prodmodel to set
     */
    public void setProdmodel(String prodmodel) {
        this.prodmodel = prodmodel;
    }

    /**
     * @return the prodname
     */
    public String getProdname() {
        return prodname;
    }

    /**
     * @param prodname the prodname to set
     */
    public void setProdname(String prodname) {
        this.prodname = prodname;
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
     * @return the prodstatus
     */
    public int getProdstatus() {
        return prodstatus;
    }

    /**
     * @param prodstatus the prodstatus to set
     */
    public void setProdstatus(int prodstatus) {
        this.prodstatus = prodstatus;
    }

    /**
     * @return the ownid
     */
    public int getOwnid() {
        return ownid;
    }

    /**
     * @param ownid the ownid to set
     */
    public void setOwnid(int ownid) {
        this.ownid = ownid;
    }
}
