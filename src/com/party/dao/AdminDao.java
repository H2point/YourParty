package com.party.dao;


import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Query;

import com.party.models.Evenement;
import com.party.models.Event;
import com.party.util.HibernateUtil;

public class AdminDao {
	public void saveEvent(Event event) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the event object
			session.save(event);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	public void modifierEvent(int id,int id_evenement, String theme,int nbr_personne,double price) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Event ev = (Event) session.load(Event.class, id);
		ev.setId(id);
		ev.setId_evenement(id_evenement);
		ev.setTheme(theme);
		ev.setNbr_personne(nbr_personne);
		ev.setPrice(price);
		
		session.update(ev);
		transaction.commit();
		session.close();			
	}
	
	public void supprimerEvent(Event v) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.delete(v);
        transaction.commit();
		session.close();	

	}
	
	public List<Event> AfficherEvent(){		
		List<Event> eventList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Event"; //Entity name
		Query query = session.createQuery(qr);
		eventList = query.list();
		return eventList;
	}
	public List<Event> AfficherEventUser(){		
		List<Event> eventList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Event"; //Entity name
		Query query = session.createQuery(qr);
		eventList = query.list();
		return eventList;
	}
	public List<Event> AfficherUnEvent(int id){		
		List<Event> eventList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Event where id="+id; //Entity name
		Query query = session.createQuery(qr);
		eventList = query.list();
		return eventList;
	}
	public List<Evenement> AfficherUnEventIndex(String name){		
		List<Evenement> evenementList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Evenement where nameEvent="+"'"+name+"'"; //Entity name
		Query query = session.createQuery(qr);
		evenementList = query.list();
		return evenementList;
		
	}
	public List<Evenement> AfficherEvenement(){		
		List<Evenement> evenementList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Evenement"; //Entity name
		Query query = session.createQuery(qr);
		evenementList = query.list();
		return evenementList;
		
	}
	


}
