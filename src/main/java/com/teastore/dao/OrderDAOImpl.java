package com.teastore.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.teastore.entity.Customer;
import com.teastore.entity.Order;
import com.teastore.entity.OrderDetail;
import com.teastore.entity.Product;

@Transactional
@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public Order findById(Integer id) {
		Session session = factory.getCurrentSession();
		Order entity = session.find(Order.class, id);
		return entity;
	}

	@Override
	public List<Order> findAll() {
		String hql = "FROM Order o ORDER BY o.orderDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		List<Order> list = query.getResultList();
		return list;
	}

	@Override
	public Order create(Order entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Order entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	@Override
	public Order delete(Integer id) {
		Session session = factory.getCurrentSession();
		Order entity = session.find(Order.class, id);
		session.delete(entity);
		return entity;
	}

	@Override
	public void create(Order order, List<OrderDetail> details) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(order);
		for(OrderDetail detail:details) {
			session.save(detail);
		}
		
	}

	@Override
	public List<Order> findByUser(Customer user) {
		// TODO Auto-generated method stub
		String hql = "FROM Order o WHERE o.customer.id=:uid ORDER BY o.orderDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		query.setParameter("uid", user.getId());
		List<Order> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findItemsByUser(Customer user) {
		// TODO Auto-generated method stub
		String hql = "SELECT DISTINCT od.product "
				+ "FROM OrderDetail od "
				+ "WHERE od.order.customer.id=:uid";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("uid", user.getId());
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public long getPageCount(int pageSize) {
		String hql = "SELECT count(c) FROM Order c";
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql, Long.class);
		Long rowCount = query.getSingleResult();
		long pageCount =  (long) Math.ceil(1.0*rowCount/pageSize);
		return pageCount;
	}

	@Override
	public List<Order> getPage(int pageNo, int pageSize) {
		String hql = "FROM Order c ORDER BY c.orderDate DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		List<Order> list = query.getResultList();
		return list;

	}

}
