package nigellus.bookstore.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Promotion;

public class PromotionDAO extends HibernateDaoSupport {
	@SuppressWarnings("unchecked")
	public List<Promotion> getPromotionList() {

		String query = "select p from Promotion p";
		return getHibernateTemplate().find(query);
	}

	@SuppressWarnings("unchecked")
	public List<Promotion> getActivePromotionList() {

		String query = "select p from Promotion p "
				+ "where p.status = 'Active'";
		return getHibernateTemplate().find(query);
	}
	
	public void addPromotion(Promotion promotion) {
		getHibernateTemplate().save(promotion);
	}

	public void updatePromotion(Promotion promotion) {
		getHibernateTemplate().update(promotion);
	}
	
	public void deletePromotion(int id) {
		getHibernateTemplate().delete((getPromotionById(id)));
	}
	
	public void deletePromotion(String code) {
		getHibernateTemplate().delete((getPromotionByCode(code)));
	}
	
	public Promotion getPromotionById(int id) {

		String query = "select p from Promotion p where p.id = " + id;
		return (Promotion) getHibernateTemplate().find(query).get(0);
	}
	
	public Promotion getPromotionByCode(String code) {
		
		try {
			String query = "select p from Promotion p "
					+ "where p.promotionCode = '" + code + "'";
			return (Promotion) getHibernateTemplate().find(query).get(0);
		} catch (IndexOutOfBoundsException e) {
			return null;
		}
	}
	
	public Promotion getPromotionByType(String type) {

		String query = "select p from Promotion p "
				+ "where p.promotionType = '" + type + "'";
		return (Promotion) getHibernateTemplate().find(query).get(0);
	}
}
