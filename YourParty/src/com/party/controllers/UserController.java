package com.party.controllers;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.party.dao.UserDao;
import com.party.models.User;

@WebServlet("/register")
@MultipartConfig(maxFileSize = 169999999)
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		register(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( "/signup.jsp" ).forward( request, response );
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Part filePart = request.getPart("profilepicture");
		InputStream inputstream = null;
		if(filePart != null) {
			long fileSize = filePart.getSize();
			String fileContent = filePart.getContentType();
			inputstream = filePart.getInputStream();
			
		}
		byte[] profilPicture = toByteArray(inputstream);
		User user = new User();
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.setUser_image(profilPicture);
		userDao.saveUser(user);
		request.getSession().setAttribute("username",username);
		response.sendRedirect("home");
	}
	
	public static byte[] toByteArray(InputStream in) throws IOException {
		 
        ByteArrayOutputStream os = new ByteArrayOutputStream();
 
        byte[] buffer = new byte[1024];
        int len;
 
        // read bytes from the input stream and store them in buffer
        while ((len = in.read(buffer)) != -1) {
            // write bytes from the buffer into output stream
            os.write(buffer, 0, len);
        }
 
        return os.toByteArray();
    }
	
}