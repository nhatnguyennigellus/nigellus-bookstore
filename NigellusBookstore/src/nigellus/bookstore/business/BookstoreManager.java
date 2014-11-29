package nigellus.bookstore.business;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import nigellus.bookstore.dao.AdminDAO;
import nigellus.bookstore.dao.BookDAO;
import nigellus.bookstore.dao.CategoryDAO;
import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;
import nigellus.bookstore.model.AddBookModel;
import nigellus.bookstore.model.AdminLoginModel;
import nigellus.bookstore.model.BookstoreModel;

import org.springframework.beans.factory.annotation.Autowired;

public class BookstoreManager {
	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private BookDAO bookDAO;

	@Autowired
	private AdminDAO adminDAO;

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	public boolean adminLogin(AdminLoginModel adLogModel) {

		if (adminDAO.isAuthenticated(adLogModel.getUsername(),
				adLogModel.getPassword())) {
			return true;
		}
		return false;

	}

	public void getCategoryInfo(BookstoreModel storeModel) {
		Category selectedCategory = storeModel.getSelectedCategory();
		List<Category> categories = categoryDAO.getCategoryList();
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
	
	public List<Category> getSelectedCateList(String[] selectedCateId) {
		List<Category> selCates = new ArrayList<Category>() ;
		List<Category> categories = categoryDAO.getCategoryList();
		
		for (String cateID : selectedCateId) {
			int id = Integer.parseInt(cateID);
			for (Category category : categories) {
				if (category.getId() == id) {
					selCates.add(category);
					break;
				}
			}
		}
		
		return selCates;
	}
/*
	public void getCategoryInfo(AddBookModel addBookModel) {
		List<Category> selectedCategories = addBookModel
				.getSelectedCategories();
		List<Category> categories = categoryDAO.getCategoryList();
		if (selectedCategories != null) {
			for (Category selCate : categories) {

				Integer cateId = selCate.getId();
				for (Category category : categories) {
					if (category.getId().equals(cateId)) {
						selCate = category;
						break;
					}
				}

			}

		} else {

		}
		addBookModel.setCategories(categories);
		addBookModel.setSelectedCategories(selectedCategories);
	}
*/
	public void getCategoryList(AddBookModel addBookModel) {
		List<Category> categories = categoryDAO.getCategoryList();
		addBookModel.setCategories(categories);
	}

	public void getBookInfo(BookstoreModel storeModel, String key) {
		List<Book> books = bookDAO.getBookList(key);
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

	public void addBook(List<Category> selectedCategories, Book book) {
		book.setCategories(new HashSet<Category>(selectedCategories));
		bookDAO.addBook(book);
	}
}
