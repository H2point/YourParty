package com.party.controllers;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.party.dao.ReservationDao;
import com.party.models.OrderDetail;
import com.party.models.Reservation;
import com.paypal.base.rest.PayPalRESTException;
 
@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    static int idEvent;
    static String nameEvent;
    static String dateEvent;
    static int nbrPersonnes;
    static String adresse;
    static double prixReservation;
    
    private static ReservationDao reservationDao;
	
	public void init() {
		reservationDao = new ReservationDao();
	}
 
    public AuthorizePaymentServlet() {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	if(request.getSession().getAttribute("id") != null) {
	    	//
	    	idEvent = Integer.parseInt(request.getParameter("id-event"));
	    	nameEvent = request.getParameter("event-name");
	    	dateEvent = request.getParameter("date-input");
			nbrPersonnes = Integer.parseInt(request.getParameter("nbr-people-input"));
			adresse = request.getParameter("address-input");
			prixReservation = Double.parseDouble(request.getParameter("price-reservation-input"));
			
			//
	        String product = request.getParameter("event-name");
	        System.out.println(product);
	        String subtotal = request.getParameter("price-reservation-input");
	        String shipping = "0";
	        String tax = "0";
	        String total =request.getParameter("price-reservation-input");
	        System.out.println(total);
	        OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);
	        orderDetail.setTotal((float) prixReservation);
	        try {
	            PaymentServices paymentServices = new PaymentServices();
	            String approvalLink = paymentServices.authorizePayment(orderDetail);
	 
	            response.sendRedirect(approvalLink);
	             
	        } catch (PayPalRESTException ex) {
	            request.setAttribute("errorMessage", ex.getMessage());
	            ex.printStackTrace();
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	        }
    	}
    	else {
			response.sendRedirect("login");
		}
    }
    
    static void addReservation(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		int idUser = (Integer)session.getAttribute("id");
		Reservation reservation = new Reservation(idUser, idEvent, dateEvent, nbrPersonnes, adresse, prixReservation, 1);
		reservationDao.saveReservation(reservation);
	}
 
}