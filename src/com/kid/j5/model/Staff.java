package com.kid.j5.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="staffs")
public class Staff {
	@Id
	@Column(name="Id")
	String StaffId;
	
	@Column(name="Name")
	@NotEmpty(message="Staff Name can't be empty")
	String StaffName;
	
	@Column(name="Gender")
	@NotEmpty(message="Staff Gender can't be empty")
	String Gender;
	
	@Column(name="Birthday")
	@NotEmpty(message="Staff Bitrhday can't be empty")
	String Birthday;
	
	@Column(name="Photo")
	@NotEmpty(message="Staff Photo can't be empty")
	String Photo;
	
	@Column(name="Email")
	@NotEmpty(message="Staff Email can't be empty")
	@Pattern(regexp=".*\\@.*\\..*", message="Email is invalid")
	String Email;
	
	@Column(name="Phone")
	@NotEmpty(message="Staff Phone can't be empty")
	@Pattern(regexp="[0-9]+", message="Phone is invalid")
	String Phone;
	
	@Column(name="Notes")
	String Notes;
	
	@Column(name="Salary")
	@Min(value=1000,message="Staff Salary can't be less than 1000")
	float Salary;
	
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="DepartId")
	Depart depart;
	
	@OneToMany(mappedBy="staff")
	List<Record> record;
	public Staff() {
	}
	public Staff(String staffId, String staffName, String gender, String birthday, String photo, String email,
			String phone, String notes, float salary, Depart depart) {
		
		StaffId = staffId;
		StaffName = staffName;
		Gender = gender;
		Birthday = birthday;
		Photo = photo;
		Email = email;
		Phone = phone;
		Notes = notes;
		Salary = salary;
		this.depart = depart;
	}	
	public Staff(String staffId, String staffName, String gender, String birthday, String photo, String email,
			String phone, String notes) {
		super();
		StaffId = staffId;
		StaffName = staffName;
		Gender = gender;
		Birthday = birthday;
		Photo = photo;
		Email = email;
		Phone = phone;
		Notes = notes;
		
	}
	public String getStaffId() {
		return StaffId;
	}
	public void setStaffId(String staffId) {
		StaffId = staffId;
	}
	public String getStaffName() {
		return StaffName;
	}
	public void setStaffName(String staffName) {
		StaffName = staffName;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getBirthday() {
		return Birthday;
	}
	public void setBirthday(String birthday) {
		Birthday = birthday;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getNotes() {
		return Notes;
	}
	public void setNotes(String notes) {
		Notes = notes;
	}
	public float getSalary() {
		return Salary;
	}
	public void setSalary(float salary) {
		Salary = salary;
	}
	public Depart getDepart() {
		return depart;
	}
	public void setDepart(Depart depart) {
		this.depart = depart;
	}
	
	public List<Record> getRecord() {
		return record;
	}
	public void setRecord(List<Record> record) {
		this.record = record;
	}
	@Override
	public String toString() {
		return "Staff [StaffId=" + StaffId + ", StaffName=" + StaffName + ", Gender=" + Gender + ", Birthday="
				+ Birthday + ", Photo=" + Photo + ", Email=" + Email + ", Phone=" + Phone + ", Notes=" + Notes
				+ ", Salary=" + Salary + ", depart=" + depart + "]";
	}
	
	
	
	
}
