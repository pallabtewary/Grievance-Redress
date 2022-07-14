/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.redress.models;

/**
 *
 * @author ANIRBAN
 */
public class ProductOwned {

    private int ownid;
    private int pid;
    private int prodid;
    private String prodname;
    private String prodmodel;

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

    /**
     * @return the pid
     */
    public int getPid() {
        return pid;
    }

    /**
     * @param pid the pid to set
     */
    public void setPid(int pid) {
        this.pid = pid;
    }

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
}
