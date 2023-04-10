package com.teastore.dao;

import java.util.List;

import com.teastore.entity.Customer;
import com.teastore.entity.Order;
import com.teastore.entity.OrderDetail;
import com.teastore.entity.Product;

public interface OrderDAO {
    Order findById(Integer id);
    List<Order> findAll();
    Order create(Order entity);
    void update(Order entity);
    Order delete(Integer id);
	void create(Order order, List<OrderDetail> details);
	List<Order> findByUser(Customer user);
	List<Product> findItemsByUser(Customer user);
	long getPageCount(int pageSize);
	List<Order> getPage(int pageNo, int pageSize);
}
