package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Order;
import nigellus.bookstore.entity.Warehouse;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class WarehouseDAO extends HibernateDaoSupport {
	public void warehousing(Warehouse whItem) {
		getHibernateTemplate().save(whItem);
	}
	
	@SuppressWarnings("unchecked")
	public List<Warehouse> getWarehousingLog() {
		String query = "select w from Warehouse w";
		return getHibernateTemplate().find(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> getWarehousingMonthly(int month, int year) {
		String query = "select w from Warehouse w "
				+ "where YEAR(w.dateWarehousing) = " + year
				+ " and MONTH(w.dateWarehousing) = " + month;
		return getHibernateTemplate().find(query);
	}
	
}
