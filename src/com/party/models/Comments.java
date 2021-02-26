package com.party.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name = "comments")

public class Comments {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id_comment;
	
	@Column(name = "id_user")
	private int id_user;
	
	@Column(name = "username")
	private String username;
	
	
	@Column(name = "id_theme")
	private String id_theme;

	@Column(name = "comment")
	private String comment;

	@Column(name = "nbr_likes")
	private int nbr_likes;
	
	@Column(name = "date_comment ")
	private String date_comment ;
	
	public Comments() {
		super();
	}
	
	public Comments(String comment) {//int likes
		//super();
		this.comment = comment;
		//this.nbr_likes = likes;
	}


	public int getId_comment() {
		return id_comment;
	}

	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String id_user) {
		this.username = id_user;
	}
	
	public String getId_theme() {
		return id_theme;
	}

	public void setId_theme(String id_theme) {
		this.id_theme = id_theme;
	}
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getNbr_likes() {
		return nbr_likes;
	}
	public void setNbr_likes(int nbr_likes) {
		this.nbr_likes = nbr_likes;
	}
	
	public String getDate_comment() {
		return date_comment;
	}
	public void setDate_comment(String date_comment) {
		this.date_comment = date_comment;
	}
}