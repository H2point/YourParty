package com.party.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.party.dao.EvenementDao;
import com.party.dao.ReservationDao;
import com.party.models.Evenement;
import com.party.models.Reservation;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReservationDao reservationDao;
	private EvenementDao evenementDao;
			
	public void init() {
		reservationDao = new ReservationDao();
		evenementDao = new EvenementDao();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<String> listDates = new ArrayList<String>();
		listDates = reservationDao.getListDateReservations();
		request.setAttribute( "listDates", listDates);
		List<Evenement> evenementList = new ArrayList();
        evenementList = evenementDao.AfficherEvenement();
        request.setAttribute("evenementList", evenementList);
		this.getServletContext().getRequestDispatcher( "/index.jsp" ).forward( request, response );
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		List<String> listDates = new ArrayList<String>();
		listDates = reservationDao.getListDateReservations();
		request.setAttribute( "listDates", listDates);
		response.sendRedirect("home");
		
	}
}