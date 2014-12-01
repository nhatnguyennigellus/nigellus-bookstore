package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Order;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class OrderDAO extends HibernateDaoSupport{
	public void addOrder(Order order) {
		getHibernateTemplate().save(order);
	}
	
	public List<Order> getOrderByUser(String username) {
		String query = "select o from Order o "
				+ "where o.customer.username = " + username;
		return getHibernateTemplate().find(query);
	}
}
