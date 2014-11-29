package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BookDAO extends HibernateDaoSupport {
	public void addBook(Book book) {
		getHibernateTemplate().save(book);
	}

	@SuppressWarnings("unchecked")
	public List<Book> getBookList(String key) {

		String query = "select b from Book b where b.title like '%" + key + "%'";
/*
		if (!key.equals("")) {
			query += " like '%" + key + "%'";
		}*/
		return getHibernateTemplate().find(query);
	}
}
