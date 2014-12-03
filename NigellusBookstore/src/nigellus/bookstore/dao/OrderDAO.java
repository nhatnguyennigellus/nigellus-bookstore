package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Order;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class OrderDAO extends HibernateDaoSupport{
	public void addOrder(Order order) {
		getHibernateTemplate().save(order);
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getOrderByUser(String username) {
		String query = "select o from Order o "
				+ "where o.customer.username = '" + username + "'";
		return getHibernateTemplate().find(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getOrder() {
		String query = "select o from Order o";
		return getHibernateTemplate().find(query);
	}
	
	public Order getOrderById(int id) {
		String query = "select o from Order o "
				+ "where o.id = " + id + "";
		return (Order) getHibernateTemplate().find(query).get(0);
	}
	
	public void updateOrder(Order order) {
		getHibernateTemplate().update(order);
	}
}
