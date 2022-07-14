package com.redress.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.redress.models.User;
import com.redress.core.ConnectionManager;
import com.redress.models.Department;
import com.redress.models.Product;
import com.redress.models.Technician;

public class AdminDAO {

    public int addCustomers(String username, String password, String firstname, String lastname, String address,
            String email, String phno) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO userinfo(username,password,firstname,lastname,address,email,phno,roleid,userstatus) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setString(5, address);
            ps.setString(6, email);
            ps.setString(7, phno);
            ps.setInt(8, 3);
            ps.setInt(9, 0);

            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int addCSR(String username, String password, String firstname, String lastname, String address,
            String email, String phno) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO userinfo(username,password,firstname,lastname,address,email,phno,roleid,userstatus) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, "1234");
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setString(5, address);
            ps.setString(6, email);
            ps.setString(7, phno);
            ps.setInt(8, 2);
            ps.setInt(9, 0);

            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int addProductToCustomer(int prodid, int pid) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO productowned(pid,prodid) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.setInt(2, prodid);
            System.out.println(ps);

            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    
    public int addProduct(int deptid, String prodname, String prodmodel) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO product(deptid,prodmodel,prodname) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, deptid);
            ps.setString(2, prodmodel);
            ps.setString(3, prodname);

            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int addTechnician(int deptid, String techname) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO technician(techname,deptid) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, techname);
            ps.setInt(2, deptid);


            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int addDepartment(String deptname) throws Exception {
        int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "INSERT INTO department(deptname) VALUES(?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, deptname);


            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    // Update Methods
    public int updateDepartment(int deptid, String deptname,int deptstatus) throws Exception {
    	int i = 0;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            String sql = "UPDATE department SET deptname = ?, deptstatus = ? WHERE deptid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, deptname);
            ps.setInt(2, deptstatus);
            ps.setInt(3, deptid);

            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateTechnician(int techid, int deptid, String techname, int techstatus) throws Exception {
        int i = 0;
        Connection con = null;
        try {

            con = ConnectionManager.getConnection();
            String sql = "UPDATE technician SET techname = ?, deptid =? , techstatus = ? WHERE techid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, techname);

            ps.setInt(2, deptid);
            ps.setInt(3, techstatus);
            ps.setInt(4, techid);


            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateProduct(int prodid, String prodname, int deptid, String prodmodel, int prodstatus) throws Exception {

        int i = 0;
        Connection con = null;
        try {

            con = ConnectionManager.getConnection();
            String sql = "UPDATE product SET prodname = ?, deptid =?, prodmodel =?,prodstatus = ? WHERE prodid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, prodname);

            ps.setInt(2, deptid);
            ps.setString(3, prodmodel);
            ps.setInt(4, prodstatus);
            ps.setInt(5, prodid);

            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public int updateUser(int pid, String username, String password, String firstname, String lastname, String address, String email, String phno, int userstatus) throws Exception {
        int i = 0;
        Connection con = null;
        try {

            con = ConnectionManager.getConnection();
            String sql = "UPDATE userinfo SET username = ? , firstname =? , lastname = ?, address =?, email =?, phno =?, userstatus = ? WHERE pid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, username);
            ps.setString(2, firstname);
            ps.setString(3, lastname);
            ps.setString(4, address);
            ps.setString(5, email);
            ps.setString(6, phno);
            ps.setInt(7, userstatus);
            ps.setInt(8, pid);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    
    public int editProfile(int pid, String username, String firstname, String lastname, String address, String email, String phno) throws Exception {
        int i = 0;
        Connection con = null;
        try {

            con = ConnectionManager.getConnection();
            String sql = "UPDATE userinfo SET username = ? , firstname =? , lastname = ?, address =?, email =?, phno =? WHERE pid = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, firstname);
            ps.setString(3, lastname);
            ps.setString(4, address);
            ps.setString(5, email);
            ps.setString(6, phno);
            ps.setInt(7, pid);


            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return i;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public List<User> getAllCustomers() throws SQLException, Exception {
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

    public List<User> getActiveCustomers() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;

        List<User> customerList = new ArrayList<>();
        try {
            String sql = "SELECT pid,username,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE roleid= 3 AND userstatus=1";
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

    public List<User> getInactiveCustomers() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;

        List<User> customerList = new ArrayList<>();
        try {
            String sql = "SELECT pid,username,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE roleid= 3 AND userstatus=0";
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

    public List<User> getDeletedCustomers() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;

        List<User> customerList = new ArrayList<>();
        try {
            String sql = "SELECT pid,username,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE roleid= 3 AND userstatus=2";
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

    public List<User> getAllCSR() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<User> csrList = new ArrayList<>();
        try {
            String sql = "SELECT pid,username,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE roleid=2";
            con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User csr = new User();
                csr.setPid(rs.getInt("pid"));
                csr.setUsername(rs.getString("username"));
                csr.setFirstname(rs.getString("firstname"));
                csr.setLastname(rs.getString("lastname"));
                csr.setAddress(rs.getString("address"));
                csr.setEmail(rs.getString("email"));
                csr.setPhno(rs.getString("phno"));
                csr.setUserstatus(rs.getInt("userstatus"));

                csrList.add(csr);
            }
            return csrList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    public List<User> getActiveCSR() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<User> csrList = new ArrayList<>();
        try {
            String sql = "SELECT pid,username,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE roleid=2 AND userstatus=1";
            con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User csr = new User();
                csr.setPid(rs.getInt("pid"));
                csr.setUsername(rs.getString("username"));
                csr.setFirstname(rs.getString("firstname"));
                csr.setLastname(rs.getString("lastname"));
                csr.setAddress(rs.getString("address"));
                csr.setEmail(rs.getString("email"));
                csr.setPhno(rs.getString("phno"));
                csr.setUserstatus(rs.getInt("userstatus"));

                csrList.add(csr);
            }
            return csrList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    public List<User> getInactiveCSR() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<User> csrList = new ArrayList<>();
        try {
            String sql = "SELECT pid,username,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE roleid=2 AND userstatus=0";
            con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User csr = new User();
                csr.setPid(rs.getInt("pid"));
                csr.setUsername(rs.getString("username"));
                csr.setFirstname(rs.getString("firstname"));
                csr.setLastname(rs.getString("lastname"));
                csr.setAddress(rs.getString("address"));
                csr.setEmail(rs.getString("email"));
                csr.setPhno(rs.getString("phno"));
                csr.setUserstatus(rs.getInt("userstatus"));

                csrList.add(csr);
            }
            return csrList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    public List<User> getDeletedCSR() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<User> csrList = new ArrayList<>();
        try {
            String sql = "SELECT pid,username,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE roleid=2 AND userstatus=2";
            con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User csr = new User();
                csr.setPid(rs.getInt("pid"));
                csr.setUsername(rs.getString("username"));
                csr.setFirstname(rs.getString("firstname"));
                csr.setLastname(rs.getString("lastname"));
                csr.setAddress(rs.getString("address"));
                csr.setEmail(rs.getString("email"));
                csr.setPhno(rs.getString("phno"));
                csr.setUserstatus(rs.getInt("userstatus"));

                csrList.add(csr);
            }
            return csrList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
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

    public List<Technician> getActiveTechnician() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<Technician> technicianList = new ArrayList<>();
        try {
            String sql = "SELECT techid,techname,technician.deptid,deptname,techstatus "
                    + "FROM technician,department WHERE technician.deptid = department.deptid AND techstatus = 1";
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

    public List<Technician> getInactiveTechnician() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<Technician> technicianList = new ArrayList<>();
        try {
            String sql = "SELECT techid,techname,technician.deptid,deptname,techstatus "
                    + "FROM technician,department WHERE technician.deptid = department.deptid AND techstatus = 0";
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

    public List<Department> getDeptComplaintsNum() throws SQLException, Exception {

        ResultSet rs = null;
        Connection con = null;

        List<Department> departmentComplaintCountList = new ArrayList<>();
        try {
            String sql = "select dpp.deptname, (select COUNT(dp.deptid) from complaint c\n"
                    + "inner join productowned p on c.ownid = p.ownid\n"
                    + "inner join product pd on p.prodid = pd.prodid\n"
                    + "inner join department dp on pd.deptid = dp.deptid where dp.deptid = dpp.deptid) complaints from department dpp";
            con = ConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Department departmentComplaintCount = new Department();
                departmentComplaintCount.setDeptname(rs.getString("deptname"));
                departmentComplaintCount.setNoOfComplaints(rs.getInt("complaints"));
                departmentComplaintCountList.add(departmentComplaintCount);

            }

            return departmentComplaintCountList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }

    }

    public int deleteUserDetails(int pid) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE userinfo SET userstatus= 2 WHERE pid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.rollback();
                con.close();
            }
        }
    }

    public int deleteDeptDetails(int deptid) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE department SET deptstatus=0 WHERE deptid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, deptid);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.rollback();
                con.close();
            }
        }
    }

    public int deleteTechDetails(int techid) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE technician SET techstatus=0 WHERE techid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, techid);
            i = ps.executeUpdate();
            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.rollback();
                con.close();
            }
        }
    }

    public int deleteProdDetails(int prodid) throws SQLException, Exception {
        Connection con = ConnectionManager.getConnection();
        int i = 0;
        try {
            String sql = "UPDATE product SET prodstatus=0 WHERE prodid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, prodid);
            i = ps.executeUpdate();

            return i;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (con != null) {
                con.rollback();
                con.close();
            }
        }
    }

//    
    public User fetchUserDetails(int pid) throws Exception {
        ResultSet rs = null;
        Connection con = null;
        User user = new User();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT pid,username,password,firstname,lastname,address,email,phno,userstatus FROM userinfo WHERE pid=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, pid);


            rs = ps.executeQuery();
            if (rs.next()) {
                user.setPid(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setFirstname(rs.getString(4));
                user.setLastname(rs.getString(5));
                user.setAddress(rs.getString(6));
                user.setEmail(rs.getString(7));
                user.setPhno(rs.getString(8));
                user.setUserstatus(rs.getInt(9));
            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    
    public Department fetchDepartmentDetails(int deptid) throws Exception {
        ResultSet rs = null;
        Connection con = null;
        Department department = new Department();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT deptid,deptname,deptstatus from department WHERE deptid = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, deptid);

            rs = ps.executeQuery();
            if (rs.next()) {
                department.setDeptid(rs.getInt("deptid"));
                department.setDeptname(rs.getString("deptname"));
                department.setDeptstatus(rs.getInt("deptstatus"));
            }
            return department;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    
    public Product fetchProductDetails(int prodid) throws Exception {
        ResultSet rs = null;
        Connection con = null;
        Product product = new Product();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT prodid,prodname,prodmodel,prodstatus,product.deptid,deptname FROM product,department WHERE product.deptid = department.deptid AND prodid = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, prodid);

            rs = ps.executeQuery();
            if (rs.next()) {
                product.setProdid(rs.getInt("prodid"));
                product.setProdname(rs.getString("prodname"));
                product.setProdmodel(rs.getString("prodmodel"));
                product.setDeptid(rs.getInt("deptid"));
                product.setProdstatus(rs.getInt("prodstatus"));
                product.setDeptname(rs.getString("deptname"));
            }
            return product;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public Technician fetchTechnicianDetails(int techid) throws Exception {
        ResultSet rs = null;
        Connection con = null;
        Technician tech = new Technician();
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT techid,techname,technician.deptid,techstatus,deptname "
                    + "FROM technician,department WHERE technician.deptid = department.deptid AND techid =?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, techid);

            rs = ps.executeQuery();
            if (rs.next()) {
                tech.setTechid(rs.getInt("techid"));
                tech.setTechname(rs.getString("techname"));
                tech.setDeptid(rs.getInt("deptid"));
                tech.setTechstatus(rs.getInt("techstatus"));
                tech.setDeptname(rs.getString("deptname"));
            }
            return tech;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }


    public List<Product> getDeletedProducts() throws SQLException, Exception {
        ResultSet rs = null;
        Connection con = null;

        List<Product> productList = new ArrayList<>();
        try {
            String sql = "SELECT prodid,prodname,prodmodel,deptname,prodstatus FROM product,department where product.deptid = department.deptid and prodstatus = 0";
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
    
	public int updatePassword(String password, String email) throws Exception {
		int i = 0;
		Connection con = null;
		try {
			con = ConnectionManager.getConnection();
			String sql = "UPDATE userinfo SET password = ? WHERE email = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);
			i = ps.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			return i;
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}
	
	public int checkUsername(String username) throws Exception {
        ResultSet rs = null;
        Connection con = null;
        try {
            con = ConnectionManager.getConnection();
            System.out.println(username);
            String sql = "SELECT * FROM userinfo WHERE username =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
            	User user = new User();
            	user.setPid(rs.getInt("pid"));
                return user.getPid();
            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }


}
