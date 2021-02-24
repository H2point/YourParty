package com.party.controllers;


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

import org.hibernate.Session;

import com.party.dao.AdminDao;
import com.party.dao.EvenementDao;
import com.party.models.Evenement;
import com.party.models.Event;
import com.party.util.HibernateUtil;


@WebServlet("/Offre")
@MultipartConfig
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao;
	private EvenementDao evenementDao;
	Event event=new Event();
	
	public void init() {
		adminDao = new AdminDao();
	}
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("afficherEvent")!=null){
            List<Event> eventList = new ArrayList();
            eventList = adminDao.AfficherEvent();
            request.setAttribute("eventList", eventList);
            request.setAttribute("offre","hi");
            
            RequestDispatcher rd = request.getRequestDispatcher("displayEventAdmin.jsp");
            rd.forward(request, response);
        }  
		if(request.getParameter("addOffer")!=null){
            List<Evenement> evenementList = new ArrayList();
            evenementList = adminDao.AfficherEvenement();
            request.setAttribute("evenementList", evenementList);
            RequestDispatcher rd = request.getRequestDispatcher("addOffre.jsp");
            rd.forward(request, response);
        }
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("addEvent")!=null){
            try {
            	Event newEvent;
            	int idevent= Integer.parseInt(request.getParameter("idevent"));
            	Session sess = HibernateUtil.getSessionFactory().openSession();
            	String theme =  (String)sess.createQuery("SELECT nameEvent FROM Evenement e WHERE e.id_event= :id").setInteger("id",idevent).uniqueResult();
        		Double price= Double.parseDouble(request.getParameter("price"));
        		int nbr_personne= Integer.parseInt(request.getParameter("nbr_personne"));
        		
        		Part part=request.getPart("image");
        		InputStream is=null;
        		if(part!=null)
        			is=part.getInputStream();
        		byte[] data= new byte[is.available()];
        		is.read(data);
        		//newEvent.setImage(data);
        		newEvent = new Event(idevent,theme,price,nbr_personne,data);
        		adminDao.saveEvent(newEvent);
        		 List<Event> eventList = new ArrayList();
                 eventList = adminDao.AfficherEvent();
                 request.setAttribute("eventList", eventList);
        		RequestDispatcher dispatcher = request.getRequestDispatcher("displayEventAdmin.jsp");
        		dispatcher.forward(request, response);
				
			} 
			catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
        }
		
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
             int idevent= Integer.parseInt(request.getParameter("id_evenement"));
             String theme = request.getParameter("theme");
     		Double price= Double.parseDouble(request.getParameter("price"));
     		int nbr_personne= Integer.parseInt(request.getParameter("nbr_personne"));
     		
             adminDao.modifierEvent(id,idevent,theme, nbr_personne,price);   
             List<Event> eventList = new ArrayList();
             eventList = adminDao.AfficherEvent();
             request.setAttribute("eventList", eventList);
             RequestDispatcher rd = request.getRequestDispatcher("displayEventAdmin.jsp");
             rd.forward(request, response);                    
         }
          
         if(request.getParameter("supprimerEvent")!=null){
            int idx = Integer.parseInt(request.getParameter("idx"));
            event.setId(idx);
            adminDao.supprimerEvent(event);
            List<Event> eventList = new ArrayList();
            eventList = adminDao.AfficherEvent();
            request.setAttribute("eventList", eventList);
            RequestDispatcher rd = request.getRequestDispatcher("displayEventAdmin.jsp");
            rd.forward(request, response);
         } 
		
	}
	
}
