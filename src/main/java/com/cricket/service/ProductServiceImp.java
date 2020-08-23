package com.cricket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.ProductDao;
import com.cricket.model.Product;

@Service
@Transactional(readOnly = true)
public class ProductServiceImp implements ProductService {

   @Autowired
   private ProductDao productDao;

   @Transactional
   @Override
   public long save(Product product) {
      return productDao.save(product);
   }

   @Override
   public Product get(long cid) {
      return productDao.get(cid);
   }

   @Override
   public List<Product> list(Map<String, String> paramList) {
	   if(paramList.isEmpty()){
		   return productDao.list();
	   }else{
		  return productDao.list(paramList);
	   }
   }

   @Transactional
   @Override
   public void update(long cid, Product product) {
      productDao.update(cid, product);
   }

   @Transactional
   @Override
   public void delete(long cid) {
      productDao.delete(cid);
   }

}
