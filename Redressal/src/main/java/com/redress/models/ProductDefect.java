/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.redress.models;

/**
 *
 * @author ANIRBAN
 */
public class ProductDefect {

    private int pdefid;
    private int prodid;
    private String prod_def;

    /**
     * @return the pdefid
     */
    public int getPdefid() {
        return pdefid;
    }

    /**
     * @param pdefid the pdefid to set
     */
    public void setPdefid(int pdefid) {
        this.pdefid = pdefid;
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
     * @return the prod_def
     */
    public String getProd_def() {
        return prod_def;
    }

    /**
     * @param prod_def the prod_def to set
     */
    public void setProd_def(String prod_def) {
        this.prod_def = prod_def;
    }
}
