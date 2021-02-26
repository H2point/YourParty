package com.party.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table( name = "menu")
public class Menu implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id_menu;
	
	@Column(name = "theme_menu")
	private String theme_menu;
	
	@Column(name = "item_menu")
	private String item_menu;
	
	@Column(name = "description_item_menu")
	private String description_item_menu;
	
	public int getId_menu() {
		return id_menu;
	}
	public void setId_menu(int id_menu) {
		this.id_menu = id_menu;
	}
	
	public String getTheme_menu() {
		return theme_menu;
	}

	public void setTheme_menu(String theme_menu) {
		this.theme_menu = theme_menu;
	}

	public String getItem_menu() {
		return item_menu;
	}

	public void setItem_menu(String item_menu) {
		this.item_menu = item_menu;
	}
	
	public String getDescription_item_menu() {
		return description_item_menu;
	}

	public void setDescription_item_menu(String description_item_menu) {
		this.description_item_menu = description_item_menu;
	}


}