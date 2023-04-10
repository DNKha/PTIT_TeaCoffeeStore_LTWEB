package com.teastore.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import org.springframework.boot.convert.DataSizeUnit;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "Customers")
public class Customer {
	@Id
	@NotEmpty(message = "Không để trống")
	String id;
	@Length(min = 6, message = "Ít nhất 6 kí tự")
	String password;
	@NotEmpty(message = "Không để trống")
	String fullname;
	@NotEmpty(message = "Không để trống")
	@Email(message = "Không đúng định dạng email")
	String email;
	String photo;
	Boolean activated;
	Boolean admin;

	@JsonIgnore
	@OneToMany(mappedBy = "customer", fetch = FetchType.EAGER)
	List<Order> orders;

	public Customer() {
	}

	public Customer(String id, String password, String fullname, String email, String photo, Boolean activated,
			Boolean admin, List<Order> orders) {
		this.id = id;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.photo = photo;
		this.activated = activated;
		this.admin = admin;
		this.orders = orders;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
}
