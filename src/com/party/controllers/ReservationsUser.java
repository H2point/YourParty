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

import com.party.dao.EvenementDao;
import com.party.dao.ReservationDao;
import com.party.models.Event;
import com.party.models.Reservation;

@WebServlet("/MyReservations")
public class ReservationsUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReservationDao reservationDao;
	private EvenementDao evenementDao;
	
	Reservation reservation = new Reservation();
       
	public void init() {
		reservationDao = new ReservationDao();
		evenementDao = new EvenementDao();
	}
       
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("id") != null) {
			HttpSession session = request.getSession(true);
			int idUser = (Integer)session.getAttribute("id");
			
			//Pending Reservations 
			List<Reservation> pendingReservationsList = new ArrayList<Reservation>();
			pendingReservationsList = reservationDao.afficherPendingReservationsByUser(idUser);
			List<String> pendingEvenementNames = new ArrayList<String>();
	        for(Reservation res : pendingReservationsList) {
	        	String name = evenementDao.getNameEvenementByID(res.getIdEvenenemnt());
	        	pendingEvenementNames.add(name);
	        }
	        
	        //Finished Reservations
			List<Reservation> finishedReservationsList = new ArrayList<Reservation>();
			finishedReservationsList = reservationDao.afficherFinishedReservationsByUser(idUser);
			List<String> finishedEvenementNames = new ArrayList<String>();
	        for(Reservation res : finishedReservationsList) {
	        	String name = evenementDao.getNameEvenementByID(res.getIdEvenenemnt());
	        	finishedEvenementNames.add(name);
	        }
			
			request.setAttribute("pendingReservationsByUser", pendingReservationsList);
	        request.setAttribute("finishedReservationsByUser", finishedReservationsList);
	        request.setAttribute("pendingEvenementNames", pendingEvenementNames);
	        request.setAttribute("finishedEvenementNames", finishedEvenementNames);
	        
	        RequestDispatcher rd = request.getRequestDispatcher("viewReservationsUser.jsp");
	        rd.forward(request, response);
			
		}
		else {
			response.sendRedirect("login");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}