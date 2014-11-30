package nigellus.bookstore.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AdminDAO extends HibernateDaoSupport{
	public boolean isAuthenticated(String username, String password) {
		String query = "select a from Admin a"
				+ " where a.username = '"+ username
				+ "' AND a.password = '" + password + "'";
		return getHibernateTemplate().find(query).size() > 0;
	}
}
