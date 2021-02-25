package com.party.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table( name = "offre")
public class Event implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "theme")
	private int theme;
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "nbr_personne")
	private int nbr_personne;
	
	@Lob
	@Column(name = "image")
	private byte[] image;

	public Event(int theme, double price, int nbr_personne, byte[] image) {
		super();
		
		this.theme = theme;
		this.price = price;
		this.nbr_personne = nbr_personne;
		this.image = image;
	}
	
	public Event(int theme, double price, int nbr_personne) {
		super();
		
		this.theme = theme;
		this.price = price;
		this.nbr_personne = nbr_personne;
	}


	public Event() {
		super();
	}
	


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getTheme() {
		return theme;
	}

	public void setTheme(int theme) {
		this.theme = theme;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getNbr_personne() {
		return nbr_personne;
	}

	public void setNbr_personne(int nbr_personne) {
		this.nbr_personne = nbr_personne;
	}
	
	public byte[] getImage() {
		return image;
	}


	public void setImage(byte[] image) {
		this.image = image;
	}

	
}
