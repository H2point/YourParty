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

import com.party.dao.ReservationDao;
import com.party.models.Reservation;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReservationDao reservationDao;
	
	public void init() {
		reservationDao = new ReservationDao();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<String> listDates = new ArrayList<String>();
		listDates = getListDateReservations();
		request.setAttribute( "listDates", listDates);
		this.getServletContext().getRequestDispatcher( "/index.jsp" ).forward( request, response );
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		if(request.getParameter("reservation-details")!=null) {
			addReservation(request, response);
		}
	}
	
	private void addReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") != null) {
			HttpSession session = request.getSession(true);
			int idUser = (Integer)session.getAttribute("id");
			int idEvent = Integer.parseInt(request.getParameter("id-event"));
			String dateEvent = request.getParameter("date-input");
			int nbrPersonnes = Integer.parseInt(request.getParameter("nbr-people-input"));
			String adresse = request.getParameter("address-input");
			double prixReservation = Double.parseDouble(request.getParameter("price-reservation-input"));
			
			Reservation reservation = new Reservation(idUser, idEvent, dateEvent, nbrPersonnes, adresse, prixReservation, 1);
			reservationDao.saveReservation(reservation);
			//this.getServletContext().getRequestDispatcher( "/index.jsp" ).forward( request, response );
			response.sendRedirect("home");
		}
		else {
			response.sendRedirect("login");
		}
		
	}
	
	private List<String> getListDateReservations() {
		List<Reservation> listReservations = new ArrayList<Reservation>();
		listReservations = reservationDao.afficherReservations();
		List<String> listDates = new ArrayList<String>();
		for(int i = 0; i < listReservations.size(); i++) {
			listDates.add(listReservations.get(i).getDateReservation());
		}
		return listDates;
	}
	
}
