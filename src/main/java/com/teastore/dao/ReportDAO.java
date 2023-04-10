package com.teastore.dao;

import java.util.List;

public interface ReportDAO {
	public List<Object[]> inventory();
	public List<Object[]> revenueByCategory();
	public List<Object[]> revenueByCustomer();
	public List<Object[]> revenueByYear();
	public List<Object[]> revenueByQuater();
	public List<Object[]> revenueByMonth();
	public List<Object[]> revenueNewMonth();
}
