package com.teastore.dao;

import java.util.List;

import com.teastore.entity.Product;

public interface ProductDAO {
    Product findById(Integer id);
    List<Product> findAll();
    Product create(Product entity);
    void update(Product entity);
    Product delete(Integer id);
	List<Product> findByCategoryId(Integer categoId);
	List<Product> findByKeywords(String keywords);
	List<Product> findByIds(String ids);
	List<Product> findBySpecial(Integer id);
	List<Product> findBySpecialIndex(Integer id);
	long getPageCount(int pageSize);
	List<Product> getPage(int pageNo, int pageSize);
}
