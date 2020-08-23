package com.cricket.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity(name = "product")

public class Product implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7436030480338132060L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "PRODUCT_NAME")
	private String productName;
	
	@Column(name = "PRODUCT_NO")
	private String productNo;
	
	@Column(name = "PRODUCT_TYPE")
	private String productType;
	
	@Column(name = "PRODUCT_IMAGE")
	private String productImage;
	
	@Column(name = "STATUS")
	private Boolean status;
	
	@Column(name = "PRODUCT_CODE")
	private String productcode;
	
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name = "product_city", joinColumns = { @JoinColumn(name = "PRODUCT_ID") }, inverseJoinColumns = { @JoinColumn(name = "CITY_ID") })
	private Set<City> cityList = new HashSet<City>(0);
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name = "product_state", joinColumns = { @JoinColumn(name = "PRODUCT_ID" ) }, inverseJoinColumns = { @JoinColumn(name = "STATE_ID") })
	private Set<State> stateList = new HashSet<State>(0);
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
	@JoinTable(name = "product_scenario", joinColumns = { @JoinColumn(name = "PRODUCT_ID") }, inverseJoinColumns = { @JoinColumn(name = "SCENARIO_ID") })
	private Set<Scenario> scenarioList = new HashSet<Scenario>(0);
	
	// -------------- Getter and Setter ------------

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Set<City> getCityList() {
		return cityList;
	}

	public void setCityList(Set<City> cityList) {
		this.cityList = cityList;
	}

	public Set<State> getStateList() {
		return stateList;
	}

	public void setStateList(Set<State> stateList) {
		this.stateList = stateList;
	}

	public Set<Scenario> getScenarioList() {
		return scenarioList;
	}

	public void setScenarioList(Set<Scenario> scenarioList) {
		this.scenarioList = scenarioList;
	}

	public String getProductcode() {
		return productcode;
	}

	public void setProductcode(String productcode) {
		this.productcode = productcode;
	}
	
}
