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

import org.hibernate.Query;
import org.hibernate.Session;

import com.party.models.Comment;
import com.party.util.HibernateUtil;


@WebServlet("/ViewImage")
public class ViewImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	*/
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			String qr = "FROM Comment"; //Entity name
			Query query = session.createQuery(qr);
			 List<Comment> commentList = new ArrayList();
			 commentList  = query.list();
			 request.setAttribute("commentList", commentList);
    
		}
		catch (Exception e) {
		request.setAttribute("message", "File errrroooor display");
		
	}
		 RequestDispatcher rd = request.getRequestDispatcher("displayImage.jsp");
         rd.forward(request, response);
	}

}
