package nigellus.bookstore.dao;

import nigellus.bookstore.entity.Customer;
import nigellus.bookstore.entity.OrderConfig;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class OrderConfigDAO extends HibernateDaoSupport {
	public void updateConfig(OrderConfig config) {
		getHibernateTemplate().update(config);
	}
	
	public OrderConfig getOrderConfig() {
		String query = "select c from OrderConfig c"
				+ " where c.id = 1";
		return (OrderConfig) getHibernateTemplate().find(query).get(0);
	}
}
