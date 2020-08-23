package com.cricket.service;

import java.util.List;

import com.cricket.model.CityProductMaster;

public interface CityProductMasterService {

   long save(CityProductMaster cityProductMaster);
   List<CityProductMaster> list(long id);
   List<CityProductMaster> list();
   
   void update(long id, CityProductMaster cityProductMaster);
   void delete(long id);
   CityProductMaster get(long id);
}
