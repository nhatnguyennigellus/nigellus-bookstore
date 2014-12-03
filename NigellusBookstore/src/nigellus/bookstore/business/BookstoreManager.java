package nigellus.bookstore.business;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import nigellus.bookstore.dao.AdminDAO;
import nigellus.bookstore.dao.BookDAO;
import nigellus.bookstore.dao.CategoryDAO;
import nigellus.bookstore.dao.CustomerDAO;
import nigellus.bookstore.dao.OrderDAO;
import nigellus.bookstore.dao.OrderDetailDAO;
import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;
import nigellus.bookstore.entity.Customer;
import nigellus.bookstore.entity.Order;
import nigellus.bookstore.entity.OrderDetail;
import nigellus.bookstore.model.AddBookModel;
import nigellus.bookstore.model.BookstoreModel;
import nigellus.bookstore.model.LoginModel;

import org.springframework.beans.factory.annotation.Autowired;

public class BookstoreManager {
	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private BookDAO bookDAO;

	@Autowired
	private AdminDAO adminDAO;

	@Autowired
	private CustomerDAO customerDAO;

	@Autowired
	private OrderDAO orderDAO;

	public OrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	public OrderDetailDAO getOrderDetailDAO() {
		return orderDetailDAO;
	}

	public void setOrderDetailDAO(OrderDetailDAO orderDetailDAO) {
		this.orderDetailDAO = orderDetailDAO;
	}

	@Autowired
	private OrderDetailDAO orderDetailDAO;

	public CustomerDAO getCustomerDAO() {
		return customerDAO;
	}

	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	public boolean adminLogin(LoginModel adLogModel) {
		if (adminDAO.isAuthenticated(adLogModel.getUsername(),
				adLogModel.getPassword())) {
			return true;
		}
		return false;

	}

	public boolean customerLogin(LoginModel cusLogModel) {
		if (customerDAO.isAuthenticated(cusLogModel.getUsername(),
				cusLogModel.getPassword())) {
			return true;
		}
		return false;

	}

	public boolean existedUsername(String username) {
		return customerDAO.existedUsername(username);
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
		List<Category> selCates = new ArrayList<Category>();
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

	public List<Customer> getCustomerList() {
		return customerDAO.getCustomerList();

	}

	public void getCategoryList(AddBookModel addBookModel) {
		List<Category> categories = categoryDAO.getCategoryList();
		addBookModel.setCategories(categories);
	}

	public void getBookInfo(BookstoreModel storeModel, String key, String author) {
		List<Book> books = bookDAO.getBookList(key, author);
		storeModel.setBooks(books);
	}

	public void getAvailableBookInfo(BookstoreModel storeModel, String key,
			String author) {
		List<Book> books = bookDAO.getAvailableBookList(key, author);
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

	public Book getBookById(int id) {
		return bookDAO.getBook(id);
	}

	public Customer getCustomerInfo(String username) {
		return customerDAO.getCustomerInfo(username);
	}

	public void updateBook(Book book) {
		bookDAO.updateBook(book);
	}

	public void deleteBook(int id) {
		bookDAO.deleteBook(id);
	}

	public void updateBook(List<Category> selectedCategories, Book book) {
		book.setCategories(new HashSet<Category>(selectedCategories));
		bookDAO.updateBook(book);
	}

	public void addBook(List<Category> selectedCategories, Book book) {
		book.setCategories(new HashSet<Category>(selectedCategories));
		bookDAO.addBook(book);
	}

	public void addCustomer(Customer customer, String username) {
		customerDAO.addCustomer(customer, username);
	}

	public void updateCustomer(Customer customer) {
		customerDAO.updateCustomer(customer);
	}

	public void updateOrder(Order order) {
		orderDAO.updateOrder(order);
	}

	public void submitOrder(Order order, List<OrderDetail> lstDetail) {
		orderDAO.addOrder(order);
		for (OrderDetail orderDetail : lstDetail) {
			orderDetailDAO.addDetail(orderDetail);
		}
	}

	public List<Order> getOrderByUser(String username) {
		return orderDAO.getOrderByUser(username);
	}

	public Order getOrderById(int id) {
		return orderDAO.getOrderById(id);
	}

	public List<Order> getOrderList() {
		return orderDAO.getOrder();
	}

	public List<Order> getOrderListMonthly(int month, int year) {
		return orderDAO.getOrderMonthly(month, year);
	}
	
	public List<OrderDetail> getOrderDetail(int orderId) {
		return orderDetailDAO.getDetailById(orderId);
	}
}
