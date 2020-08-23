package com.cricket.vo;

import java.util.HashSet;
import java.util.Set;

public class ProductVO {

  private Long id;
  private String productName;
  private String productNo;
  private String productType;
  private String productImage;
  private Boolean status;
  private String productcode;

  private Set<Long> cityList = new HashSet<Long>();
  private Set<Long> stateList = new HashSet<Long>();
  private Set<Long> scenarioList = new HashSet<Long>();

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

  public String getProductcode() {
    return productcode;
  }

  public void setProductcode(String productcode) {
    this.productcode = productcode;
  }

  public Set<Long> getCityList() {
    return cityList;
  }

  public void setCityList(Set<Long> cityList) {
    this.cityList = cityList;
  }

  public Set<Long> getStateList() {
    return stateList;
  }

  public void setStateList(Set<Long> stateList) {
    this.stateList = stateList;
  }

  public Set<Long> getScenarioList() {
    return scenarioList;
  }

  public void setScenarioList(Set<Long> scenarioList) {
    this.scenarioList = scenarioList;
  }

}
