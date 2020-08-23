package com.cricket.dao;

import java.util.List;
import java.util.Map;

import com.cricket.model.Product;

public interface ProductDao {

	long save(Product product);

	Product get(long id);

	List<Product> list();
	
	List<Product> list(Map<String, String> paramList);

	void update(long id, Product product);

	void delete(long id);

}
