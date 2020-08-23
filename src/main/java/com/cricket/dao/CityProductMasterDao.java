package com.cricket.dao;

import java.util.List;

import com.cricket.model.CityProductMaster;

public interface CityProductMasterDao {

  long save(CityProductMaster cityProductMaster);

  List<CityProductMaster> list(long id);

  List<CityProductMaster> list();

  void update(long id, CityProductMaster cityProductMaster);

  void delete(long id);

  static CityProductMaster get(long id) {
    return null;
  }

}
