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

import com.party.dao.CommentsDao;
import com.party.dao.MenuDao;
import com.party.models.Comments;
import com.party.models.Menu;

/**
 * Servlet implementation class CommentsAdmin
 */
@WebServlet("/CommentsAdmin")
public class CommentsAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Comments comment =new Comments();
	private CommentsDao commentsDao; 
	
	public void init() {
		commentsDao = new CommentsDao();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("afficherComments")!=null){
            List<Comments> commentsList = new ArrayList();
            commentsList = commentsDao.showComments();
            request.setAttribute("commentsList", commentsList);
           
            RequestDispatcher rd = request.getRequestDispatcher("displayCommentsAdmin.jsp");
            rd.forward(request, response);
        }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("supprimerComment")!=null){
            int id_comment_trash = Integer.parseInt(request.getParameter("id_comment_trash"));
            comment.setId_comment(id_comment_trash);
            commentsDao.deleteComment(comment);
            List<Comments> commentsList = new ArrayList();
            commentsList = commentsDao.showComments();
            request.setAttribute("commentsList", commentsList);
            RequestDispatcher rd = request.getRequestDispatcher("displayCommentsAdmin.jsp");
            rd.forward(request, response);
         } 
	}

}