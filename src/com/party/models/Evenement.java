package com.party.models;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	private String Description;
	
	

	public Evenement() {
		super();
	}

	public Evenement(String nameEvent, String description) {
		super();
		this.nameEvent = nameEvent;
		Description = description;
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
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}
	
	
	
	

}
