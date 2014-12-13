package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.OrderDetail;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class OrderDetailDAO extends HibernateDaoSupport {
	public void addDetail(OrderDetail detail) {
		getHibernateTemplate().save(detail);
	}
	
	@SuppressWarnings("unchecked")
	public List<OrderDetail> getDetailById(int orderId) {
		String query = "select d from OrderDetail d "
				+ "where d.order.id = " + orderId;
		return getHibernateTemplate().find(query);
	}
	
	public boolean bookOrdered(int bookId) {
		String query = "select d from OrderDetail d "
				+ "where d.book.id = " + bookId;
		return getHibernateTemplate().find(query).size() > 0;
	}
}
