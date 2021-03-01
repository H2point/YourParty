package com.party.controllers;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.party.dao.ReservationDao;
import com.party.dao.UserDao;
import com.party.util.HibernateUtil;

/**
 * @email Ramesh Fadatare
 */

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao loginDao;
	private ReservationDao reservationDao;

	public void init() {
		loginDao = new UserDao();
		reservationDao = new ReservationDao();
	}

	
	  protected void doGet(HttpServletRequest request, HttpServletResponse
	  response) throws ServletException, IOException {
	  
	  this.getServletContext().getRequestDispatcher( "/login.jsp" ).forward(
	 request, response ); }
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<String> listDates = new ArrayList<String>();
			listDates = reservationDao.getListDateReservations();
			request.setAttribute( "listDates", listDates);
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			if (loginDao.validate(username, password)!=0) {
				int id=loginDao.validate(username, password);
				System.out.println("Gooood");
				Session sess = HibernateUtil.getSessionFactory().openSession();
	    		String email= (String)sess.createQuery("SELECT email FROM User u WHERE u.id= :id").setInteger("id",id).uniqueResult();
				
				HttpSession session = request.getSession(true);
                session.setAttribute("id",id);
                session.setAttribute("email",email);
                session.setAttribute("username", username);
                //request.setAttribute("id",id);
                
                if(username.equals("userh")) {
                	RequestDispatcher dispatcher = request.getRequestDispatcher("adminPanel.jsp");
    				dispatcher.forward(request, response);
                }
                response.sendRedirect("home");
				/*
				 * RequestDispatcher dispatcher = request.getRequestDispatcher("home");
				 * dispatcher.forward(request, response);
				 */
			}else {
				 response.sendRedirect("login.jsp");
				throw new Exception("Login not successful..");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}