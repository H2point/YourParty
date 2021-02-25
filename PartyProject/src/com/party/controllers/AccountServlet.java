package com.party.controllers;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig(maxFileSize = 169999999)
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	//private int idUser;
	
	public void init() {
		userDao = new UserDao();
	}
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		int idUser = (int) session.getAttribute("idUser");
		User currentUserProfile = userDao.getUserByID(idUser);
		request.setAttribute("currentUserProfile", currentUserProfile);
		this.getServletContext().getRequestDispatcher("/viewUserAccount.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		int idUser = (int) session.getAttribute("idUser");
		
			if(request.getParameter("updateProfilePicture") == null) {
				System.out.println("Yes i'm working Girl");
				
			}else {
				System.out.println("Yes i'm  not working Girl");
				
				Part filePart = request.getPart("profilepictureUpdate");
				InputStream inputstream = null;
				if(filePart != null) {
					long fileSize = filePart.getSize();
					String fileContent = filePart.getContentType();
					inputstream = filePart.getInputStream();
					
				}else {
					System.out.println("Yes i'm  not working Girl 222");
				}
				
				byte[] profilPicture = toByteArray(inputstream);
				userDao.updateUserProfilePicture(idUser,profilPicture);
			}
			if(request.getParameter("updateProfileUser")!=null) {
				String first_name = request.getParameter("firstnameAccount");
				String last_name = request.getParameter("lastnameAccount");
				String email = request.getParameter("emailAccount");
				String password = request.getParameter("passwordAccount");
				
				System.out.println(first_name+" "+last_name+" "+email+"hjkkj"+idUser);
				
				
				userDao.updateUserInfos(idUser,first_name, last_name, email, password);
			}
			
		
		this.getServletContext().getRequestDispatcher("/viewUserAccount.jsp").forward(request, response);
	}
	public static byte[] toByteArray(InputStream in) throws IOException {
		 
        ByteArrayOutputStream os = new ByteArrayOutputStream();
 
        byte[] buffer = new byte[1024];
        int len;

        if(in.read(buffer) == -1) {
        	System.out.println("Not WORKING");
        }else {
        	System.out.println(" WOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOORKING");
        }
        // read bytes from the input stream and store them in buffer
        while ((len = in.read(buffer)) != -1) {
            // write bytes from the buffer into output stream
            os.write(buffer, 0, len);
        }
        /*if(os.toByteArray() != null) {
        	 ByteArrayInputStream bais = new ByteArrayInputStream(os.toByteArray());
             //read png bytes as an image
             BufferedImage bufferedImage = ImageIO.read(bais);
             //create OutputStream to write prepaired jpg bytes
             ByteArrayOutputStream baos = new ByteArrayOutputStream();
             //write image as jpg bytes
             ImageIO.write(bufferedImage, "JPG", baos);
             //convert OutputStream to a byte[]
             return baos.toByteArray();

        }else {*/
        	return os.toByteArray();
        //}
        
    }

 
}
