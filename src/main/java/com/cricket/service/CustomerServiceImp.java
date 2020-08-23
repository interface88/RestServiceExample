package com.cricket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cricket.dao.CustomerDao;
import com.cricket.model.Customer;

@Service
@Transactional(readOnly = true)
public class CustomerServiceImp implements CustomerService {

	@Autowired
	private CustomerDao customerDao;

	@Transactional
	@Override
	public long save(Customer customer) {
		return customerDao.save(customer);
	}

	@Override
	public Customer get(long id) {
		return customerDao.get(id);
	}

	@Override
	public List<Customer> list() {
		return customerDao.list();
	}
	
	@Override
	public List<Customer> listByParam(String startDate, String endDate){
		return customerDao.listByParam(startDate, endDate);
	}

	@Transactional
	@Override
	public void update(long id, Customer customer) {
		customerDao.update(id, customer);
	}

	@Transactional
	@Override
	public void delete(long id) {
		customerDao.delete(id);
	}

	@Transactional
	@Override
	public void addProduct(String zipFile, Long productId , Long scenarioId) {
		customerDao.addProduct(zipFile, productId,scenarioId);

	}

	@Override
	public List<String> getInterestedProductList(Long customerId){
		return customerDao.getInterestedProductList(customerId);
	}
	
	@Override
	public List<String> getInterestedScenarioList(Long customerId){
		return customerDao.getInterestedScenarioList(customerId);
	}

}
