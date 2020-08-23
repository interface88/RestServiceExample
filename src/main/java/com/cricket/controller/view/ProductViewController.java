package com.cricket.controller.view;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.model.City;
import com.cricket.model.Product;
import com.cricket.model.Scenario;
import com.cricket.model.State;
import com.cricket.service.CityService;
import com.cricket.service.ProductService;
import com.cricket.service.ScenarioService;
import com.cricket.service.StateService;
import com.cricket.vo.ProductVO;

@Controller
@RequestMapping("/mvc/product")
public class ProductViewController {

  @Autowired
  private ProductService productService;

  @Autowired
  private CityService cityService;

  @Autowired
  private StateService stateService;


  @Autowired
  private ScenarioService scenarioService;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Model model) {

    List<Product> products = productService.list(new HashMap<String, String>());
    model.addAttribute("productList", products);
    return "product/list";
  }

  @RequestMapping(value = "/view", method = RequestMethod.GET)
  public String view(@RequestParam(required = false) Long id, Model model) {
    // if id is null than user adding is new one
    ProductVO productVO = new ProductVO();
    if (id != null) {
      Product product = productService.get(id);
      productVO = convertDTOtoVO(product);
    }

    List<State> stateList = stateService.list(null);
    List<City> cityList = cityService.list();
    List<Scenario> scenarioList = scenarioService.list();

    model.addAttribute("productVO", productVO);
    model.addAttribute("stateList", stateList);
    model.addAttribute("cityList", cityList);
    model.addAttribute("scenarioList", scenarioList);
    return "product/view";
  }

  @RequestMapping(value = "/save", method = RequestMethod.POST)
  public String save(@ModelAttribute("productVO") ProductVO productVO, Model model,
      RedirectAttributes rm) {

    // saving city in database
    Product product = convertVOtoDTO(productVO);
    if (productVO.getId() != null) {
      productService.update(product.getId(), product);
    } else {
      productService.save(product);
    }

    rm.addFlashAttribute("message", "Record Added Sucessfully");
    return "redirect:list";
  }

  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public String save(@RequestParam(required = false) Long id, Model model, RedirectAttributes rm) {
    productService.delete(id);
    rm.addFlashAttribute("message", "Record Deleted Sucessfully");
    return "redirect:list";
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

  private Product convertVOtoDTO(ProductVO productVO) {
    Product product = new Product();

    product.setId(productVO.getId());
    product.setProductName(productVO.getProductName());
    product.setProductNo(productVO.getProductNo());
    product.setProductType(productVO.getProductType());
    product.setProductImage(productVO.getProductImage());
    product.setStatus(productVO.getStatus());
    product.setProductcode(productVO.getProductcode());

    // loading state
    Set<State> states = new HashSet<State>();
    Set<Long> stateList = productVO.getStateList();
    for (Long stateId : stateList) {
      states.add(stateService.get(stateId));
    }

    // loading city
    Set<City> cities = new HashSet<City>();
    Set<Long> cityList = productVO.getCityList();
    for (Long cityId : cityList) {
      cities.add(cityService.get(cityId));
    }

    // loading state
    Set<Scenario> scenarios = new HashSet<Scenario>();
    Set<Long> scenarioList = productVO.getScenarioList();
    for (Long scenarioId : scenarioList) {
      scenarios.add(scenarioService.get(scenarioId));

    }

    product.setCityList(cities);
    product.setStateList(states);
    product.setScenarioList(scenarios);

    return product;
  }

}
