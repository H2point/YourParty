package com.party.controllers;

//import java.io.File;
//import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.party.dao.AdminDao;
import com.party.models.Event;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
@MultipartConfig
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao;
	
	Event event;
	
	public void init() {
		adminDao = new AdminDao();
	}
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("afficherEvent")!=null){
            List<Event> eventList = new ArrayList();
            eventList = adminDao.AfficherEvent();
            request.setAttribute("eventList", eventList);
            RequestDispatcher rd = request.getRequestDispatcher("displayEventAdmin.jsp");
            rd.forward(request, response);
        }  
		
		/*if(request.getParameter("addEvent")!=null){
            try {
            	String theme = request.getParameter("theme");
        		Double price= Double.parseDouble(request.getParameter("price"));
        		int nbr_personne= Integer.parseInt(request.getParameter("nbr_personne"));
        		Event newEvent = new Event( theme, price, nbr_personne);
        		adminDao.saveEvent(newEvent);
        		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        		dispatcher.forward(request, response);
				//insertEvent(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
        }*/
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("addEvent")!=null){
            try {
            	Event newEvent;
            	String theme = request.getParameter("theme");
        		Double price= Double.parseDouble(request.getParameter("price"));
        		int nbr_personne= Integer.parseInt(request.getParameter("nbr_personne"));
        		
        		Part part=request.getPart("image");
        		InputStream is=null;
        		if(part!=null)
        			is=part.getInputStream();
        		byte[] data= new byte[is.available()];
        		is.read(data);
        		//newEvent.setImage(data);
        		newEvent = new Event(theme,price,nbr_personne,data);
        		adminDao.saveEvent(newEvent);
        		RequestDispatcher dispatcher = request.getRequestDispatcher("displayEventAdmin.jsp");
        		dispatcher.forward(request, response);
				//insertEvent(request,response);
			} 
			catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
        }
		/*if(request.getParameter("afficherEvent")!=null){
            List<Event> eventList = new ArrayList();
            eventList = adminDao.AfficherEvent();
            request.setAttribute("eventList", eventList);
            RequestDispatcher rd = request.getRequestDispatcher("displayEventAdmin.jsp");
            rd.forward(request, response);
        }  */
		if(request.getParameter("afficherEventUser")!=null){
            List<Event> eventList = new ArrayList();
            eventList = adminDao.AfficherEventUser();
            request.setAttribute("eventList", eventList);
            RequestDispatcher rd = request.getRequestDispatcher("listOffreUser.jsp");
            rd.forward(request, response);
        }
		if(request.getParameter("afficherUnEvent")!=null){
			int id = Integer.parseInt(request.getParameter("id"));
            List<Event> eventList = new ArrayList();
            eventList = adminDao.AfficherUnEvent(id);
            request.setAttribute("eventList", eventList);
            RequestDispatcher rd = request.getRequestDispatcher("modifierEvent.jsp");
            rd.forward(request, response);
        }
		 if(request.getParameter("modifierEvent")!=null){
             int id = Integer.parseInt(request.getParameter("id"));
             String theme = request.getParameter("theme");
     		Double price= Double.parseDouble(request.getParameter("price"));
     		int nbr_personne= Integer.parseInt(request.getParameter("nbr_personne"));
     		
     	
    		
             adminDao.modifierEvent(id,theme, nbr_personne,price);                 
             RequestDispatcher rd = request.getRequestDispatcher("displayEventAdmin.jsp");
             rd.forward(request, response);                    
         }
          
         if(request.getParameter("supprimerEvent")!=null){
            int idx = Integer.parseInt(request.getParameter("id"));
            event.setId(idx);
            adminDao.supprimerEvent(event);
            RequestDispatcher rd = request.getRequestDispatcher("displayEventAdmin.jsp");
            rd.forward(request, response);
         } 
		//doGet(request, response);
	}
	/*private void insertEvent(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		String theme = request.getParameter("theme");
		Double price= Double.parseDouble(request.getParameter("price"));
		int nbr_personne= Integer.parseInt(request.getParameter("nbr_personne"));
		
		/*File file = new File("images/birthday16.jpg");
        byte[] image = new byte[(int) file.length()];
 
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            fileInputStream.read(image);
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
       
 
        
		Event newEvent = new Event( theme, price, nbr_personne);
		adminDao.saveEvent(newEvent);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}*/

}
