package com.party.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Comment;
import com.party.util.HibernateUtil;

public class uploadImageDao {
	public void saveImage(Comment commentaire) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the event object
			session.save(commentaire);
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
