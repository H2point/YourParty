package com.party.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Comment;
import com.party.util.HibernateUtil;

@WebServlet("/uploadImage")
@MultipartConfig
public class uploadImage extends HttpServlet {

private static final long serialVersionUID = 1L;
	
protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	Comment comment=new Comment();
	
	Part part=request.getPart("image");
	InputStream is=null;
	if(part!=null)
		is=part.getInputStream();
	byte[] data= new byte[is.available()];
	is.read(data);
	comment.setImage(data);
	
	Transaction tx=null;
	try (Session session = HibernateUtil.getSessionFactory().openSession()) {
		tx = session.beginTransaction();
		session.persist(comment);
		tx.commit();
		
		request.setAttribute("message", "File Uploded");
		
	} catch (Exception e) {
		request.setAttribute("message", "File errrroooor Uploded");
		
	}
	RequestDispatcher dispatcher = request.getRequestDispatcher("Commentaire.jsp");
	dispatcher.forward(request, response);
}
	


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

}}