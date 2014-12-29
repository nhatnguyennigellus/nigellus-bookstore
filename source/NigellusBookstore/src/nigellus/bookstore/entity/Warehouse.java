package nigellus.bookstore.entity;

import java.util.Date;

public class Warehouse {
	private Integer Id;
	private Date dateWarehousing;
	private Integer quantityWarehousing;
	private Book book;
	
	public Warehouse() {
		// TODO Auto-generated constructor stub
	}

	public Warehouse(Date dateWarehousing,
			Integer quantityWarehousing, Book book) {
		this.dateWarehousing = dateWarehousing;
		this.quantityWarehousing = quantityWarehousing;
		this.book = book;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Date getDateWarehousing() {
		return dateWarehousing;
	}

	public void setDateWarehousing(Date dateWarehousing) {
		this.dateWarehousing = dateWarehousing;
	}

	public Integer getQuantityWarehousing() {
		return quantityWarehousing;
	}

	public void setQuantityWarehousing(Integer quantityWarehousing) {
		this.quantityWarehousing = quantityWarehousing;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
	
}
