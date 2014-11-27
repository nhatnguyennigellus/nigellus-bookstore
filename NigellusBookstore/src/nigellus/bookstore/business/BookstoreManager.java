package nigellus.bookstore.business;

import java.util.Iterator;
import java.util.List;

import nigellus.bookstore.dao.BookDAO;
import nigellus.bookstore.dao.CategoryDAO;
import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;
import nigellus.bookstore.model.BookstoreModel;

import org.springframework.beans.factory.annotation.Autowired;

public class BookstoreManager {
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private BookDAO bookDAO;
	
	public void getCategoryInfo(BookstoreModel storeModel) {
		Category selectedCategory = storeModel.getSelectedCategory();
		List<Category> categories = categoryDAO.getBatchList();
		if (selectedCategory != null) {
			Integer cateId = selectedCategory.getId();
			for (Category category : categories) {
				if (category.getId().equals(cateId)) {
					selectedCategory = category;
					break;
				}
			}
		} else {
			selectedCategory = categories.get(0);
		}
		storeModel.setCategories(categories);
		storeModel.setSelectedCategory(selectedCategory);
	}
	
	public void getBookInfo(BookstoreModel storeModel) {
		List<Book> books = bookDAO.getBookList();
		storeModel.setBooks(books);
	}

	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public BookDAO getBookDAO() {
		return bookDAO;
	}

	public void setBookDAO(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	} 
	
	public void addCategory(Category category) {
		categoryDAO.addCategory(category);
	}
	
	public void addBook(Category category, Book book) {
		book.setCategory(category);
		bookDAO.addBook(book);
	}
}
