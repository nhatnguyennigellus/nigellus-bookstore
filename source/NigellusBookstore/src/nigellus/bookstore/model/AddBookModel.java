package nigellus.bookstore.model;

import java.util.List;

import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;

public class AddBookModel {
	private List<Category> categories;
	private List<Category> selectedCategories;
	private Book book;

	public List<Category> getSelectedCategories() {
		return selectedCategories;
	}

	public void setSelectedCategories(List<Category> selectedCategories) {
		this.selectedCategories = selectedCategories;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		book.setImageUrl("/resources/images/noimage.png");
		this.book = book;
	}

}
