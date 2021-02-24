package com.party.models;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table( name = "evenement")

public class Evenement {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id_event;
	
	@Column(name = "nameEvent")
	private String nameEvent;
	
	@Column(name = "description")
	private String description;
	
	

	@Lob
	@Column(name = "image")
	private byte[] image;

	@Column(name = "pricePer10")
	private double pricePer10;

	public byte[] getImage() {
		return image;
	}


	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
	

	public Evenement() {
		super();
	}

	
	

	


	public int getId_event() {
		return id_event;
	}

	public void setId_event(int id_event) {
		this.id_event = id_event;
	}

	public String getNameEvent() {
		return nameEvent;
	}

	public void setNameEvent(String nameEvent) {
		this.nameEvent = nameEvent;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public double getPricePer10() {
		return pricePer10;
	}

	public void setPricePer10(double pricePer10) {
		this.pricePer10 = pricePer10;
	}


	public Evenement(String nameEvent, String description, byte[] image, double pricePer10) {
		super();
		this.nameEvent = nameEvent;
		this.description = description;
		this.image = image;
		this.pricePer10 = pricePer10;
	}
	
	
	
	/*
	 * public Evenement(String nameEvent, String description, byte[] image) {
	 * super(); this.nameEvent = nameEvent; this.description = description;
	 * this.image = image; }
	 */
	

}
