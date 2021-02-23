package com.party.controllers;

import java.io.IOException;  


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.party.models.Mailer;

@WebServlet("/Thank")
public class SendMail extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,  
			 HttpServletResponse response)  
			    throws ServletException, IOException {  
			    String to=request.getParameter("to");  
			    String subject="Confirmation de la reservation";  
			    String msg="Votre est reservation s'est bien enregistré voici le recu de votre transaction clickez ci dessous pour voir les details de votre reservation";  
			          
			    Mailer.send(to, subject, msg);  
			    RequestDispatcher rd =request.getRequestDispatcher("welcome");
			    rd.forward(request, response);
			      
			    }  

}
