package com.cricket.controller.view;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.model.City;
import com.cricket.model.State;
import com.cricket.service.CityService;
import com.cricket.service.StateService;

@Controller
@RequestMapping("/mvc/city")
public class CityViewController {
  @Autowired
  private CityService cityService;

  @Autowired
  private StateService stateService;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Model model) {
    List<City> citys = cityService.list();
    model.addAttribute("cityList", citys);
    return "city/list";
  }

  @RequestMapping(value = "/view", method = RequestMethod.GET)
  public String view(@RequestParam(required = false) Long id, Model model) {
    // if id is null than user adding is new one
    City city = new City();
    if (id != null) {
      city = cityService.get(id);
    }

    // state list dropdown
    List<State> stateList = stateService.list(null);
    model.addAttribute("stateList", stateList);

    model.addAttribute("city", city);
    return "city/view";
  }

  @RequestMapping(value = "/save", method = RequestMethod.POST)
  public String save(@ModelAttribute("city") City city, Model model, RedirectAttributes rm) {

    // saving city in database
    if (city.getId() != null) {
      cityService.update(city.getId(), city);
    } else {
      cityService.save(city);
    }

    // state list dropdown
    List<State> stateList = stateService.list(null);
    model.addAttribute("stateList", stateList);
    model.addAttribute("city", city);

    rm.addFlashAttribute("message", "Record Saved Sucessfully");
    return "redirect:list";
  }

  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public String save(@RequestParam(required = false) Long id, Model model, RedirectAttributes rm) {
    cityService.delete(id);
    rm.addFlashAttribute("message", "Record Deleted Sucessfully");
    return "redirect:list";
  }

}
