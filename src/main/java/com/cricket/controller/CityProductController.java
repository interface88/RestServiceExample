package com.cricket.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cricket.model.CityProductMaster;
import com.cricket.service.CityProductMasterService;

@RequestMapping("/api")
@RestController
public class CityProductController {

  @Autowired
  private CityProductMasterService cityProductMasterService;

  /*---Add new cityProductMaster---*/
  @PostMapping("/cityProductMaster")
  public ResponseEntity<?> save(@RequestBody CityProductMaster cityProductMaster) {
    long id = cityProductMasterService.save(cityProductMaster);
    return ResponseEntity.ok().body("New CityProductMaster has been saved with ID:" + id);
  }

  /*---Get a cityProductMaster by id---*/
  @GetMapping("/cityProductMaster/{id}")
  public ResponseEntity<CityProductMaster> get(@PathVariable("id") long id) {
    CityProductMaster cityProductMaster = cityProductMasterService.get(id);
    return ResponseEntity.ok().body(cityProductMaster);
  }

  /*---get all cityProductMasters---*/
  @GetMapping("/cityProductMaster")
  public ResponseEntity<List<CityProductMaster>> list() {
    List<CityProductMaster> cityProductMasters = cityProductMasterService.list();
    return ResponseEntity.ok().body(cityProductMasters);
  }

  /*---Update a cityProductMaster by id---*/
  @PutMapping("/cityProductMaster/{id}")
  public ResponseEntity<?> update(@PathVariable("id") long id,
      @RequestBody CityProductMaster cityProductMaster) {
    cityProductMasterService.update(id, cityProductMaster);
    return ResponseEntity.ok().body("CityProductMaster has been updated successfully.");
  }

  /*---Delete a cityProductMaster by id---*/
  @DeleteMapping("/cityProductMaster/{id}")
  public ResponseEntity<?> delete(@PathVariable("id") long id) {
    cityProductMasterService.delete(id);
    return ResponseEntity.ok().body("CityProductMaster has been deleted successfully.");
  }
}
