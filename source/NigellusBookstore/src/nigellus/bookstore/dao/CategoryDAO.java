package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CategoryDAO extends HibernateDaoSupport{
	@SuppressWarnings("unchecked")
	public List<Category> getCategoryList() {
		String query = "select c from Category c";
		return getHibernateTemplate().find(query);
	}

	public void addCategory(Category category) {
		getHibernateTemplate().save(category);
	}
	
	public Category getCategoryById(int id) {
		String query = "select c from Category c "
				+ "where c.id = " + id;
		return (Category) getHibernateTemplate().find(query).get(0);
	}
}
