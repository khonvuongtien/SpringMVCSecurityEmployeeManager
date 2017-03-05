package com.kid.j5.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "authorities")
public class Authorities {

	
	@Id
	@Column(name="username")
	String username;

	
	@Column(name = "authority")
	String authority;

	public Authorities() {

	}

	public Authorities(String authority) {

		this.authority = authority;
	}

	public Authorities(String authority, String username) {

		this.authority = authority;
		this.username = username;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Authorities [authority=" + authority + ", username=" + username + "]";
	}

	

	
	
}
