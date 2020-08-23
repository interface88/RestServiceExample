package com.cricket.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
import com.cricket.model.State;
import com.cricket.service.StateService;
import com.cricket.vo.CityVO;
import com.cricket.vo.StateVO;

@RequestMapping("/api")
@RestController
public class StateController {

  @Autowired
  private StateService stateService;

  /*---Add new state---*/
  @PostMapping("/state")
  public ResponseEntity<?> save(@RequestBody State state) {
    long id = stateService.save(state);
    return ResponseEntity.ok().body("New State has been saved with ID:" + id);
  }

  /*---Get a state by id---*/
  @GetMapping("/state/{id}")
  public ResponseEntity<State> get(@PathVariable("id") long id) {
    State state = stateService.get(id);
    return ResponseEntity.ok().body(state);
  }

  /*---get all states---*/
  @GetMapping("/state")
  public ResponseEntity<List<StateVO>> list(@RequestParam(required = false) String stateName) {
    List<StateVO> stateVoList = new ArrayList<StateVO>();
    List<State> states = stateService.list(stateName);

    for (State state : states) {
      stateVoList.add(convertDTOtoVO(state));
    }
    return ResponseEntity.ok().body(stateVoList);
  }

  /*---Update a state by id---*/
  @PutMapping("/state/{id}")
  public ResponseEntity<?> update(@PathVariable("id") long id, @RequestBody State state) {
    stateService.update(id, state);
    return ResponseEntity.ok().body("State has been updated successfully.");
  }

  /*---Delete a state by id---*/
  @DeleteMapping("/state/{id}")
  public ResponseEntity<?> delete(@PathVariable("id") long id) {
    stateService.delete(id);
    return ResponseEntity.ok().body("State has been deleted successfully.");
  }

  private StateVO convertDTOtoVO(State state) {
    StateVO stateVO = new StateVO();

    stateVO.setId(state.getId());
    stateVO.setStateName(state.getStateName());

    Set<CityVO> cityList = new HashSet<CityVO>();
    Set<City> cities = state.getCityList();
    for (City city : cities) {
      CityVO cityVO = new CityVO();
      cityVO.setId(city.getId());
      cityVO.setCityName(city.getCityName());
      cityList.add(cityVO);
    }

    stateVO.setCityList(cityList);
    return stateVO;
  }

}
