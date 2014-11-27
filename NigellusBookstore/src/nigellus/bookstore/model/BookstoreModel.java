package nigellus.bookstore.model;

import java.util.List;

import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;

public class BookstoreModel {
	private Category selectedCategory;
	private List<Category> categories;
	private List<Book> books;

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public Category getSelectedCategory() {
		return selectedCategory;
	}

	public void setSelectedCategory(Category selectedCategory) {
		this.selectedCategory = selectedCategory;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
}
