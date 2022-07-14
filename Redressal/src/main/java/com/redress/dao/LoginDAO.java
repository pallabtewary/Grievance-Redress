/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.redress.dao;

import com.redress.core.ConnectionManager;

import com.redress.models.User;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class LoginDAO {

	public String getPasswordHash(String username) throws SQLException, Exception {
		ResultSet rs = null;
		Connection con = null;
		String hash = null;
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT password FROM userinfo WHERE username=?";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("userName = " + username);
			ps.setString(1, username);
			System.out.println("Select SQL = " + ps);

			rs = ps.executeQuery();
			if (rs.next()) {

				hash = rs.getString("password");
				System.out.println("Password hash:" + hash);

			}
			return hash;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (con != null) {
				con.close();
			}
		}
	}

	public User validLoginCredential(String username) throws SQLException, Exception {
		ResultSet rs = null;
		Connection con = null;
		User user = new User();
		user.setValidUser(false);
		try {
			con = ConnectionManager.getConnection();
			String sql = "SELECT pid,username,password,firstname,lastname,address,email,phno,roleid,userstatus FROM userinfo WHERE username=?";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("userName = " + username);
			ps.setString(1, username);
			System.out.println("Select SQL = " + ps);

			rs = ps.executeQuery();
			if (rs.next()) {

				user.setPid(rs.getInt("pid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setPhno(rs.getString("phno"));
				user.setRoleid(rs.getInt("roleid"));
				user.setUserstatus(rs.getInt("userstatus"));
				System.out.println("Username" + user.getUsername());
				System.out.println(user.getPhno());

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

	public int checkEmail(String email) throws Exception {
		ResultSet rs = null;
		Connection con = null;
		try {
			con = ConnectionManager.getConnection();
			System.out.println(email);
			String sql = "SELECT * FROM userinfo WHERE email =? AND userstatus =1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				return 1;
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

	public int changePassword(String password, int pid) throws Exception {
		int i = 0;
		Connection con = null;
		try {
//            System.out.println("all etch"+ techname + techid);
			con = ConnectionManager.getConnection();
			String sql = "UPDATE userinfo SET password =?,userstatus = 1 WHERE pid = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, password);
			ps.setInt(2, pid);
			System.out.println("SQL for insert=" + ps);
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

	public String getRandom() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		return String.format("%06d", number);
	}

	public boolean sendEmail(String to, String code) {

		boolean send = false;
		String subject = "Forgot Password : Verfication Code";
		String from = "onlinegrievanceredressal@gmail.com";

		/*
		 * Constructing String Builder to append the string into the html
		 */
		StringBuilder html = new StringBuilder();

		// Reading html file on local directory
		FileReader fr;
		try {
			fr = new FileReader(
					"F:\\ExavaluTraining\\Git\\Grievance-Redressal\\Redressal\\src\\main\\webapp\\otpTemplate.html");
			// Initialization of the buffered Reader to get
			// the String append to the String Builder
			BufferedReader br = new BufferedReader(fr);
			String val;

			// Reading the String till we get the null
			// string and appending to the string
			while ((val = br.readLine()) != null) {
				html.append(val);
			}
			String result = html.toString();
			String message = result.replace("#OTP", code);

			send = sendEmails(message, subject, to, from);
			br.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

		return send;

	}

	private static boolean sendEmails(String message, String subject, String to, String from) {
		boolean send = false;

// Variable for gmail host
		String host = "smtp.gmail.com";
// get the system properties
		Properties properties = System.getProperties();
		System.out.println(properties);
		// Setting important information to properties object

		// host set
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		// Step 1: To get the session object

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication("onlinegrievanceredressal@gmail.com", "pjlaymnalfcnrank");
			}

		});
		session.setDebug(true);
		// Step 2: Compose the message
		MimeMessage m = new MimeMessage(session);
		try {
			m.setFrom(new InternetAddress(from, "SmartSecurity Services"));
			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			m.setSubject(subject);
			m.setContent(message, "text/html");

			// Step 3: Send the message using Transport class

			Transport.send(m);
			send = true;
			System.out.println("Sent success...");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return send;

	}
}
