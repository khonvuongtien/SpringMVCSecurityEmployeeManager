package com.kid.j5.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="departs")
public class Depart {

	@Id
	@Column(name="Id")
	@NotEmpty(message="Depart Id can't be empty")
	String DepartId;
	@Column(name="Name")
	@NotEmpty(message="Depart Name can't be empty")
	String name;
	@OneToMany(mappedBy = "depart")
	List<Staff> staff;

	public Depart() {
		
	}

	
	
	public List<Staff> getStaff() {
		return staff;
	}



	public void setStaff(List<Staff> staff) {
		this.staff = staff;
	}



	public Depart(String departId, String name) {
		DepartId = departId;
		this.name = name;
	}

	public String getDepartId() {
		return DepartId;
	}

	public void setDepartId(String departId) {
		DepartId = departId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	@Override
	public String toString() {
		return "Depart [DepartId=" + DepartId + ", name=" + name +   "]";
	}
	
	
}
