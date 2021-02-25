package com.party.controllers;

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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.party.dao.AdminDao;
import com.party.dao.CommentsDao;
import com.party.dao.EvenementDao;
import com.party.dao.MenuDao;
import com.party.models.Comments;
import com.party.models.Evenement;
import com.party.models.Event;
import com.party.models.Menu;


@WebServlet("/EvenementServlet")
@MultipartConfig
public class EvenementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private EvenementDao evenementDao;
	private CommentsDao commentsDao;
	private MenuDao menuDao;
	Evenement evenement=new Evenement();
    
	public void init() {
		evenementDao = new EvenementDao();
		commentsDao = new CommentsDao();
		menuDao = new MenuDao();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("afficherEvenement")!=null){
            List<Evenement> evenementList = new ArrayList();
            evenementList = evenementDao.AfficherEvenement();
            request.setAttribute("evenementList", evenementList);
            RequestDispatcher rd = request.getRequestDispatcher("listEvenementAdmin.jsp");
            rd.forward(request, response);
        }
		
		if(request.getParameter("afficherUnEventIndex")!=null){
			// Here we get informations+ reviews and menu since they're related to the event
			// that's why i didn't do it in comments and menu servlet 
			
            try {
            	 	
            String name = request.getParameter("nom");
            request.getSession().setAttribute("currentTheme",name);
            List<Evenement> evenementList = new ArrayList();
            List<Comments> reviewsList = new ArrayList();
            List<Menu> menuList = new ArrayList();
            evenementList = evenementDao.AfficherUnEventIndex(name);
            reviewsList = commentsDao.showReviews(name);
            menuList = menuDao.getMenuByTheme(name);
            request.setAttribute("evenementList", evenementList);
            request.setAttribute("reviewsList", reviewsList);
            request.setAttribute("menuList", menuList);
            RequestDispatcher rd = request.getRequestDispatcher("EventDetails.jsp");
            request.setAttribute("currentTheme",name); // set attribut n'est pas repete we should keep it!
            rd.forward(request, response);
            
            }catch(Exception e){
            	System.out.println(e);
            }
        }
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("addEvenement")!=null){
            try {
            	String nameEvent = request.getParameter("nameEvent");
            	String description = request.getParameter("description");
            	
            	Part part=request.getPart("image");
        		InputStream is=null;
        		if(part!=null)
        			is=part.getInputStream();
        		byte[] data= new byte[is.available()];
        		is.read(data);
            	
            	Evenement newEvenement = new Evenement(nameEvent, description,data);
            	evenementDao.saveEvent(newEvenement);
        		RequestDispatcher dispatcher = request.getRequestDispatcher("adminPanel.jsp");
        		dispatcher.forward(request, response);
            	
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
        }
		
		if(request.getParameter("supprimerEvenement")!=null){
            int id_event = Integer.parseInt(request.getParameter("id_event"));
            evenement.setId_event(id_event);
            evenementDao.supprimerEvenement(evenement);
            RequestDispatcher rd = request.getRequestDispatcher("listEvenementAdmin.jsp");
            rd.forward(request, response);
         } 
		
	}

}