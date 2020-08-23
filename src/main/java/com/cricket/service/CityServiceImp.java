package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.CityDao;
import com.cricket.model.City;

@Service
@Transactional(readOnly = true)
public class CityServiceImp implements CityService {

   @Autowired
   private CityDao cityDao;

   @Transactional
   @Override
   public long save(City city) {
      return cityDao.save(city);
   }

   @Override
   public City get(long cid) {
      return cityDao.get(cid);
   }

   @Override
   public List<City> list() {
      return cityDao.list();
   }

   @Transactional
   @Override
   public void update(long cid, City city) {
      cityDao.update(cid, city);
   }

   @Transactional
   @Override
   public void delete(long cid) {
      cityDao.delete(cid);
   }
   
   @Override
   public City cityName(String cityName) {
      return cityDao.cityName(cityName);
   }

}
