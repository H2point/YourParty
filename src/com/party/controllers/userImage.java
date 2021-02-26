package com.party.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;


import com.party.models.User;
import com.party.util.HibernateUtil;



@WebServlet("/userImage")
public class userImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/png");
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			
			
			User user=session.get(User.class,Integer.parseInt(request.getParameter("id_user")));
			ServletOutputStream os=response.getOutputStream();
			os.write(user.getUser_image());
		}	catch (Exception e) {
			request.setAttribute("message", "File errrroooor display2222222222");
		}
	}
}