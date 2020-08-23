package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.CityProductMasterDao;
import com.cricket.model.CityProductMaster;
import com.cricket.model.Customer;

@Service
@Transactional(readOnly = true)
public class CityProductMasterServiceImp implements CityProductMasterService {

   @Autowired
   private CityProductMasterDao cityProductMasterDao;

   @Transactional
   @Override
   public long save(CityProductMaster cityProductMaster) {
      return cityProductMasterDao.save(cityProductMaster);
   }
   @Override
   public List<CityProductMaster> list(long id) {
      return cityProductMasterDao.list(id);
   }
   @Override
	public CityProductMaster get(long id) {
		return CityProductMasterDao.get(id);
	}

   @Override
   public List<CityProductMaster> list() {
      return cityProductMasterDao.list();
   }
   
   

   @Transactional
   @Override
   public void update(long id, CityProductMaster cityProductMaster) {
      cityProductMasterDao.update(id, cityProductMaster);
   }

   @Transactional
   @Override
   public void delete(long id) {
      cityProductMasterDao.delete(id);
   }

}
