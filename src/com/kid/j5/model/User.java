package com.kid.j5.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="users")
public class User {

	@Id
	@Column(name="username")
	@NotEmpty(message="Username can't be empty")
	String username;
	@Column(name="password")
	@NotEmpty(message="Password can't be empty")
	
	String password;
	@Column(name="enabled")
	@NotNull(message="Please choose status for account")
	String enabled;
	@Column(name="fullname")
	@NotEmpty(message="Fullname can't be empty")
	String fullname;
	@Column(name="email")
	@NotEmpty(message="Email can't be empty")
	String email;
	@Transient
	String role;
	
	
	public User() {
	}

	public User(String username, String password, String enabled, String fullname, String authority) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.fullname = fullname;
		this.role = authority;
	}

	public User(String username, String password, String enabled, String fullname) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.fullname = fullname;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", enabled=" + enabled + ", fullname="
				+ fullname + ", authority=" + role + "]";
	}

	
	
	
	
	
	
	
}
