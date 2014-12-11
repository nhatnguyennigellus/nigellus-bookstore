package nigellus.bookstore.dao;

import java.util.List;

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
}
