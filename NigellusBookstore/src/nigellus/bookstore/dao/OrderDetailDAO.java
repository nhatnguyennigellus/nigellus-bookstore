package nigellus.bookstore.dao;

import nigellus.bookstore.entity.OrderDetail;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class OrderDetailDAO extends HibernateDaoSupport {
	public void addDetail(OrderDetail detail) {
		getHibernateTemplate().save(detail);
	}
}
