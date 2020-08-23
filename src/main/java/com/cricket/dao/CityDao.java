package com.cricket.dao;

import java.util.List;

import com.cricket.model.City;

public interface CityDao {

  long save(City city);

  City get(long id);

  List<City> list();

  void update(long id, City city);

  void delete(long id);

  City cityName(String cityName);

}
