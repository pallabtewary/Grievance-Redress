/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.redress.models;

/**
 *
 * @author ANIRBAN
 */
public class CustomerDefect {

    private int cusdefid;
    private int ownid;
    private String cus_def;

    /**
     * @return the cusdefid
     */
    public int getCusdefid() {
        return cusdefid;
    }

    /**
     * @param cusdefid the cusdefid to set
     */
    public void setCusdefid(int cusdefid) {
        this.cusdefid = cusdefid;
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

    /**
     * @return the cus_def
     */
    public String getCus_def() {
        return cus_def;
    }

    /**
     * @param cus_def the cus_def to set
     */
    public void setCus_def(String cus_def) {
        this.cus_def = cus_def;
    }
}
