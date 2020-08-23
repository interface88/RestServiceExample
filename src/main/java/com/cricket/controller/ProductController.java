package com.cricket.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cricket.model.City;
import com.cricket.model.Product;
import com.cricket.model.Scenario;
import com.cricket.model.State;
import com.cricket.service.CityService;
import com.cricket.service.ProductService;
import com.cricket.vo.ProductVO;

@RequestMapping("/api")
@RestController
public class ProductController {

  @Autowired
  private ProductService productService;


  @Autowired
  private CityService cityService;

  /*---Add new product---*/
  @PostMapping("/product")
  public ResponseEntity<?> save(@RequestBody Product product) {
    long pid = productService.save(product);
    return ResponseEntity.ok().body("New Product has been saved with ID:" + pid);
  }

  /*---Get a product by pid---*/
  @GetMapping("/product/{pid}")
  public ResponseEntity<Product> get(@PathVariable("pid") long pid) {
    Product product = productService.get(pid);
    return ResponseEntity.ok().body(product);
  }

  /*---get all products---*/
  @GetMapping("/product")
  public ResponseEntity<List<ProductVO>> list(@RequestParam Map<String, String> allParams) {

    List<Product> products = productService.list(allParams);
    List<ProductVO> productVOList = new ArrayList<ProductVO>();
    for (Product product : products) {
      productVOList.add(convertDTOtoVO(product));
    }
    return ResponseEntity.ok().body(productVOList);
  }

  /*---Update a product by pid---*/
  @PutMapping("/product/{pid}")
  public ResponseEntity<?> update(@PathVariable("pid") long pid, @RequestBody Product product) {
    productService.update(pid, product);
    return ResponseEntity.ok().body("Product has been updated successfully.");
  }

  /*---Delete a product by pid---*/
  @DeleteMapping("/product/{pid}")
  public ResponseEntity<?> delete(@PathVariable("pid") long pid) {
    productService.delete(pid);
    return ResponseEntity.ok().body("Product has been deleted successfully.");
  }

  private ProductVO convertDTOtoVO(Product product) {
    ProductVO productVO = new ProductVO();

    productVO.setId(product.getId());
    productVO.setProductName(product.getProductName());
    productVO.setProductNo(product.getProductNo());
    productVO.setProductType(product.getProductType());
    productVO.setProductImage(product.getProductImage());
    productVO.setStatus(product.getStatus());
    productVO.setProductcode(product.getProductcode());
    // loading state
    Set<State> states = product.getStateList();
    Set<Long> stateList = new HashSet<Long>();
    for (State state : states) {
      stateList.add(state.getId());
    }

    // loading city
    Set<City> cities = product.getCityList();
    Set<Long> cityList = new HashSet<Long>();
    for (City city : cities) {
      cityList.add(city.getId());
    }

    // loading state
    Set<Scenario> scenarios = product.getScenarioList();
    Set<Long> scenarioList = new HashSet<Long>();
    for (Scenario scenario : scenarios) {
      scenarioList.add(scenario.getId());
    }

    productVO.setStateList(stateList);
    productVO.setCityList(cityList);
    productVO.setScenarioList(scenarioList);

    return productVO;
  }

}
