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

import com.party.dao.ReservationDao;
import com.party.models.Reservation;

@WebServlet("/Reservations")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationDao reservationDao;
	
	Reservation reservation = new Reservation();
       
	public void init() {
		reservationDao = new ReservationDao();
	}
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Reservation> reservationsList = new ArrayList<Reservation>();
        reservationsList = reservationDao.afficherPendingReservations();
        request.setAttribute("pendingReservationsList", reservationsList);
        RequestDispatcher rd = request.getRequestDispatcher("displayPendingReservationsAdmin.jsp");
        rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("viewPendingReservations") != null){
            List<Reservation> reservationsList = new ArrayList<Reservation>();
            reservationsList = reservationDao.afficherPendingReservations();
            request.setAttribute("pendingReservationsList", reservationsList);
            RequestDispatcher rd = request.getRequestDispatcher("displayPendingReservationsAdmin.jsp");
            rd.forward(request, response);
        }
		if(request.getParameter("finishedReservation") != null) {
			int id = Integer.parseInt(request.getParameter("finishedReservation"));
			reservationDao.updateStatusReservation(id, 0);
			List<Reservation> reservationsList = new ArrayList<Reservation>();
            reservationsList = reservationDao.afficherPendingReservations();
            request.setAttribute("pendingReservationsList", reservationsList);
            RequestDispatcher rd = request.getRequestDispatcher("displayPendingReservationsAdmin.jsp");
            rd.forward(request, response);
		}
		if(request.getParameter("viewFinishedReservations") != null){
            List<Reservation> reservationsList = new ArrayList<Reservation>();
            reservationsList = reservationDao.afficherFinishedReservations();
            request.setAttribute("finishedReservationsList", reservationsList);
            RequestDispatcher rd = request.getRequestDispatcher("displayFinishedReservationsAdmin.jsp");
            rd.forward(request, response);
        }
	}

}