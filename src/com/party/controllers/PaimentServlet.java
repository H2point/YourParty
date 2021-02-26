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
import javax.servlet.http.HttpSession;

import org.apache.el.parser.AstInteger;
import org.hibernate.Query;
import org.hibernate.Session;

import com.party.dao.PaiementDao;
import com.party.models.Evenement;

import com.party.models.Paiement;
import com.party.models.Reservation;
import com.party.util.HibernateUtil;


@WebServlet("/Paiement")
public class PaimentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static private PaiementDao paiementDao;
	
	
	Evenement evenement=new Evenement();
	Paiement pay=new  Paiement();
    
	public void init() {
		paiementDao = new PaiementDao();
		
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("viewMyReservations") != null){
			HttpSession session = request.getSession(true);
			int idUser = (Integer)session.getAttribute("id");
			
            List<Reservation> reservationsList = new ArrayList<Reservation>();
            reservationsList = paiementDao.afficherReservationsUser(idUser);
            request.setAttribute("reservationsList", reservationsList);
            RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
            rd.forward(request, response);
        }
		if(request.getParameter("listPayment")!=null){
            List<Paiement> paymentList = new ArrayList();
            paymentList = paiementDao.AfficherPayment();
            request.setAttribute("paymentList", paymentList);
            RequestDispatcher rd = request.getRequestDispatcher("listPayment.jsp");
            rd.forward(request, response);
        }
		if(request.getParameter("deletePayment")!=null){
            int idx = Integer.parseInt(request.getParameter("id"));
            pay.setId_paiement(idx);
            paiementDao.deletePayment(pay);
            List<Paiement> paymentList = new ArrayList();
            paymentList = paiementDao.AfficherPayment();
            request.setAttribute("paymentList", paymentList);
            RequestDispatcher rd = request.getRequestDispatcher("listPayment.jsp");
            rd.forward(request, response);
         } 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("confirmPayment")!=null){
		try {
        	
        	
        	HttpSession session = request.getSession(true);
			int idUser = (Integer)session.getAttribute("id");
    		String ownerCard=request.getParameter("ownerCard");
    		//int idevent= Integer.parseInt(request.getParameter("idevent"));
    		
    		Session ses = HibernateUtil.getSessionFactory().openSession();
    		String exist="SELECT r.idEvenenemnt FROM Reservation r WHERE r.idUser="+idUser;
    		
    		int idevent=(int) ses.createQuery(exist).getSingleResult();
    		Session sess = HibernateUtil.getSessionFactory().openSession();
    		String evenementName= (String)sess.createQuery("SELECT nameEvent FROM Evenement e WHERE e.id_event= :id").setInteger("id",idevent).uniqueResult();
    		
			/*
			 * String qr = "SELECT nameEvent FROM Evenement e WHERE e.id_event="+idevent;
			 * Query query = ses.createQuery(qr); List listResult = query.list();
			 * 
			 * String evenementName=(String)listResult.get(0);
			 */
    		Session s = HibernateUtil.getSessionFactory().openSession();
    		String getotal="SELECT r.prixReservation FROM Reservation r WHERE r.idUser="+idUser;
    		double total= (double)s.createQuery(getotal).getSingleResult();
    		
    		//double total= Double.parseDouble(request.getParameter("total"));
    		
    		Paiement paiement=new Paiement(idUser,ownerCard,evenementName,total);
    		paiementDao.savePaiement(paiement);
    		RequestDispatcher dispatcher = request.getRequestDispatcher("merci.jsp");
    		dispatcher.forward(request, response);
			
		} 
		catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}}
	
	static void addPayment(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		int idUser = (Integer)session.getAttribute("id");	
		String evenementName = AuthorizePaymentServlet.nameEvent;
		double total = AuthorizePaymentServlet.prixReservation;		
		
		Paiement paiement = new Paiement(idUser, "Manal DERMICH", evenementName, total);
		paiementDao = new PaiementDao();
		paiementDao.savePaiement(paiement);
	}

}