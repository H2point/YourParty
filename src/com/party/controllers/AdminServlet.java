package com.party.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.party.dao.AdminDao;
import com.party.models.Event;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao;
	
	public void init() {
		adminDao = new AdminDao();
	}
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		if(request.getParameter("addEvent")!=null){
            try {
				insertEvent(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
        }
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void insertEvent(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		String theme = request.getParameter("theme");
		Double price= Double.parseDouble(request.getParameter("price"));
		int nbr_personne= Integer.parseInt(request.getParameter("nbr_personne"));
		
		Event newEvent = new Event(theme, price, nbr_personne);
		adminDao.saveEvent(newEvent);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

}
