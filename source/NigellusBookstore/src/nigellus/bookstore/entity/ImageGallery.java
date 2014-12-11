package nigellus.bookstore.entity;

public class ImageGallery {
	private Integer id;
	private Book book;
	private String imageUrl;
	
	public ImageGallery() {
		// TODO Auto-generated constructor stub
	}

	public ImageGallery(Integer id, Book book, String imageUrl) {
		super();
		this.id = id;
		this.book = book;
		this.imageUrl = imageUrl;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
}
