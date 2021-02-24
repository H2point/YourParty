package com.party.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Evenement;
import com.party.models.Event;
import com.party.util.HibernateUtil;

public class EvenementDao {
	
	public void saveEvent(Evenement evenement) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(evenement);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public void supprimerEvenement(Evenement ev) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.delete(ev);
        transaction.commit();
		session.close();	

	}
	
	
	public List<Evenement> AfficherEvenement(){		
		List<Evenement> evenementList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Evenement"; //Entity name
		Query query = session.createQuery(qr);
		evenementList = query.list();
		return evenementList;
		
	}
	public List<Evenement> AfficherUnEventIndex(String name){		
		List<Evenement> evenementList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Evenement where nameEvent="+"'"+name+"'"; //Entity name
		Query query = session.createQuery(qr);
		evenementList = query.list();
		return evenementList;
		
	}
	public List<Evenement> AfficherUnEvent(int id){		
		List<Evenement> evenementList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Evenement where id_event="+id; //Entity name
		Query query = session.createQuery(qr);
		evenementList = query.list();
		return evenementList;
	}
	public String getNameEvenementByID(int id){		
		String nameEvenement = " ";
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Evenement where id_event="+id; //Entity name
		Query query = session.createQuery(qr);
		Evenement evenement = (Evenement) query.uniqueResult();
		nameEvenement = evenement.getNameEvent();
		return nameEvenement;
	}

}
