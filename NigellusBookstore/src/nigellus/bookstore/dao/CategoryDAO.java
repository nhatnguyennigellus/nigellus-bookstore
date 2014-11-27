package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Category;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CategoryDAO extends HibernateDaoSupport{
	@SuppressWarnings("unchecked")
	public List<Category> getBatchList() {
		String query = "select c from Category c";
		return getHibernateTemplate().find(query);
	}

	public void addCategory(Category category) {
		getHibernateTemplate().save(category);
	}
}
