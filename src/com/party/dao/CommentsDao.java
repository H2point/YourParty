package com.party.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Comments;
import com.party.models.Menu;
import com.party.util.HibernateUtil;

public class CommentsDao {


	public void saveComment(Comments comment) {
		Transaction transaction = null;

		try(Session session = HibernateUtil.getSessionFactory().openSession();){
			
			// start a transaction
			transaction = session.beginTransaction();
			session.save(comment);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	public List<Comments> showComments(){		
		List<Comments> commentsList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Comments"; //Entity name
		Query query = session.createQuery(qr);
		commentsList = query.list();
		return commentsList;
	}
	public void deleteComment(Comments comment) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.delete(comment);
        transaction.commit();
		session.close();	

	}
	/*public List<Comments> showThemeComments() {
		Transaction transaction = null;
		List<Comments> CommentsList = new ArrayList<Comments>();
		try(Session session = HibernateUtil.getSessionFactory().openSession();){
			
			// start a transaction
			transaction = session.beginTransaction();
			
			String qr = "FROM Comments"; //Entity name
			//CommentsList = session.createQuery(qr).getResultList();
			Query query = session.createQuery(qr);
			CommentsList = query.list();
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return CommentsList;
	}*/
	
	public void likeComment(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Comments comment = (Comments) session.load(Comments.class, id);
		comment.setNbr_likes(comment.getNbr_likes()+1);
		session.update(comment);
		transaction.commit();
		session.close();			
	}

	@SuppressWarnings("unchecked")
	public List<Comments> showThemeComments(String theme_Event) {
		List<Comments> result = null;
	    try {
	    	Transaction transaction = null;
	    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	    	//Session session = HibernateUtil.getSessionFactory().openSession();
	    	// start a transactio
	    	transaction = session.beginTransaction();
	    	
	    		result = session
	    		        .createQuery("FROM Comments C WHERE C.id_theme ="+"'"+theme_Event+"'")
	    		        .getResultList(); 
	    	
	    	session.close();
	    	return result;
	    	
	       
	    }
	    catch (Exception e) {
	        throw new RuntimeException(e);
	    }
	}
	
	@SuppressWarnings("unchecked")
	public List<Comments> showReviews(String theme_Event) {
		List<Comments> result = null;
	    try {
	    	Transaction transaction = null;
	    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	    	//Session session = HibernateUtil.getSessionFactory().openSession();
	    	// start a transactio
	    	transaction = session.beginTransaction();
	    	
	    		result = session
	    		        .createQuery("FROM Comments C WHERE C.id_theme ="+"'"+theme_Event+"'"+"ORDER BY C.nbr_likes DESC")
	    		        .getResultList(); 
	    	
	    	session.close();
	    	return result;
	    	
	       
	    }
	    catch (Exception e) {
	        throw new RuntimeException(e);
	    }
	}
}