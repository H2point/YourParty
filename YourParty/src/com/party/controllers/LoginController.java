package com.party.controllers;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.party.dao.UserDao;
import com.party.util.HibernateUtil;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao loginDao;

	public void init() {
		loginDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( "/login.jsp" ).forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			if (loginDao.validate(username, password) != -1) {
				HttpSession session = request.getSession(true);
				int id = loginDao.validate(username, password);
				
				Session sess = HibernateUtil.getSessionFactory().openSession();
	    		String email= (String)sess.createQuery("SELECT email FROM User u WHERE u.id= :id").setInteger("id",id).uniqueResult();
				
				session.setAttribute("id", id);
				session.setAttribute("email",email);
                request.setAttribute("idUser",id);
                session.setAttribute("username", username);
	            
	            if(username.equals("admin")) {
	            	response.sendRedirect("adminHome");
                }
	            else {
	            	response.sendRedirect("home");
	            }
			}else {
				throw new Exception("Login not successful..");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}