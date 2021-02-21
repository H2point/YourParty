package com.party.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.party.dao.CommentDao;

import com.party.models.Comment;


@WebServlet(name="CommentServlet", urlPatterns = {"/upload"})
@MultipartConfig


public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CommentDao commentDao;
	
    
	public void init() {
		commentDao = new CommentDao();
	}
     
       
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("addComment")!=null){
            try {
            	String CommentInput = request.getParameter("comment");
            	
            	//Comment commentaire=new Comment(CommentInput);
            	//commentDao.saveComment(commentaire);
        		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        		dispatcher.forward(request, response);
            	
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
        }
		
	}
}


