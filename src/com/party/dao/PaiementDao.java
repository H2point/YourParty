package com.party.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Evenement;
import com.party.models.Paiement;
import com.party.models.Reservation;
import com.party.util.HibernateUtil;

public class PaiementDao {
	
	public void savePaiement(Paiement paiement) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(paiement);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	public List<Reservation> afficherReservationsUser(int id) {
		
		List<Reservation> reservationsList = new ArrayList<Reservation>();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Reservation R WHERE R.idUser="+id; 
		Query query = session.createQuery(qr);
		reservationsList = query.list();
		return reservationsList;
	}

	public void deletePayment(Paiement p) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.delete(p);
        transaction.commit();
		session.close();	

	}
	
	
	public List<Paiement> AfficherPayment(){		
		List<Paiement> paymentList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Paiement"; //Entity name
		Query query = session.createQuery(qr);
		paymentList = query.list();
		return paymentList;
		
	}

	

}
