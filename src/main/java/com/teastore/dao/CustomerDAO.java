package com.teastore.dao;

import java.util.List;

import com.teastore.entity.Category;
import com.teastore.entity.Customer;

public interface CustomerDAO {
    Customer findById(String id);
    List<Customer> findAll();
    Customer create(Customer entity);
    void update(Customer entity);
    Customer delete(String id);
	long getPageCount(int pageSize);
	List<Customer> getPage(int pageNo, int pageSize);
	void updatePassword(Customer entity);
}
