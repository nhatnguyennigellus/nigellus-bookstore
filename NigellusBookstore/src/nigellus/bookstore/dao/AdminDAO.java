package nigellus.bookstore.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import nigellus.bookstore.entity.Category;

public class AdminDAO extends HibernateDaoSupport{
	@SuppressWarnings("unchecked")
	public boolean isAuthenticated(String username, String password) {
		String query = "select a from Admin a"
				+ " where a.username = '"+ username
				+ "' AND a.password = '" + password + "'";
		return getHibernateTemplate().find(query).size() > 0;
	}
}
