package com.party.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.party.models.Evenement;
import com.party.util.HibernateUtil;

public class EvenementDao {
	
	@SuppressWarnings("deprecation")
	public String getNameEvenementByID(int id){		
		String nameEvenement = " ";
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Evenement where id_event = " + id; //Entity name
		Query query = session.createQuery(qr);
		Evenement evenement = (Evenement) query.uniqueResult();
		nameEvenement = evenement.getNameEvent();
		return nameEvenement;
	}
}

