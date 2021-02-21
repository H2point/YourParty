package com.party.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Comment;
import com.party.util.HibernateUtil;

public class CommentDao {
	
	public void saveComment(Comment comment) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(comment);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

}
