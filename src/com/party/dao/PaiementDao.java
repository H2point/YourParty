package com.party.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Evenement;
import com.party.models.Paiement;
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
	
	public List<Paiement> AfficherEvenement(){		
		List<Paiement> paiementList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Paiement"; //Entity name
		Query query = session.createQuery(qr);
		paiementList = query.list();
		return paiementList;
		
	}
	
	

}
