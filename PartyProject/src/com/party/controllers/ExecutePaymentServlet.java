package com.party.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.party.dao.ReservationDao;
import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;
 
@WebServlet("/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ReservationDao reservationDao;
    
    public void init() {
		reservationDao = new ReservationDao();
	}
 
    public ExecutePaymentServlet() {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
             
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            
            AuthorizePaymentServlet.addReservation(request);
            PaimentServlet.addPayment(request);
 
            request.getRequestDispatcher("merci.jsp").forward(request, response);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
 
}