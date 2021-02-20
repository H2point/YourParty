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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("viewPendingReservations") != null){
            List<Reservation> reservationsList = new ArrayList<Reservation>();
            reservationsList = reservationDao.afficherPendingReservations();
            request.setAttribute("pendingReservationsList", reservationsList);
            RequestDispatcher rd = request.getRequestDispatcher("displayPendingReservationsAdmin.jsp");
            rd.forward(request, response);
        }
		if(request.getParameter("confirmReservation") != null) {
			int id = Integer.parseInt(request.getParameter("confirmReservation"));
			reservationDao.updateStatusReservation(id, 0);
			List<Reservation> reservationsList = new ArrayList<Reservation>();
            reservationsList = reservationDao.afficherPendingReservations();
            request.setAttribute("pendingReservationsList", reservationsList);
            RequestDispatcher rd = request.getRequestDispatcher("displayPendingReservationsAdmin.jsp");
            rd.forward(request, response);
		}
		if(request.getParameter("deleteReservation") != null) {
			int id = Integer.parseInt(request.getParameter("deleteReservation"));
			reservationDao.updateStatusReservation(id, 2);
			List<Reservation> reservationsList = new ArrayList<Reservation>();
            reservationsList = reservationDao.afficherPendingReservations();
            request.setAttribute("pendingReservationsList", reservationsList);
            RequestDispatcher rd = request.getRequestDispatcher("displayPendingReservationsAdmin.jsp");
            rd.forward(request, response);
		}
		if(request.getParameter("viewConfirmedReservations") != null){
            List<Reservation> reservationsList = new ArrayList<Reservation>();
            reservationsList = reservationDao.afficherConfirmedReservations();
            request.setAttribute("confirmedReservationsList", reservationsList);
            RequestDispatcher rd = request.getRequestDispatcher("displayConfirmedReservationsAdmin.jsp");
            rd.forward(request, response);
        }
	}

}
