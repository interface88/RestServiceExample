package com.cricket.service;

import java.util.List;

import com.cricket.model.Customer;

public interface CustomerService {

	public static final String CUSTOMER_ZIP_FILE_PATH ="/WEB-INF/upload/customer_product/";
	long save(Customer customer);
	Customer get(long id);
	List<Customer> list();
	List<Customer> listByParam(String startDate, String endDate);
	void update(long id, Customer customer);
	void delete(long id);
   
	void addProduct(String zipFile, Long productId, Long scenarioId);
	public List<String> getInterestedProductList(Long customerId);
	public List<String> getInterestedScenarioList(Long customerId);
}
