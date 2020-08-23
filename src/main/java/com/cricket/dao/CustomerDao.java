package com.cricket.dao;

import java.util.List;

import com.cricket.model.Customer;

public interface CustomerDao {

	long save(Customer customer);

	Customer get(long id);

	List<Customer> list();
	
	List<Customer> listByParam(String startDate, String endDate);

	void update(long id, Customer customer);

	void delete(long id);
	
	void addProduct(String zipFile, Long productId, Long scenarioId);
	
	List<String> getInterestedProductList(Long customerId);

	List<String> getInterestedScenarioList(Long customerId);
	
}
