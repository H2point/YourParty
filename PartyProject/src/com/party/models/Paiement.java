package com.party.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table( name = "paiement")
public class Paiement{
	
//private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id_paiement;
	
	@Column(name="id_user")
	private int id_user;
	
	
	@Column(name="ownerCard")
	private String ownerCard;
	
	
	@Column(name="evenementName")
	private String evenementName;
	
	@Column(name="total")
	private double total;
	
	
	

	

	public Paiement(int id_user, String ownerCard, String evenementName, double total) {
		super();
		this.id_user = id_user;
		this.ownerCard = ownerCard;
		this.evenementName = evenementName;
		this.total = total;
	}

	public Paiement() {
		// TODO Auto-generated constructor stub
	}

	public int getId_paiement() {
		return id_paiement;
	}

	public void setId_paiement(int id_paiement) {
		this.id_paiement = id_paiement;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int id_user) {
		this.id_user = id_user;
	}



	public String getOwnerCard() {
		return ownerCard;
	}

	public void setOwnerCard(String ownerCard) {
		this.ownerCard = ownerCard;
	}

	public String getEvenementName() {
		return evenementName;
	}

	public void setEvenementName(String evenementName) {
		this.evenementName = evenementName;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	
	

	
	

}