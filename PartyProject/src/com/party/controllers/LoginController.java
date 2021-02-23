package com.party.controllers;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.party.dao.UserDao;

/**
 * @email Ramesh Fadatare
 */

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
				session.setAttribute("idUser", id);
				session.setAttribute("username", username);
	            if(username.equals("admin")) {
	            	response.sendRedirect("AdminServlet");
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

	@SuppressWarnings("unused")
	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (loginDao.validate(username, password) != -1) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}else {
			throw new Exception("Login not successful..");
		}
	}
}