package com.redress.actions;

import com.redress.dao.AdminDAO;
import com.redress.dao.CSRDAO;
import com.redress.models.Complaint;
import com.redress.models.Department;
import com.redress.models.User;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class AdminDashboard {
    private String msg = "";
     private List<User> userList = null;
     private List<Complaint> complaintList = null;
     private List<Complaint> resolvedComplaint = null;
     private List<Complaint> unresolvedComplaint = null;
     private List<Complaint> rejectedComplaint = null;
     private List<Department> deptList = null;
     AdminDAO admin = new AdminDAO();
     CSRDAO csr = new CSRDAO();

    public String execute() throws Exception {
        
        HttpSession session = ServletActionContext.getRequest().getSession(false);
        
        if (session == null || session.getAttribute("validUser") == null) {
            setMsg("You are not logged in. Please login first!! ");
            return "login";
        } else {
            setUserList(new ArrayList<User>());
            setUserList(admin.getAllCustomers());
            setComplaintList(csr.complaintList());
            setResolvedComplaint(csr.resolvedComplaintList());
            setUnresolvedComplaint(csr.unResolvedComplaintList());
            setRejectedComplaint(csr.rejectedComplaintList());
            setDeptList(admin.getDeptComplaintsNum());
            return "success";
        }

    }

    /**
     * @return the msg
     */
    public String getMsg() {
        return msg;
    }

    /**
     * @param msg the msg to set
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * @return the userList
     */
    public List<User> getUserList() {
        return userList;
    }

    /**
     * @param userList the userList to set
     */
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    /**
     * @return the complaintList
     */
    public List<Complaint> getComplaintList() {
        return complaintList;
    }

    /**
     * @param complaintList the complaintList to set
     */
    public void setComplaintList(List<Complaint> complaintList) {
        this.complaintList = complaintList;
    }

    /**
     * @return the resolvedComplaint
     */
    public List<Complaint> getResolvedComplaint() {
        return resolvedComplaint;
    }

    /**
     * @param resolvedComplaint the resolvedComplaint to set
     */
    public void setResolvedComplaint(List<Complaint> resolvedComplaint) {
        this.resolvedComplaint = resolvedComplaint;
    }

    /**
     * @return the unresolvedComplaint
     */
    public List<Complaint> getUnresolvedComplaint() {
        return unresolvedComplaint;
    }

    /**
     * @param unresolvedComplaint the unresolvedComplaint to set
     */
    public void setUnresolvedComplaint(List<Complaint> unresolvedComplaint) {
        this.unresolvedComplaint = unresolvedComplaint;
    }

    /**
     * @return the rejectedComplaint
     */
    public List<Complaint> getRejectedComplaint() {
        return rejectedComplaint;
    }

    /**
     * @param rejectedComplaint the rejectedComplaint to set
     */
    public void setRejectedComplaint(List<Complaint> rejectedComplaint) {
        this.rejectedComplaint = rejectedComplaint;
    }

    /**
     * @return the deptList
     */
    public List<Department> getDeptList() {
        return deptList;
    }

    /**
     * @param deptList the deptList to set
     */
    public void setDeptList(List<Department> deptList) {
        this.deptList = deptList;
    }
}
