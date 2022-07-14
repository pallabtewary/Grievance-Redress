/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.redress.dao;

import com.redress.core.ConnectionManager;
import com.redress.models.Complaint;
import com.redress.models.CustomerDefect;
import com.redress.models.Department;
import com.redress.models.Product;
import com.redress.models.Technician;
import com.redress.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CSRDAO {

	public List<Product> getAllProducts() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;

        List<Product> productList = new ArrayList<>();
        try {
            String sql = "SELECT prodid,prodname,prodmodel,deptname,prodstatus FROM product,department where product.deptid = department.deptid";
            con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProdname(rs.getString("prodname"));
                product.setProdid(rs.getInt("prodid"));
                product.setProdmodel(rs.getString("prodmodel"));
                product.setDeptname(rs.getString("deptname"));
                product.setProdstatus(rs.getInt("prodstatus"));
                productList.add(product);
            }
            return productList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }
	
    public List<User> customerList() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<User> customerList = new ArrayList<>();
        try {
            String sql = "SELECT pid,username,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE roleid=3";
            con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User customer = new User();
                customer.setPid(rs.getInt("pid"));
                customer.setUsername(rs.getString("username"));
                customer.setFirstname(rs.getString("firstname"));
                customer.setLastname(rs.getString("lastname"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setPhno(rs.getString("phno"));
                customer.setUserstatus(rs.getInt("userstatus"));

                customerList.add(customer);
            }
            return customerList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    public List<Department> departmentList() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;
        List<Department> departmentList = new ArrayList<>();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT deptid,deptname,deptstatus FROM department";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Department department = new Department();

                department.setDeptid(rs.getInt("deptid"));
                department.setDeptname(rs.getString("deptname"));
                department.setDeptstatus(rs.getInt("deptstatus"));

                departmentList.add(department);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return departmentList;
    }

    public List<Complaint> complaintList() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Complaint> complaintList = new ArrayList<>();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT c.pid,c.complid,ui.firstname,ui.lastname,c.compltime,p.prodmodel,"
                    + "p.prodname,c.subject,c.description, c.compl_status,t.techid,t.techname, "
                    + "c.startprog, c.ongoingprog,c.endprog, c.res_status FROM complaint c "
                    + "LEFT JOIN userinfo ui ON c.pid = ui.pid "
                    + "LEFT JOIN technician t ON c.techid = t.techid "
                    + "LEFT JOIN productowned po ON c.ownid = po.ownid "
                    + "LEFT JOIN product p ON c.ownid = p.prodid";
            
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setPid(rs.getInt("pid"));
                complaint.setComplid(rs.getInt("complid"));
                complaint.setFirstname(rs.getString("firstname"));
                complaint.setLastname(rs.getString("lastname"));
                complaint.setCompltime(rs.getString("compltime"));
                complaint.setProdmodel(rs.getString("prodmodel"));
                complaint.setProdname(rs.getString("prodname"));
                complaint.setSubject(rs.getString("subject"));
                complaint.setDescription(rs.getString("description"));
                complaint.setTechid(rs.getInt("techid"));
                complaint.setTechname(rs.getString("techname"));
                complaint.setCompl_status(rs.getInt("compl_status"));
                complaint.setStartprog(rs.getString("startprog"));
                complaint.setOngoingprog(rs.getString("ongoingprog"));
                complaint.setEndprog(rs.getString("endprog"));
                complaint.setRes_status(rs.getInt("res_status"));
                

                complaintList.add(complaint);

            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return complaintList;
    }  //To change body of generated methods, choose Tools | Templates.

    
    public List<Complaint> resolvedComplaintList() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Complaint> complaintList = new ArrayList<>();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT c.pid,c.complid,ui.firstname,ui.lastname,c.compltime,p.prodmodel,"
                    + "p.prodname,c.subject,c.description, c.compl_status,t.techid,t.techname, "
                    + "c.startprog, c.ongoingprog,c.endprog, c.res_status FROM complaint c "
                    + "LEFT JOIN userinfo ui ON c.pid = ui.pid "
                    + "LEFT JOIN technician t ON c.techid = t.techid "
                    + "LEFT JOIN productowned po ON c.ownid = po.ownid "
                    + "LEFT JOIN product p ON c.ownid = p.prodid WHERE c.res_status = 1";
            
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setPid(rs.getInt("pid"));
                complaint.setComplid(rs.getInt("complid"));
                complaint.setFirstname(rs.getString("firstname"));
                complaint.setLastname(rs.getString("lastname"));
                complaint.setCompltime(rs.getString("compltime"));
                complaint.setProdmodel(rs.getString("prodmodel"));
                complaint.setProdname(rs.getString("prodname"));
                complaint.setSubject(rs.getString("subject"));
                complaint.setDescription(rs.getString("description"));
                complaint.setTechid(rs.getInt("techid"));
                complaint.setTechname(rs.getString("techname"));
                complaint.setCompl_status(rs.getInt("compl_status"));
                complaint.setStartprog(rs.getString("startprog"));
                complaint.setOngoingprog(rs.getString("ongoingprog"));
                complaint.setEndprog(rs.getString("endprog"));
                complaint.setRes_status(rs.getInt("res_status"));
                

                complaintList.add(complaint);

            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return complaintList;
    }  //To change body of generated methods, choose Tools | Templates.

    
    public List<Complaint> unResolvedComplaintList() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Complaint> complaintList = new ArrayList<>();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT c.pid,c.complid,ui.firstname,ui.lastname,c.compltime,p.prodmodel,"
                    + "p.prodname,c.subject,c.description, c.compl_status,t.techid,t.techname, "
                    + "c.startprog, c.ongoingprog,c.endprog, c.res_status FROM complaint c "
                    + "LEFT JOIN userinfo ui ON c.pid = ui.pid "
                    + "LEFT JOIN technician t ON c.techid = t.techid "
                    + "LEFT JOIN productowned po ON c.ownid = po.ownid "
                    + "LEFT JOIN product p ON c.ownid = p.prodid WHERE c.compl_status = 1 and c.res_status = 0";
            
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setPid(rs.getInt("pid"));
                complaint.setComplid(rs.getInt("complid"));
                complaint.setFirstname(rs.getString("firstname"));
                complaint.setLastname(rs.getString("lastname"));
                complaint.setCompltime(rs.getString("compltime"));
                complaint.setProdmodel(rs.getString("prodmodel"));
                complaint.setProdname(rs.getString("prodname"));
                complaint.setSubject(rs.getString("subject"));
                complaint.setDescription(rs.getString("description"));
                complaint.setTechid(rs.getInt("techid"));
                complaint.setTechname(rs.getString("techname"));
                complaint.setCompl_status(rs.getInt("compl_status"));
                complaint.setStartprog(rs.getString("startprog"));
                complaint.setOngoingprog(rs.getString("ongoingprog"));
                complaint.setEndprog(rs.getString("endprog"));
                complaint.setRes_status(rs.getInt("res_status"));
                

                complaintList.add(complaint);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return complaintList;
    }  //To change body of generated methods, choose Tools | Templates.

    public List<Complaint> newComplaintList() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Complaint> complaintList = new ArrayList<>();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT c.pid,c.complid,ui.firstname,ui.lastname,c.compltime,p.prodmodel,"
                    + "p.prodname,c.subject,c.description, c.compl_status,t.techid,t.techname, "
                    + "c.startprog, c.ongoingprog,c.endprog, c.res_status FROM complaint c "
                    + "LEFT JOIN userinfo ui ON c.pid = ui.pid "
                    + "LEFT JOIN technician t ON c.techid = t.techid "
                    + "LEFT JOIN productowned po ON c.ownid = po.ownid "
                    + "LEFT JOIN product p ON c.ownid = p.prodid WHERE c.compl_status = 0";
            
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setPid(rs.getInt("pid"));
                complaint.setComplid(rs.getInt("complid"));
                complaint.setFirstname(rs.getString("firstname"));
                complaint.setLastname(rs.getString("lastname"));
                complaint.setCompltime(rs.getString("compltime"));
                complaint.setProdmodel(rs.getString("prodmodel"));
                complaint.setProdname(rs.getString("prodname"));
                complaint.setSubject(rs.getString("subject"));
                complaint.setDescription(rs.getString("description"));
                complaint.setTechid(rs.getInt("techid"));
                complaint.setTechname(rs.getString("techname"));
                complaint.setCompl_status(rs.getInt("compl_status"));
                complaint.setStartprog(rs.getString("startprog"));
                complaint.setOngoingprog(rs.getString("ongoingprog"));
                complaint.setEndprog(rs.getString("endprog"));
                complaint.setRes_status(rs.getInt("res_status"));
                complaintList.add(complaint);

            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return complaintList;
    }  //To change body of generated methods, choose Tools | Templates.
    
    public List<Complaint> rejectedComplaintList() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Complaint> complaintList = new ArrayList<>();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT c.pid,c.complid,ui.firstname,ui.lastname,c.compltime,p.prodmodel,"
                    + "p.prodname,c.subject,c.description, c.compl_status,t.techid,t.techname, "
                    + "c.startprog, c.ongoingprog,c.endprog, c.res_status FROM complaint c "
                    + "LEFT JOIN userinfo ui ON c.pid = ui.pid "
                    + "LEFT JOIN technician t ON c.techid = t.techid "
                    + "LEFT JOIN productowned po ON c.ownid = po.ownid "
                    + "LEFT JOIN product p ON c.ownid = p.prodid WHERE c.compl_status = 2";
            
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setPid(rs.getInt("pid"));
                complaint.setComplid(rs.getInt("complid"));
                complaint.setFirstname(rs.getString("firstname"));
                complaint.setLastname(rs.getString("lastname"));
                complaint.setCompltime(rs.getString("compltime"));
                complaint.setProdmodel(rs.getString("prodmodel"));
                complaint.setProdname(rs.getString("prodname"));
                complaint.setSubject(rs.getString("subject"));
                complaint.setDescription(rs.getString("description"));
                complaint.setTechid(rs.getInt("techid"));
                complaint.setTechname(rs.getString("techname"));
                complaint.setCompl_status(rs.getInt("compl_status"));
                complaint.setStartprog(rs.getString("startprog"));
                complaint.setOngoingprog(rs.getString("ongoingprog"));
                complaint.setEndprog(rs.getString("endprog"));
                complaint.setRes_status(rs.getInt("res_status"));
                
                complaintList.add(complaint);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return complaintList;
    }  //To change body of generated methods, choose Tools | Templates.

    
    public List<CustomerDefect> customerDefect() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<CustomerDefect> customerdefect = new ArrayList<>();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM customerdefects";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                CustomerDefect defect = new CustomerDefect();

                defect.setCusdefid(rs.getInt("cusdefid"));
                defect.setOwnid(rs.getInt("ownid"));
                defect.setCus_def(rs.getString("cus_def"));

                customerdefect.add(defect);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return customerdefect;
    } //To change body of generated methods, choose Tools | Templates.

    public Complaint fetchComplaintDetails(int complid) throws SQLException {
        ResultSet rs = null;
        Connection con = null;
        Complaint complaint = new Complaint();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT c.pid,c.complid,ui.firstname,ui.lastname,c.compltime,p.prodmodel,"
                    + "p.prodname,c.subject,c.description, c.compl_status,t.techid,t.techname, "
                    + "c.startprog, c.ongoingprog,c.endprog, c.res_status FROM complaint c "
                    + "LEFT JOIN userinfo ui ON c.pid = ui.pid "
                    + "LEFT JOIN technician t ON c.techid = t.techid "
                    + "LEFT JOIN productowned po ON c.ownid = po.ownid "
                    + "LEFT JOIN product p ON c.ownid = p.prodid WHERE c.complid = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
             ps.setInt(1, complid);
            rs = ps.executeQuery();
            if (rs.next()) {

                complaint.setPid(rs.getInt("pid"));
                complaint.setComplid(rs.getInt("complid"));
                complaint.setFirstname(rs.getString("firstname"));
                complaint.setLastname(rs.getString("lastname"));
                complaint.setCompltime(rs.getString("compltime"));
                complaint.setProdmodel(rs.getString("prodmodel"));
                complaint.setProdname(rs.getString("prodname"));
                complaint.setSubject(rs.getString("subject"));
                complaint.setDescription(rs.getString("description"));
                complaint.setTechid(rs.getInt("techid"));
                complaint.setTechname(rs.getString("techname"));
                complaint.setCompl_status(rs.getInt("compl_status"));
                complaint.setStartprog(rs.getString("startprog"));
                complaint.setOngoingprog(rs.getString("ongoingprog"));
                complaint.setEndprog(rs.getString("endprog"));
                complaint.setRes_status(rs.getInt("res_status"));
            }
            return complaint;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        } //To change body of generated methods, choose Tools | Templates.
    }

    public int updateComplaintDetails(int complid, int techid, int compl_status, String startprog, String ongoingprog, String endprog, int res_status) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE complaint SET techid = ?, compl_status = ?, startprog = ?, ongoingprog = ?, endprog = ?, res_status = ?\n"
                    + "WHERE complid = ?;";
            PreparedStatement ps = con.prepareStatement(sql);

            
            ps.setInt(1,techid);
            ps.setInt(2,compl_status);
            ps.setString(3,startprog);
            ps.setString(4,ongoingprog);
            ps.setString(5,endprog);
            ps.setInt(6,res_status);
            ps.setInt(7,complid);
            
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.close();
            }
        }    
    }
    
    public List<Technician> getAllTechnician() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<Technician> technicianList = new ArrayList<>();
        try {
            String sql = "SELECT techid,techname,technician.deptid,deptname,techstatus "
                    + "FROM technician,department WHERE technician.deptid = department.deptid";
            con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Technician tech = new Technician();
                tech.setTechid(rs.getInt("techid"));
                tech.setTechname(rs.getString("techname"));
                tech.setDeptid(rs.getInt("deptid"));
                tech.setTechstatus(rs.getInt("techstatus"));
                tech.setDeptname(rs.getString("deptname"));

                technicianList.add(tech);
            }
            return technicianList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    public List<Technician> fetchTechnician(int deptid) throws SQLException {
        ResultSet rs = null;
        Connection con = null;
        Technician technician = new Technician();
        List<Technician> techList = new ArrayList<>();

        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT techid,techname FROM technician where deptid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, deptid);

            rs = ps.executeQuery();
            while (rs.next()) {
                technician.setTechid(rs.getInt("techid"));
                technician.setTechname(rs.getString("techname"));
                techList.add(technician);
            }
            return techList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
     public List<Complaint> csrcomplaintList() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;
        List<Complaint> complaintList = new ArrayList<>();

        try {

            con = ConnectionManager.getConnection();
            String sql = "SELECT c.pid,c.complid,ui.firstname,ui.lastname,c.compltime,p.prodmodel,"
                    + "p.prodname,c.subject,c.description, c.compl_status,t.techid,t.techname, "
                    + "c.startprog, c.ongoingprog,c.endprog, c.res_status FROM complaint c "
                    + "LEFT JOIN userinfo ui ON c.pid = ui.pid "
                    + "LEFT JOIN technician t ON c.techid = t.techid "
                    + "LEFT JOIN productowned po ON c.ownid = po.ownid "
                    + "LEFT JOIN product p ON c.ownid = p.prodid";
            
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setPid(rs.getInt("pid"));
                complaint.setComplid(rs.getInt("complid"));
                complaint.setFirstname(rs.getString("firstname"));
                complaint.setLastname(rs.getString("lastname"));
                complaint.setCompltime(rs.getString("compltime"));
                complaint.setProdmodel(rs.getString("prodmodel"));
                complaint.setProdname(rs.getString("prodname"));
                complaint.setSubject(rs.getString("subject"));
                complaint.setDescription(rs.getString("description"));
                complaint.setTechid(rs.getInt("techid"));
                complaint.setTechname(rs.getString("techname"));
                complaint.setCompl_status(rs.getInt("compl_status"));
                complaint.setStartprog(rs.getString("startprog"));
                complaint.setOngoingprog(rs.getString("ongoingprog"));
                complaint.setEndprog(rs.getString("endprog"));
                complaint.setRes_status(rs.getInt("res_status"));
                
                complaintList.add(complaint);

          

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return complaintList;
    }


}
