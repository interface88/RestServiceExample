package com.cricket.vo;

public class ReportVO {

  private String city;
  private String ProductType;
  private String Product;
  private String sku;
  private String state;
  private Integer totalProduct;
  private Integer totalInterest;
  private String scenario;

  // ---- Getter and Setter -------------
  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getProductType() {
    return ProductType;
  }

  public void setProductType(String productType) {
    ProductType = productType;
  }

  public String getProduct() {
    return Product;
  }

  public void setProduct(String product) {
    Product = product;
  }

  public String getSku() {
    return sku;
  }

  public void setSku(String sku) {
    this.sku = sku;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public Integer getTotalProduct() {
    return totalProduct;
  }

  public void setTotalProduct(Integer totalProduct) {
    this.totalProduct = totalProduct;
  }

  public Integer getTotalInterest() {
    return totalInterest;
  }

  public void setTotalInterest(Integer totalInterest) {
    this.totalInterest = totalInterest;
  }

  public String getScenario() {
    return scenario;
  }

  public void setScenario(String scenario) {
    this.scenario = scenario;
  }

}
