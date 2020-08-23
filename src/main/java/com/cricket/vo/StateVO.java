package com.cricket.vo;

import java.util.HashSet;
import java.util.Set;

public class StateVO {

  private Long id;
  private String stateName;
  private Set<Long> productList = new HashSet<Long>();
  private Set<CityVO> cityList = new HashSet<CityVO>();


  // -------------- Getter and Setter ------------

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getStateName() {
    return stateName;
  }

  public void setStateName(String stateName) {
    this.stateName = stateName;
  }

  public Set<CityVO> getCityList() {
    return cityList;
  }

  public void setCityList(Set<CityVO> cityList) {
    this.cityList = cityList;
  }

  public Set<Long> getProductList() {
    return productList;
  }

  public void setProductList(Set<Long> productList) {
    this.productList = productList;
  }



}
