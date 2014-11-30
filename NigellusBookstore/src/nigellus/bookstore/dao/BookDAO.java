package nigellus.bookstore.dao;

import java.util.List;

import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BookDAO extends HibernateDaoSupport {
	public void addBook(Book book) {
		getHibernateTemplate().save(book);
	}

	public void updateBook(Book book) {
		getHibernateTemplate().update(book);
	}
	
	public void deleteBook(int id) {
		getHibernateTemplate().delete(getBook(id));
	}
	@SuppressWarnings("unchecked")
	public List<Book> getBookList(String key) {

		String query = "select b from Book b where b.title like '%" + key + "%'";
		return getHibernateTemplate().find(query);
	}
	
	public Book getBook(int id) {

		String query = "select b from Book b where b.id = " + id;
		return (Book) getHibernateTemplate().find(query).get(0);
	}
}
