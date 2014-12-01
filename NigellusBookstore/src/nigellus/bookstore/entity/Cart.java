package nigellus.bookstore.entity;

public class Cart {
	private Book book;
	private int quantity;
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	
	public Cart(Book book, int quantity) {
		super();
		this.book = book;
		this.quantity = quantity;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
}
