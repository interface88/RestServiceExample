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

import com.cricket.model.City;
import com.cricket.service.CityService;

@RequestMapping("/api")
@RestController
public class CityController {

   @Autowired
   private CityService cityService;

   /*---Add new city---*/
   @PostMapping("/city")
   public ResponseEntity<?> save(@RequestBody City city) {
      long cid = cityService.save(city);
      return ResponseEntity.ok().body("New City has been saved with cid:" + cid);
   }

   /*---Get a city by cid---*/
   @GetMapping("/city/{cid}")
   public ResponseEntity<City> get(@PathVariable("cid") long cid) {
      City city = cityService.get(cid);
      return ResponseEntity.ok().body(city);
   }

   /*---get all citys---*/
   @GetMapping("/city")
   public ResponseEntity<List<City>> list() {
      List<City> citys = cityService.list();
      return ResponseEntity.ok().body(citys);
   }

   /*---Update a city by cid---*/
   @PutMapping("/city/{cid}")
   public ResponseEntity<?> update(@PathVariable("cid") long cid, @RequestBody City city) {
      cityService.update(cid, city);
      return ResponseEntity.ok().body("City has been updated successfully.");
   }

   /*---Delete a city by cid---*/
   @DeleteMapping("/city/{cid}")
   public ResponseEntity<?> delete(@PathVariable("cid") long cid) {
      cityService.delete(cid);
      return ResponseEntity.ok().body("City has been deleted successfully.");
   }
}
