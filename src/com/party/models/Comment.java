package com.party.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table( name = "comment")
public class Comment {

	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id_comment;
	/*
	@Column(name = "comment")
	private String comment;*/
	
	@Lob
	@Column(name = "image")
	private byte[] image;



	public byte[] getImage() {
		return image;
	}


	public void setImage(byte[] image) {
		this.image = image;
	}


	public int getId_comment() {
		return id_comment;
	}


	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}


	

	
	
	
}
