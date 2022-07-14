package com.redress.dao;

import com.redress.core.ConnectionManager;
import com.redress.models.Complaint;
import com.redress.models.ProductOwned;
import com.redress.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

	public List<User> report(int pid) throws SQLException, Exception {
		ResultSet rs = null;
		Connection con = null;
		List<User> userList = new ArrayList<>();
		try {
			String sql = "SELECT pid, username, firstname, lastname, address, email, phno  FROM userinfo WHERE pid=?";
			con = ConnectionManager.getConnection();

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pid);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setPid(rs.getInt("pid"));
				user.setUsername(rs.getString("username"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setPhno(rs.getString("phno"));

				userList.add(user);
			}
			return userList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public List<Complaint> complaintListbyPid(int pid) throws SQLException, Exception {
		ResultSet rs = null;
		Connection con = null;
		List<Complaint> complaintList = new ArrayList<>();

		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT c.complid,ui.firstname,ui.lastname,c.compltime,p.prodmodel,"
					+ "p.prodname,c.subject,c.description, c.compl_status,t.techid,t.techname, "
					+ "c.startprog, c.ongoingprog,c.endprog, c.res_status, c.feedback_status FROM complaint c "
					+ "LEFT JOIN userinfo ui ON c.pid = ui.pid " + "LEFT JOIN technician t ON c.techid = t.techid "
					+ "LEFT JOIN productowned po ON c.ownid = po.ownid "
					+ "LEFT JOIN product p ON c.ownid = p.prodid WHERE c.pid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pid);
			rs = ps.executeQuery();

			while (rs.next()) {
				Complaint complaint = new Complaint();

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
				complaint.setFeedback_status(rs.getInt("feedback_status"));

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

	public List<ProductOwned> productsByPid(int pid) throws SQLException, Exception {
		ResultSet rs = null;
		Connection con = null;
		List<ProductOwned> ProductOwnedList = new ArrayList<>();
		try {
			String sql = "SELECT po.ownid,p.prodmodel,p.prodname FROM product p LEFT JOIN productowned po ON p.prodid = po.prodid WHERE po.pid =?";
			con = ConnectionManager.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pid);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductOwned ownedProduct = new ProductOwned();

				ownedProduct.setOwnid(rs.getInt("ownid"));
				ownedProduct.setProdmodel(rs.getString("prodmodel"));
				ownedProduct.setProdname(rs.getString("prodname"));
				ProductOwnedList.add(ownedProduct);
			}
			return ProductOwnedList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public ProductOwned fetchUserDetails(String pid) throws SQLException, Exception {
		ResultSet rs = null;
		Connection con = null;
		ProductOwned productowned = new ProductOwned();
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT ownid, prodid users WHERE pid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, pid);
			rs = ps.executeQuery();
			if (rs.next()) {
				productowned.setOwnid(rs.getInt("ownid"));
				productowned.setProdid(rs.getInt("prodid"));
			}
			return productowned;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public int ComplaintRegister(Timestamp compltime, String subject, String description, int pid, int ownid)
			throws Exception {
		int i = 0;
		Connection con = null;
		try {
			con = ConnectionManager.getConnection();
			String sql = "INSERT INTO complaint(compltime,subject,description,pid,ownid) VALUES (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setTimestamp(1, compltime);
			ps.setString(2, subject);
			ps.setString(3, description);
			ps.setInt(4, pid);
			ps.setInt(5, ownid);

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

	public int FeedbackRegister(int complid,String feedback, int rating) throws SQLException {
		int i = 0;
		Connection con = null;
		try {
			con = ConnectionManager.getConnection();

			String sql = "INSERT INTO feedback(complid,feedback,rating) VALUES(?,?,?);";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, complid);
			ps.setString(2, feedback);
			ps.setInt(3, rating);

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
	
	public int updateFeedbackStatus(int complid) throws SQLException {
		int i = 0;
		Connection con = null;
		try {
			con = ConnectionManager.getConnection();

			String sql = "UPDATE complaint SET feedback_status = ? WHERE complid = ? ;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, 1);
			ps.setInt(2, complid);
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


	public int sendMessage(String firstname, String email, String phno, String message, int pid, String username)
			throws Exception {
		int i = 0;
		Connection con = null;
		try {
			con = ConnectionManager.getConnection();
			String sql = "INSERT INTO contact(name,email,phno,message,pid,username) VALUES (?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, firstname);
			ps.setString(2, email);
			ps.setString(3, phno);
			ps.setString(4, message);
			ps.setInt(5, pid);
			ps.setString(6, username);

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
}
