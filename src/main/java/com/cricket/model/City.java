package com.cricket.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Column;
import javax.persistence.Table;

@Entity
@Table(name = "city")
public class City implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7823298697600525187L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "CITY_NAME")
	private String cityName;

	@ManyToOne
	@JoinColumn(name = "STATE_ID")
	private State state;

	private Boolean status;
	
	@ManyToMany(cascade = {CascadeType.ALL}, mappedBy = "cityList")
	public List<Product> productList;


	// -------------- Getter and Setter ------------

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	
	

}
