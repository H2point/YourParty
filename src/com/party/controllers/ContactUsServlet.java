package com.party.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.party.dao.UserDao;
import com.party.models.Mailer;
import com.party.models.User;

@WebServlet("/contactUs")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	
	public void init() {
		userDao = new UserDao();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") != null) {
			int id =  (int) request.getSession().getAttribute("id");
			User user = userDao.getUserByID(id);
			request.setAttribute( "currentUser", user);
		}
		this.getServletContext().getRequestDispatcher( "/contactUsPage.jsp" ).forward( request, response );
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("heyy");
		String first_name = (String) request.getParameter("contact-first-name-input");
		String last_name = (String) request.getParameter("contact-last-name-input");
		String email = (String) request.getParameter("contact-email-input");
		String subject = (String) request.getParameter("contact-subject-input");
		String message = (String) request.getParameter("contact-message-input");
		Mailer.send("partycontact3@gmail.com", first_name + " " + last_name + " : " + subject, message + "\n" + email);
			
		/*response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write("Message Sent!");*/			
		
	}

}