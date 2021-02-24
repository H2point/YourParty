package com.party.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Reservation;
import com.party.util.HibernateUtil;

public class ReservationDao {
	public void saveReservation(Reservation reservation) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the reservation object
			session.save(reservation);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public List<Reservation> afficherReservations() {
		List<Reservation> reservationsList = new ArrayList<Reservation>();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Reservation"; //Entity name
		Query query = session.createQuery(qr);
		reservationsList = query.list();
		return reservationsList;
	}
	
	public List<String> getListDateReservations() {
		List<Reservation> listReservations = new ArrayList<Reservation>();
		listReservations = this.afficherReservations();
		List<String> listDates = new ArrayList<String>();
		for(int i = 0; i < listReservations.size(); i++) {
			listDates.add(listReservations.get(i).getDateReservation());
		}
		return listDates;
	}
	
	public List<Reservation> afficherPendingReservations() {
		List<Reservation> reservationsList = new ArrayList<Reservation>();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Reservation R WHERE R.statutReservation = 1"; //Entity name
		Query query = session.createQuery(qr);
		reservationsList = query.list();
		return reservationsList;
	}
	
	public List<Reservation> afficherFinishedReservations() {
		List<Reservation> reservationsList = new ArrayList<Reservation>();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Reservation R WHERE R.statutReservation = 0"; //Entity name
		Query query = session.createQuery(qr);
		reservationsList = query.list();
		return reservationsList;
	}
	
	public void updateStatusReservation(int id, int statut) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Reservation reservation = (Reservation) session.load(Reservation.class, id);
		reservation.setStatutReservation(statut);
		session.update(reservation);
		transaction.commit();
		session.close();			
	}
	
	public void deleteReservation(Reservation reservation) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.delete(reservation);
        transaction.commit();
		session.close();	
	}
	
	public List<Reservation> afficherPendingReservationsByUser(int id){
		List<Reservation> reservationsList = new ArrayList<Reservation>();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Reservation WHERE idUser = " + id + "AND statutReservation = 1"; //Entity name
		Query query = session.createQuery(qr);
		reservationsList = query.list();
		return reservationsList;
	}
	
	public List<Reservation> afficherFinishedReservationsByUser(int id){
		List<Reservation> reservationsList = new ArrayList<Reservation>();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Reservation WHERE idUser = " + id + "AND statutReservation = 0"; //Entity name
		Query query = session.createQuery(qr);
		reservationsList = query.list();
		return reservationsList;
	}
}