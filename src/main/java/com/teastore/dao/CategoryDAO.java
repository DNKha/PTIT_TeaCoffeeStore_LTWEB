package com.teastore.dao;

import java.util.List;

import com.teastore.entity.Category;

public interface CategoryDAO {
    Category findById(Integer id);
    List<Category> findAll();
    Category create(Category entity);
    void update(Category entity);
    Category delete(Integer id);
	long getPageCount(int pageSize);
	List<Category> getPage(int pageNo, int pageSize);
}
