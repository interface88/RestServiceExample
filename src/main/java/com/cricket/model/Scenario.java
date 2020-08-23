package com.cricket.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "scenario")
public class Scenario implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8809233017455511197L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "NAME")
	private String name;
	
	@ManyToMany(cascade = {CascadeType.ALL}, mappedBy = "scenarioList")
	public List<Product> productList;

	//@ManyToMany(cascade = {CascadeType.ALL}, mappedBy = "scenarioList")
	//public List<Customer> customerList;

	
	// -------------- Getter amd Setter ------------

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

}
