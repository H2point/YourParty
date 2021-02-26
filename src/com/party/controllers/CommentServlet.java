package com.party.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;  

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;  

import com.party.dao.CommentsDao;
import com.party.models.Comments;
import com.party.models.User;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private CommentsDao commentDao;
	private String username;
	private String currentTheme;
	private int idUser;
	User user=new User();
	
	public void init() {
		commentDao = new CommentsDao();
	}
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		username = request.getParameter("username");
		currentTheme = request.getParameter("nom");
		// Like A comment
		if(request.getParameter("like")!=null){
		
				String id = request.getParameter("idComment");
				commentDao.likeComment(Integer.parseInt(id));
				List<Comments> commentsList = new ArrayList<Comments>();
	            commentsList = commentDao.showThemeComments(request.getParameter("idTheme"));
	            request.setAttribute("commentsOFtheme", commentsList);
	            RequestDispatcher rd = request.getRequestDispatcher("Commentaires_Theme.jsp");
	            rd.forward(request, response);
	        
	            
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		currentTheme = (String) session.getAttribute("currentTheme");
		//idUser = (int) session.getAttribute("idUser");
		// Add A comment
		if(request.getParameter("addComment")!=null){
			    idUser = (int) session.getAttribute("id");
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			    Date date = new Date(); 
			    //formatter.format(date)
				username= (String) session.getAttribute("username");
            	String CommentInput = request.getParameter("comment");
            	Comments commentaire=new Comments(CommentInput);
            	commentaire.setId_user(idUser);
            	commentaire.setUsername(username);
            	commentaire.setId_theme(currentTheme);
            	commentaire.setDate_comment(formatter.format(date));
            	commentDao.saveComment(commentaire);
            	response.sendRedirect(request.getContextPath() + "/Event?nom="+currentTheme+"&afficherUnEventIndex=");
            	
		} 
		// Show comments of a Theme
		if(request.getParameter("showComment")!=null){
			List<Comments> commentsList = new ArrayList<Comments>();
            commentsList = commentDao.showThemeComments(currentTheme);
            request.setAttribute("commentsOFtheme", commentsList);
     
            RequestDispatcher rd = request.getRequestDispatcher("Commentaires_Theme.jsp");
            rd.forward(request, response);
        
            
		}
	}

}