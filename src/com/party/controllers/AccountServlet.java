package com.party.controllers;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.party.dao.AdminDao;
import com.party.dao.UserDao;
import com.party.models.Event;
import com.party.models.User;

@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	private int idUser;
	
	public void init() {
		userDao = new UserDao();
	}
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		idUser = (Integer)session.getAttribute("id");
		User currentUserProfile = userDao.getUserByID(idUser);
		request.setAttribute("currentUserProfile", currentUserProfile);
		this.getServletContext().getRequestDispatcher("/viewUserAccount.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		idUser = (int) session.getAttribute("id");
		
		
			
			String first_name = request.getParameter("firstnameAccount");
			String last_name = request.getParameter("lastnameAccount");
			String username = request.getParameter("usernameAccount");
			String email = request.getParameter("emailAccount");
			String password = request.getParameter("passwordAccount");
			//Part filePart = request.getPart("profilePictureUpdate");
			System.out.println(first_name+" "+last_name+username);
			/*InputStream inputstream = null;
			if(filePart != null) {
				long fileSize = filePart.getSize();
				String fileContent = filePart.getContentType();
				inputstream = filePart.getInputStream();
				
			}
			byte[] profilPicture = toByteArray(inputstream);*/
			
			//userDao.updateAUser(idUser,first_name, last_name, email, password);
		
		this.getServletContext().getRequestDispatcher("/viewUserAccount.jsp").forward(request, response);
	}
	/*public static byte[] toByteArray(InputStream in) throws IOException {
		 
        ByteArrayOutputStream os = new ByteArrayOutputStream();
 
        byte[] buffer = new byte[1024];
        int len;
 
        // read bytes from the input stream and store them in buffer
        while ((len = in.read(buffer)) != -1) {
            // write bytes from the buffer into output stream
            os.write(buffer, 0, len);
        }
 
        return os.toByteArray();
    }*/

}