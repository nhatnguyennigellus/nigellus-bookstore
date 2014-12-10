package nigellus.bookstore.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import nigellus.bookstore.entity.OrderPromotion;

public class OrderPromotionDAO extends HibernateDaoSupport{
	public void addPromoteOrder(OrderPromotion ordpro) {
		getHibernateTemplate().save(ordpro);
	}
	
	@SuppressWarnings("unchecked")
	public List<OrderPromotion> getOrdPromoteById(int orderId) {
		String query = "select p from OrderPromotion p "
				+ "where p.order.id = " + orderId;
		return getHibernateTemplate().find(query);
	}
}
