package com.party.dao;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.apache.commons.lang3.RandomStringUtils;

import com.party.models.User;
import com.party.util.HibernateUtil;


public class UserDao {

	/**
	 * Save User
	 * @param user
	 * @return 
	 */
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
		User user = new User();
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
		return 0;
	}
	public User getUserByID(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM User where id = " + id;
		Query query = session.createQuery(qr);
		User user = (User) query.uniqueResult();
		return user;
	}
	public String resetCustomerPassword(String email) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		String qr = "FROM User U where U.email ="+"'"+email+"'";
		Query query = session.createQuery(qr);
		User user = (User) query.uniqueResult();
	     
	    String randomPassword = RandomStringUtils.randomAlphanumeric(10);
	     
	    user.setPassword(randomPassword);
	    session.update(user);
	    transaction.commit();
		
		session.close();
	    return randomPassword;
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
	
		//session.merge(user);
		session.update(user);
		//session.flush();
		transaction.commit();
		
		session.close();			
	}
	public void updateUserProfilePicture(int id,byte[] user_image) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		User user = (User) session.load(User.class, id);
		/*String fn = user.getFirst_name();
		String ln = user.getLast_name();
		String email = user.getEmail();
		String password = user.getPassword();
		String username = user.getUsername();
		session.delete(user);*/
		//User u = new User();
		user.setId(id);
		/*u.setFirst_name(fn);
		u.setLast_name(ln);
		u.setUsername(username);
		u.setEmail(email);
		u.setPassword(password);*/
		user.setUser_image(user_image);
		//session.save(u);
		
		
		//session.saveOrUpdate(user);

	    //session.flush();
		//session.merge(user);
		session.update(user);
		//session.flush();
		transaction.commit();
		session.close();			
	}
	
}