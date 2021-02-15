package com.party.dao;


import org.hibernate.Transaction;
import org.hibernate.Session;
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

}
