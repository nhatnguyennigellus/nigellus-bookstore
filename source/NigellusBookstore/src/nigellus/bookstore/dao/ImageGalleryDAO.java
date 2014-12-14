package nigellus.bookstore.dao;

import java.awt.Image;
import java.util.List;

import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.ImageGallery;
import nigellus.bookstore.entity.OrderDetail;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class ImageGalleryDAO extends HibernateDaoSupport {
	public void addImage(ImageGallery image) {
		getHibernateTemplate().save(image);
	}
	
	@SuppressWarnings("unchecked")
	public List<ImageGallery> getImageGalleryBook(int bookId) {
		String query = "select g from ImageGallery g "
				+ "where g.book.id = " + bookId;
		return getHibernateTemplate().find(query);
	}
	
	@SuppressWarnings("unchecked")
	public List<ImageGallery> getImageGallery() {
		String query = "select g from ImageGallery g";
		return getHibernateTemplate().find(query);
	}
	
	public void deleteImage(int id) {
		getHibernateTemplate().delete(getImage(id));
	}
	
	public ImageGallery getImage(int id) {

		String query = "select i from ImageGallery i where i.id = " + id;
		return (ImageGallery) getHibernateTemplate().find(query).get(0);
	}
}
