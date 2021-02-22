package com.party.controllers;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import com.party.models.User;
import com.party.util.HibernateUtil;

import com.fasterxml.classmate.AnnotationConfiguration;
import com.mysql.cj.xdevapi.SessionFactory;



@WebServlet("/usernamecheck")
public class usernamecheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String myuser = request.getParameter("username");
		List<User> userList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM User where username="+"'"+myuser+"'"; //Entity name
		
		Query query = session.createQuery(qr);
		
		query.uniqueResult();
		userList = query.list();
		if(userList.isEmpty()) {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.print("username valid");
			
		}else {
			
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.print("Already exist! choose again...");
			userList=null;
			}
		}catch(Exception e){
        	System.out.println(e);
			
		}
		
	}
	

}
