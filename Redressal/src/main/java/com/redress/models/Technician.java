/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.redress.models;

/**
 *
 * @author ANIRBAN
 */
public class Technician {

    private int techid;
    private String techname;
    private int deptid;
    private int techstatus;
    private String deptname;

    /**
     * @return the techid
     */
    public int getTechid() {
        return techid;
    }

    /**
     * @param techid the techid to set
     */
    public void setTechid(int techid) {
        this.techid = techid;
    }

    /**
     * @return the techname
     */
    public String getTechname() {
        return techname;
    }

    /**
     * @param techname the techname to set
     */
    public void setTechname(String techname) {
        this.techname = techname;
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
     * @return the techstatus
     */
    public int getTechstatus() {
        return techstatus;
    }

    /**
     * @param techstatus the techstatus to set
     */
    public void setTechstatus(int techstatus) {
        this.techstatus = techstatus;
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

}
