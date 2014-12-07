package nigellus.bookstore.business;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import nigellus.bookstore.dao.AdminDAO;
import nigellus.bookstore.dao.BookDAO;
import nigellus.bookstore.dao.CategoryDAO;
import nigellus.bookstore.dao.CustomerDAO;
import nigellus.bookstore.dao.OrderDAO;
import nigellus.bookstore.dao.OrderDetailDAO;
import nigellus.bookstore.dao.PromotionDAO;
import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;
import nigellus.bookstore.entity.Customer;
import nigellus.bookstore.entity.Order;
import nigellus.bookstore.entity.OrderDetail;
import nigellus.bookstore.entity.Promotion;
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
	
	@Autowired
	private PromotionDAO promotionDAO;

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

	public List<Category> getSelectedCateById(String[] selectedCateId) {
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
	
	public List<Category> getSelectedCateByName(String[] selectedCateName) {
		List<Category> selCates = new ArrayList<Category>();
		List<Category> categories = categoryDAO.getCategoryList();

		for (String cateName : selectedCateName) {
			for (Category category : categories) {
				if (category.getName().equals(cateName)) {
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
	
	public List<Category> getCategoryList() {
		return categoryDAO.getCategoryList();

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
	
	public Order getOrderByCode(String code) {
		return orderDAO.getOrderByCode(code);
	}

	public List<Order> getOrderList() {
		return orderDAO.getOrder();
	}
	
	public List<Promotion> getPromotionList() {
		return promotionDAO.getPromotionList();
	}
	
	public List<Book> getBookList() {
		return bookDAO.getBookList("", "");
	}

	public List<Order> getOrderListMonthly(int month, int year) {
		return orderDAO.getOrderMonthly(month, year);
	}
	
	public List<OrderDetail> getOrderDetail(int orderId) {
		return orderDetailDAO.getDetailById(orderId);
	}
	
	public Promotion getPromoteByCode(String code) {
		return promotionDAO.getPromotionByCode(code);
	}

	public Promotion getPromoteById(int id) {
		return promotionDAO.getPromotionById(id);
	}
	
	public void addPromotion(Promotion promote) {
		promotionDAO.addPromotion(promote);
	}
	
	public void updatePromotion(Promotion promote) {
		promotionDAO.updatePromotion(promote);
	}
	
	public void deletePromotion(String code) {
		promotionDAO.deletePromotion(code);
	}
	
	public void sendConfirmEmail(String email, String code) {
		Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        Session mailSession = Session.getInstance(props, new Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("icecreamweb2013@gmail.com", "voyygkkgbeqepgbw");
            }
        });
        
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress("icecreamweb2013@gmail.com"));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(email));

            // Set Subject: header field
            message.setSubject("[Nigellus Bookstore] Confirm order");

            // Now set the actual message
            message.setText("Your order confirmation code is: " + code);

            // Send message
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
	}
	
	public void sendRecoveredPassword(String email, String password) {
		Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        Session mailSession = Session.getInstance(props, new Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("icecreamweb2013@gmail.com", "voyygkkgbeqepgbw");
            }
        });
        
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress("icecreamweb2013@gmail.com"));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(email));

            // Set Subject: header field
            message.setSubject("[Nigellus Bookstore] Password Recovery");

            // Now set the actual message
            message.setText("Your order confirmation code is: " + password);

            // Send message
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
	}
}
