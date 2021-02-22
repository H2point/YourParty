package com.party.models;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name = "reservation")
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idReservation;
	
	@Column(name = "idUser")
	private int idUser;
	
	@Column(name = "idEvenement")
	private int idEvenenemnt;
	
	/*@Column(name = "dateReservation", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)*/
	@Column(name = "dateReservation")
	private String dateReservation;
	
	@Column(name = "nbrPersonnes")
	private int nbrPersonnes;
	
	@Column(name = "adresse")
	private String adresse;
	
	@Column(name = "prixReservation")
	private double prixReservation;
	
	@Column(name = "statutReservation")
	private int statutReservation; // 0 -> Confirmée     1 -> Pas encore confirmée    2 -> Supprimée
	
	public Reservation() {
		
	}
	
	public Reservation(int idUser, int idEvenement, String dateReservation, int nbrPersonnes, String adresse, double prixReservation, int statutReservation) {
		super();
		this.idUser = idUser;
		this.idEvenenemnt = idEvenement;
		this.dateReservation = dateReservation;
		this.nbrPersonnes = nbrPersonnes;
		this.adresse = adresse;
		this.prixReservation = prixReservation;
		this.statutReservation = statutReservation;
	}

	public int getIdReservation() {
		return idReservation;
	}

	public void setIdReservation(int idReservation) {
		this.idReservation = idReservation;
	}
	
	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}


	public int getIdEvenenemnt() {
		return idEvenenemnt;
	}

	public void setIdEvenenemnt(int idEvenenemnt) {
		this.idEvenenemnt = idEvenenemnt;
	}

	public String getDateReservation() {
		return dateReservation;
	}

	public void setDateReservation(String dateReservation) {
		this.dateReservation = dateReservation;
	}

	public int getNbrPersonnes() {
		return nbrPersonnes;
	}

	public void setNbrPersonnes(int nbrPersonnes) {
		this.nbrPersonnes = nbrPersonnes;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	public double getPrixReservation() {
		return prixReservation;
	}

	public void setPrixReservation(double prixReservation) {
		this.prixReservation = prixReservation;
	}
	
	public int getStatutReservation() {
		return statutReservation;
	}

	public void setStatutReservation(int statutReservation) {
		this.statutReservation = statutReservation;
	}


}
