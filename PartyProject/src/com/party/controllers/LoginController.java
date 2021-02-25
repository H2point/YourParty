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

			if (loginDao.validate(username, password)!=0) {
				int id=loginDao.validate(username, password);
				
				Session sess = HibernateUtil.getSessionFactory().openSession();
	    		String email= (String)sess.createQuery("SELECT email FROM User u WHERE u.id= :id").setInteger("id",id).uniqueResult();
				
				HttpSession session = request.getSession(true);
                session.setAttribute("idUser",id);
                session.setAttribute("email",email);
                request.setAttribute("idUser",id);
                session.setAttribute("username", username);
                
                if(username.equals("Admin")) {
                	RequestDispatcher dispatcher = request.getRequestDispatcher("AdminAccueil");
    				dispatcher.forward(request, response);
                }
				RequestDispatcher dispatcher = request.getRequestDispatcher("home");
				dispatcher.forward(request, response);
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

		if (loginDao.validate(username, password)!=0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("welcome");
			dispatcher.forward(request, response);
		}else {
			throw new Exception("Login not successful..");
		}
	}
}

