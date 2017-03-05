package com.kid.j5.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="records")
public class Record {

	@Id
	@Column(name="Id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	@Column(name="Type")
	int type;
	@Column(name="Reason")
	String reason;
	@Column(name="Date")
	String date;
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="StaffId")
	Staff staff;
	
	public Record() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}
		
}
