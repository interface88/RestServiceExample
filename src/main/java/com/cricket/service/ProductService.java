package com.cricket.service;

import java.util.List;
import java.util.Map;

import com.cricket.model.Product;

public interface ProductService {

	long save(Product product);

	Product get(long pid);

	List<Product> list(Map<String, String> paramList);

	void update(long pid, Product product);

	void delete(long pid);
}
