package com.party.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.party.models.Evenement;
import com.party.models.Event;
import com.party.models.Menu;
import com.party.util.HibernateUtil;

public class MenuDao {
	
	public List<Menu> getMenuByTheme(String theme){		
		List<Menu> menuList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		//String qr = "FROM Evenement where nameEvent="+"'"+theme+"'"; //Entity name
		String qr = "FROM Menu where theme_menu="+"'"+theme+"'"; //For Test
		Query query = session.createQuery(qr);
		menuList = query.list();
		return menuList;	
	}
	
	public void modifyMenu(int id_menu, String theme_menu, String item_menu, String description_item_menu) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Menu menu = (Menu) session.load(Menu.class, id_menu);
		
		menu.setId_menu(id_menu);;
		menu.setTheme_menu(theme_menu);
		menu.setItem_menu(item_menu);
		menu.setDescription_item_menu(description_item_menu);
		
		session.update(menu);
		transaction.commit();
		session.close();			
	}
	
	public void deleteMenu(Menu menu) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();		
		session.delete(menu);
        transaction.commit();
		session.close();	

	}

	public List<Menu> showMenu(){		
		List<Menu> menuList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Menu"; //Entity name
		Query query = session.createQuery(qr);
		menuList = query.list();
		return menuList;
	}
	public List<Menu> showAMenu(int id_menu){		
		List<Menu> menuList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Menu where id_menu="+id_menu; //Entity name
		Query query = session.createQuery(qr);
		menuList = query.list();
		return menuList;
	}
	// Add item menu
	public void saveMenuItem(Menu menu) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// save the event object
			session.save(menu);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	//to make list of event dynamic
	public List<Evenement> AfficherEvenement(){		
		List<Evenement> evenementList = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();		
		String qr = "FROM Evenement"; //Entity name
		Query query = session.createQuery(qr);
		evenementList = query.list();
		return evenementList;
		
	}
	
	 
}