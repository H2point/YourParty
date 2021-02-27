package com.party.dao;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Evenement;
import com.party.models.User;
import com.party.util.HibernateUtil;


public class UserDao {

	public void saveUser(User user) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(user);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	public int validate(String username, String password) {

		Transaction transaction = null;
		User user = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			user = (User) session.createQuery("FROM User U WHERE U.username = :username").setParameter("username", username)
					.uniqueResult();
			
			if(user != null && user.getPassword().equals(password)) {
				return user.getId();
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return -1;
	}
	
	public User getUserByID(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM User where id = " + id;
		Query query = session.createQuery(qr);
		User user = (User) query.uniqueResult();
		return user;
	}
	
	public void updateUserInfos(int id,String first_name,String last_name,String email,String password) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		User user = (User) session.load(User.class, id);
		user.setId(id);
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setPassword(password);
		user.setEmail(email);
	
		session.update(user);
		transaction.commit();
		
		session.close();			
	}
	
	public void updateUserProfilePicture(int id,byte[] user_image) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		User user = (User) session.load(User.class, id);
		user.setId(id);
		user.setUser_image(user_image);
		session.update(user);
		transaction.commit();
		session.close();			
	}

}