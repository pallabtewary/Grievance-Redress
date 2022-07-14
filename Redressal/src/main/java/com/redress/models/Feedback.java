/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.redress.models;

/**
 *
 * @author ANIRBAN
 */
public class Feedback {

    private int fbackid;
    private int complid;
    private String feedback;
    private int rating;

    /**
     * @return the fbackid
     */
    public int getFbackid() {
        return fbackid;
    }

    /**
     * @param fbackid the fbackid to set
     */
    public void setFbackid(int fbackid) {
        this.fbackid = fbackid;
    }

    /**
     * @return the complid
     */
    public int getComplid() {
        return complid;
    }

    /**
     * @param complid the complid to set
     */
    public void setComplid(int complid) {
        this.complid = complid;
    }

    /**
     * @return the feedback
     */
    public String getFeedback() {
        return feedback;
    }

    /**
     * @param feedback the feedback to set
     */
    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    /**
     * @return the rating
     */
    public int getRating() {
        return rating;
    }

    /**
     * @param rating the rating to set
     */
    public void setRating(int rating) {
        this.rating = rating;
    }
}
