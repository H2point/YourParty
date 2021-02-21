package com.party.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.party.models.Evenement;
import com.party.models.Event;
import com.party.util.HibernateUtil;


@WebServlet("/evenementImage")
public class evenementImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/png");
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			
			
			Evenement evenement=session.get(Evenement.class,Integer.parseInt(request.getParameter("id")));
			ServletOutputStream os=response.getOutputStream();
			os.write(evenement.getImage());
		}	catch (Exception e) {
			request.setAttribute("message", "File errrroooor display2222222222");
		}
	}

	
	
}
