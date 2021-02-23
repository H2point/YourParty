package com.party.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.party.dao.UserDao;
import com.party.models.User;

/**
 * @email Ramesh Fadatare
 */

@WebServlet("/register")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		register(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//response.sendRedirect("register.jsp");
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = new User();
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);

		userDao.saveUser(user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("welcome");
		dispatcher.forward(request, response);
	}
}