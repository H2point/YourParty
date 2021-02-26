package com.party.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;

import com.party.dao.AdminDao;
import com.party.dao.MenuDao;
import com.party.models.Evenement;
import com.party.models.Event;
import com.party.models.Menu;
import com.party.util.HibernateUtil;

/**
 * Servlet implementation class MenuAdmin
 */
@WebServlet("/MenuAdmin")
public class MenuAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Menu menu =new Menu();
	private MenuDao menuDao; 
	
	public void init() {
		menuDao = new MenuDao();
	}
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("afficherMenus")!=null){
            List<Menu> menuList = new ArrayList();
            menuList = menuDao.showMenu();
            request.setAttribute("menuList", menuList);
            //request.setAttribute("offre","hi");
            
            RequestDispatcher rd = request.getRequestDispatcher("displayMenuAdmin.jsp");
            rd.forward(request, response);
        }
		
		if(request.getParameter("addMenu")!=null){
			//to make the list of event dynamic
			 List<Evenement> evenementList = new ArrayList();
	          evenementList = menuDao.AfficherEvenement();
	          request.setAttribute("evenementList", evenementList);
            RequestDispatcher rd = request.getRequestDispatcher("addMenuAdmin.jsp");
            rd.forward(request, response);
        }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getParameter("addMenuItem")!=null){
            try {
            	Menu itemMenu = new Menu();
            	//String themeMenu = request.getParameter("themeAddMenu");
            	String nameItemMenu = request.getParameter("itemAddMenu");
            	String descriptionMenu = request.getParameter("descriptionAddMenu");
            	String themeMenu = request.getParameter("dropdownMenu");
            	
            	
            	itemMenu.setTheme_menu(themeMenu);
            	itemMenu.setItem_menu(nameItemMenu);
            	itemMenu.setDescription_item_menu(descriptionMenu);
            	menuDao.saveMenuItem(itemMenu);
            	 List<Menu> menuList = new ArrayList();
                menuList = menuDao.showMenu();
                request.setAttribute("menuList", menuList);
        		RequestDispatcher dispatcher = request.getRequestDispatcher("displayMenuAdmin.jsp");
        		dispatcher.forward(request, response);
				
			} 
			catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
        }
		 if(request.getParameter("modifierMenu")!=null){
             int id_menu = Integer.parseInt(request.getParameter("id_menu"));
             String theme = request.getParameter("theme");
             String nameItemMenu = request.getParameter("nameItemMenu");
             String descriptionItemMenu = request.getParameter("descriptionItemMenu");
             menuDao.modifyMenu(id_menu, theme, nameItemMenu, descriptionItemMenu);  
             List<Menu> menuList = new ArrayList();
             menuList = menuDao.showMenu();
             request.setAttribute("menuList", menuList);
             RequestDispatcher rd = request.getRequestDispatcher("displayMenuAdmin.jsp");
             rd.forward(request, response);                    
         }
		 
		if(request.getParameter("afficherUnMenu")!=null){
			int id_menu = Integer.parseInt(request.getParameter("id_menu"));
            List<Menu> menuList = new ArrayList();
            menuList = menuDao.showAMenu(id_menu);
            request.setAttribute("menuList", menuList);
            RequestDispatcher rd = request.getRequestDispatcher("modifierMenu.jsp");
            rd.forward(request, response);
        }
		
		if(request.getParameter("supprimerMenu")!=null){
            int id_menu_trash = Integer.parseInt(request.getParameter("id_menu_trash"));
            menu.setId_menu(id_menu_trash);
            menuDao.deleteMenu(menu);
            List<Menu> menuList = new ArrayList();
            menuList = menuDao.showMenu();
            request.setAttribute("menuList", menuList);
            RequestDispatcher rd = request.getRequestDispatcher("displayMenuAdmin.jsp");
            rd.forward(request, response);
         } 

	}

}