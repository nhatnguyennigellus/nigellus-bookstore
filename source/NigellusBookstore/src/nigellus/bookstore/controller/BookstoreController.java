package nigellus.bookstore.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.awt.Image;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nigellus.bookstore.business.BookstoreManager;
import nigellus.bookstore.dao.CartDAO;
import nigellus.bookstore.dao.CategoryDAO;
import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Cart;
import nigellus.bookstore.entity.Category;
import nigellus.bookstore.entity.Customer;
import nigellus.bookstore.entity.ImageGallery;
import nigellus.bookstore.entity.Order;
import nigellus.bookstore.entity.OrderConfig;
import nigellus.bookstore.entity.OrderDetail;
import nigellus.bookstore.entity.OrderPromotion;
import nigellus.bookstore.entity.Promotion;
import nigellus.bookstore.entity.Warehouse;
import nigellus.bookstore.model.AddCategoryModel;
import nigellus.bookstore.model.BookstoreModel;
import nigellus.bookstore.model.LoginModel;
import nigellus.bookstore.reports.ReportManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookstoreController {
	@Autowired
	private BookstoreManager storeManager;

	public BookstoreManager getStoreManager() {
		return storeManager;
	}

	public void setStoreManager(BookstoreManager storeManager) {
		this.storeManager = storeManager;
	}
	
	@Autowired
	private ReportManagement reportManager;

	public ReportManagement getReportManager() {
		return reportManager;
	}

	public void setReportManager(ReportManagement reportManager) {
		this.reportManager = reportManager;
	}

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request) {
		request.getSession().removeAttribute("changePassError");
		request.getSession().removeAttribute("changePassSuccess");
		request.getSession().removeAttribute("registerSuccess");
		request.getSession().removeAttribute("registerFail");
		request.getSession().removeAttribute("editProfileSuccess");
		request.getSession().removeAttribute("passRecovered");
		request.getSession().removeAttribute("usernameError");
		request.getSession().removeAttribute("ChangeImgError");

		// BookDAO daoBook = new BookDAO();
		List<Book> lstBook = storeManager.getBookList();

		CategoryDAO daoCate = storeManager.getCategoryDAO();
		List<Category> lstCate = daoCate.getCategoryList();
		request.getSession().setAttribute("BOOKINDEX", lstBook);
		request.getSession().setAttribute("CATEINDEX", lstCate);
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact(HttpServletRequest request) {
		return new ModelAndView("contact");
	}

	@RequestMapping(value = "/about")
	public ModelAndView about(HttpServletRequest request) {
		return new ModelAndView("about");
	}

	@RequestMapping(value = "/term")
	public ModelAndView term(HttpServletRequest request) {
		return new ModelAndView("term");
	}

	@RequestMapping(value = "/admin")
	public ModelAndView admin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (request.getParameter("rp") == null) {
			session.removeAttribute("ReportNoti");
		}
		session.removeAttribute("uploadSuccess");
		session.removeAttribute("addBookSuccess");
		session.removeAttribute("changeImgSuccess");
		session.removeAttribute("ChangeImgError");
		session.removeAttribute("exportBookSuccess");
		session.removeAttribute("exportCateSuccess");
		session.removeAttribute("addPromoteSuccess");
		session.removeAttribute("updatePromoteSuccess");
		session.removeAttribute("configSuccess");
		if (session.getAttribute("admin") != null) {
			session.setAttribute("CusNo", storeManager.getCustomerList().size());
			session.setAttribute("BookNo", storeManager.getBookList().size());
			session.setAttribute("OrderNo", storeManager.getOrderList().size());
			session.setAttribute("CouponNo", storeManager.getPromotionList().size());
			session.setAttribute("CateNo", storeManager.getCategoryList().size());
			session.setAttribute("Stock", storeManager.getStockSum());
				
		}
		return new ModelAndView("admin");
	}

	@RequestMapping(value = "/accessDeniedAd")
	public String accessDeniedAd() {
		return "redirect:accessDeniedAd";
	}

	@RequestMapping(value = "/toChangeImage")
	public ModelAndView toChangeImage(HttpServletRequest request) {
		request.getSession().removeAttribute("uploadSuccess");
		request.getSession().removeAttribute("addBookSuccess");
		request.getSession().removeAttribute("changeImgSuccess");
		request.getSession().removeAttribute("exportBookSuccess");
		request.getSession().removeAttribute("exportCateSuccess");
		request.getSession().removeAttribute("addPromoteSuccess");
		request.getSession().removeAttribute("updatePromoteSuccess");
		request.getSession().removeAttribute("ChangeImgError");
		return new ModelAndView("changeImage");
	}

	@RequestMapping(value = "/orderSuccess")
	public ModelAndView orderSuccess() {
		return new ModelAndView("orderSuccess");
	}

	@RequestMapping(value = "/toRegister")
	public ModelAndView toRegister(HttpServletRequest request) {
		if (request.getSession().getAttribute("customer") != null) {
			return new ModelAndView("index");
		}
		return new ModelAndView("register");
	}

	@RequestMapping(value = "/uploadSuccess")
	public ModelAndView uploadSuccess() {
		return new ModelAndView("uploadSuccess");
	}

	@RequestMapping(value = "/login", method = GET)
	public String login(@RequestParam("user") String username,
			@RequestParam("pass") String password, LoginModel adLogModel,
			HttpServletRequest request) {

		adLogModel.setUsername(username);
		adLogModel.setPassword(password);
		if (storeManager.adminLogin(adLogModel)) {
			request.getSession()
					.setAttribute("admin", adLogModel.getUsername());
			request.getSession().removeAttribute("adminLoginErr");

		} else {
			request.getSession().setAttribute("adminLoginErr", "Invalid login");
		}
		return "redirect:admin";

	}

	@RequestMapping(value = "/loginUser", method = GET)
	public String loginUser(@RequestParam("user") String username,
			@RequestParam("pass") String password, LoginModel cusLogModel,
			HttpServletRequest request) {

		cusLogModel.setUsername(username);
		cusLogModel.setPassword(password);
		if (storeManager.customerLogin(cusLogModel)) {
			request.getSession().setAttribute("customer",
					cusLogModel.getUsername());
			request.getSession().removeAttribute("customerLoginErr");

		} else {
			request.getSession().setAttribute("customerLoginErr",
					"Invalid login");
		}
		return "redirect:index";

	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:admin";
	}

	@RequestMapping(value = "/logoutUser")
	public String logoutUser(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:index";
	}

	@RequestMapping(value = "/viewCategories")
	public ModelAndView viewCategories(BookstoreModel storeModel,
			HttpServletRequest request) {
		request.getSession().removeAttribute("uploadSuccess");
		request.getSession().removeAttribute("addBookSuccess");
		request.getSession().removeAttribute("changeImgSuccess");
		request.getSession().removeAttribute("addPromoteSuccess");
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		ModelAndView mav = new ModelAndView("viewCategories", "model",
				storeModel);
		storeManager.getCategoryInfo(storeModel);
		if (request.getSession().getAttribute("addCategorySuccess") != null) {
			request.getSession().removeAttribute("addCategorySuccess");
		}
		if (request.getSession().getAttribute("addBookSuccess") != null) {
			request.getSession().removeAttribute("addBookSuccess");
		}
		return mav;
	}

	@RequestMapping(value = "/CustomerViewCategories")
	public ModelAndView customerViewCategories(BookstoreModel storeModel,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("CustomerViewCategories", "model",
				storeModel);
		storeManager.getCategoryInfo(storeModel);
		List<ImageGallery> gallery = storeManager.getImageGallery();
		request.getSession().setAttribute("GALLERY", gallery);
		return mav;

	}

	@RequestMapping(value = "/customerViewBookCategories")
	public ModelAndView customerViewBookCategories(BookstoreModel storeModel,
			HttpServletRequest request) {

		int id = Integer.parseInt(request.getParameter("id"));
		ModelAndView mav = new ModelAndView("CustomerViewCategories", "model",
				storeModel);
		storeManager.getCategoryInfo(storeModel, id);
		List<ImageGallery> gallery = storeManager.getImageGallery();
		request.getSession().setAttribute("GALLERY", gallery);
		return mav;
	}

	@RequestMapping(value = "/addCategory")
	public ModelAndView addCategory(AddCategoryModel addCategoryModel,
			HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		ModelAndView mav = new ModelAndView("addCategory", "model",
				addCategoryModel);
		Category category = addCategoryModel.getCategory();

		if (category == null) {
			addCategoryModel.setCategory(new Category());
		} else {
			storeManager.addCategory(category);
			request.getSession().setAttribute("addCategorySuccess",
					"Added category successfully!");
		}
		return mav;
	}

	@RequestMapping(value = "/toAddImage")
	public ModelAndView toAddImage(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		int id = Integer.parseInt(request.getParameter("id"));
		List<ImageGallery> list = storeManager.getImageGalleryBook(id);
		request.getSession().setAttribute("BOOKIMAGES", list);
		return new ModelAndView("addImage");
	}

	@RequestMapping(value = "/addImage")
	public String addImage(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return "redirect:accessDeniedAd";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		if (!file.isEmpty()) {
			StringBuffer buffer = new StringBuffer();
			String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
			for (int i = 0; i < 15; i++) {
				double index = Math.random() * characters.length();
				buffer.append(characters.charAt((int) index));

			}
			String imageName = buffer.toString();
			try {
				byte[] bytes = file.getBytes();
				File serverFile = new File(request.getSession()
						.getServletContext().getRealPath("/resources/images")
						+ File.separator
						+ imageName
						+ file.getOriginalFilename().substring(
								file.getOriginalFilename().lastIndexOf(".")));

				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				Book b = storeManager.getBookById(id);
				ImageGallery image = new ImageGallery();
				image.setBook(b);
				image.setImageUrl("/resources/images/"
						+ imageName
						+ file.getOriginalFilename().substring(
								file.getOriginalFilename().lastIndexOf(".")));

				storeManager.addImageToGallery(image);

				request.getSession().removeAttribute("ChangeImgError");
				request.getSession().setAttribute("ChangeImgSuccess",
						"Uploaded successfully!");
			} catch (Exception e) {
				request.getSession().setAttribute("ChangeImgError",
						"Failed to upload!");
				request.getSession().removeAttribute("ChangeImgSuccess");
				e.printStackTrace();
			}
		} else {
			request.getSession().removeAttribute("ChangeImgSuccess");
			request.getSession().setAttribute("ChangeImgError",
					"File was empty!");
		}

		return "redirect:uploadSuccess";
	}

	@RequestMapping(value = "/importCSV", method = RequestMethod.POST)
	public String importCSV(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		if (!file.isEmpty()) {
			BufferedReader br = null;
			String line = "";

			try {
				InputStream inputStream = file.getInputStream();
				br = new BufferedReader(new InputStreamReader(inputStream));
				while ((line = br.readLine()) != null) {
					line = line.substring(1, line.length() - 1);
					String[] bookData = line.split(",");
					String title = bookData[0];
					float unitPrice = Float.parseFloat(bookData[1]);

					String description = bookData[2];
					String authorList = bookData[3];
					String imageUrl = bookData[4];
					String categories = bookData[5];
					String[] category = categories.split(";");

					List<Category> selCates = storeManager
							.getSelectedCateByName(category);
					System.out.println(categories);
					System.out.println(category.length);
					Book book = new Book();
					book.setTitle(title);
					book.setUnitPrice(unitPrice);
					book.setDescription(description);
					book.setAuthorList(authorList);
					book.setImageUrl(imageUrl);
					book.setStatus(1);

					storeManager.addBook(selCates, book);
					request.getSession().removeAttribute("csvError");
					request.getSession().setAttribute("addBookSuccess",
							"Imported books successfully!");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.getSession().setAttribute("csvError",
						"Import error: " + e.getMessage());
			}
		} else {
			request.getSession().removeAttribute("csvError");
			request.getSession().setAttribute("csvError", "File was empty!");
		}
		return "redirect:toAddBook";
	}

	@RequestMapping(value = "/importCSVCate", method = RequestMethod.POST)
	public String importCSVCate(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		if (!file.isEmpty()) {
			BufferedReader br = null;
			String line = "";

			try {
				InputStream inputStream = file.getInputStream();
				br = new BufferedReader(new InputStreamReader(inputStream));
				while ((line = br.readLine()) != null) {
					// line = line.substring(1, line.length() - 1);
					String[] cateData = line.split(",");
					String name = cateData[0];
					String description = cateData[1];

					Category cate = new Category();
					cate.setName(name);
					cate.setDescription(description);
					storeManager.addCategory(cate);

					request.getSession().removeAttribute("csvError");
					request.getSession().setAttribute("addCategorySuccess",
							"Imported category successfully!");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.getSession().setAttribute("csvError",
						"Import error: " + e.getMessage());
			}
		} else {
			request.getSession().removeAttribute("csvError");
			request.getSession().setAttribute("csvError", "File was empty!");
		}
		return "redirect:addCategory";
	}
	

	@RequestMapping(value = "/exportCSV")
	public String exportCSV(HttpServletRequest request) {
		try {
			FileWriter writer = new FileWriter("D:\\Books.csv");
			List<Book> list = storeManager.getBookList();
			for (Book book : list) {
				writer.append(book.getTitle() + ",");
				writer.append(book.getUnitPrice() + ",");
				writer.append(book.getDescription() + ",");
				writer.append(book.getAuthorList() + ",");
				writer.append(book.getImageUrl() + ",");
				List<Category> listCate = new ArrayList<Category>(
						book.getCategories());
				for (Category c : listCate) {
					writer.append(c.getName());
					if (listCate.indexOf(c) != listCate.size() - 1) {
						writer.append(";");
					}
				}
				writer.append("\n");
			}
			writer.flush();
			writer.close();
			request.getSession().setAttribute("exportBookSuccess",
					"Exported data successfully!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:viewBooks?key=&author=";
	}

	@RequestMapping(value = "/exportCSVCate")
	public String exportCSVCate(HttpServletRequest request) {
		try {
			FileWriter writer = new FileWriter("D:\\Categories.csv");
			List<Category> list = storeManager.getCategoryList();
			for (Category cate : list) {
				writer.append(cate.getName() + ",");
				writer.append(cate.getDescription());
				writer.append("\n");
			}
			writer.flush();
			writer.close();
			request.getSession().setAttribute("exportCateSuccess",
					"Exported data successfully!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:viewCategories";
	}

	@RequestMapping(value = "/changeImage", method = RequestMethod.POST)
	public String changeImage(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		if (!file.isEmpty()) {
			StringBuffer buffer = new StringBuffer();
			String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
			for (int i = 0; i < 15; i++) {
				double index = Math.random() * characters.length();
				buffer.append(characters.charAt((int) index));

			}
			String imageName = buffer.toString();
			try {
				byte[] bytes = file.getBytes();
				File serverFile = new File(request.getSession()
						.getServletContext().getRealPath("/resources/images")
						+ File.separator
						+ imageName
						+ file.getOriginalFilename().substring(
								file.getOriginalFilename().lastIndexOf(".")));

				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				int id = Integer.parseInt(request.getParameter("id"));

				Book b = storeManager.getBookById(id);
				System.out.println(id);
				b.setImageUrl("/resources/images/"
						+ imageName
						+ file.getOriginalFilename().substring(
								file.getOriginalFilename().lastIndexOf(".")));

				storeManager.updateBook(b);

				request.getSession().removeAttribute("ChangeImgError");
				request.getSession().setAttribute("ChangeImgSuccess",
						"Uploaded successfully!");
			} catch (Exception e) {
				request.getSession().setAttribute("ChangeImgError",
						"Failed to upload!");
				request.getSession().removeAttribute("ChangeImgSuccess");
				e.printStackTrace();
			}
		} else {
			request.getSession().removeAttribute("ChangeImgSuccess");
			request.getSession().setAttribute("ChangeImgError",
					"File was empty!");
		}

		return "redirect:uploadSuccess";
	}

	@RequestMapping(value = "/addBook")
	public ModelAndView addBook(HttpServletRequest request) {
		String title = request.getParameter("title");

		float price = Float.parseFloat(request.getParameter("unitPrice"));
		String author = request.getParameter("authorList");
		String description = request.getParameter("description");
		String[] selectedCateId = request.getParameterValues("selectedCate");

		Book book = new Book();
		book.setTitle(title);
		book.setAuthorList(author);
		book.setUnitPrice(price);
		book.setImageUrl("/resources/images/noimage.png");
		book.setDescription(description);
		book.setQuantity(0);
		book.setStatus(1);
		List<Category> selCates = storeManager
				.getSelectedCateById(selectedCateId);
		storeManager.addBook(selCates, book);
		request.getSession().setAttribute("addBookSuccess",
				"Added book successfully!");
		return new ModelAndView("addBook");
	}

	@RequestMapping(value = "/register")
	public ModelAndView register(HttpServletRequest request) {
		if (request.getSession().getAttribute("customer") != null) {
			return new ModelAndView("index");
		}
		String username = request.getParameter("username");
		if (storeManager.existedUsername(username)) {
			request.getSession().setAttribute("registerFail",
					"This username has already been used!");
		} else {
			String fullname = request.getParameter("fullname");
			String password = request.getParameter("password");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");

			Customer customer = new Customer();

			customer.setPassword(password);
			customer.setFullname(fullname);
			customer.setAddress(address);
			customer.setEmail(email);
			customer.setPhone(phone);
			customer.setUsername(username);
			storeManager.addCustomer(customer, username);
			request.getSession().removeAttribute("registerFail");
			request.getSession().setAttribute(
					"registerSuccess",
					"Account registered successfully! \nYou can login using username"
							+ " and password.");
		}

		return toRegister(request);
	}

	@RequestMapping(value = "/toEditProfile")
	public ModelAndView toEditProfile(HttpServletRequest request,
			BookstoreModel storeModel) {
		if (request.getSession().getAttribute("customer") == null) {
			return new ModelAndView("accessDenied");
		}
		String username = (String) request.getSession()
				.getAttribute("customer");
		Customer c = storeManager.getCustomerInfo(username);
		request.getSession().setAttribute("CUSTOMER", c);
		return new ModelAndView("editProfile");
	}

	@RequestMapping(value = "/editProfile")
	public ModelAndView editProfile(HttpServletRequest request,
			BookstoreModel storeModel) {
		if (request.getSession().getAttribute("customer") == null) {
			return new ModelAndView("accessDenied");
		}
		String username = (String) request.getSession()
				.getAttribute("customer");
		Customer c = storeManager.getCustomerInfo(username);

		String fullname = request.getParameter("fullname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		c.setAddress(address);
		c.setEmail(email);
		c.setFullname(fullname);
		c.setPhone(phone);

		storeManager.updateCustomer(c);
		request.getSession().setAttribute("editProfileSuccess",
				"Profile updated successfully!");
		return new ModelAndView("editProfile");
	}

	@RequestMapping(value = "/toChangePassword")
	public ModelAndView toChangePassword(HttpServletRequest request) {
		if (request.getSession().getAttribute("customer") == null) {
			return new ModelAndView("accessDenied");
		}
		String username = (String) request.getSession()
				.getAttribute("customer");
		Customer c = storeManager.getCustomerInfo(username);
		request.getSession().setAttribute("CUSTOMER", c);
		return new ModelAndView("changePassword");
	}

	@RequestMapping(value = "/changePassword")
	public ModelAndView changePassword(HttpServletRequest request,
			LoginModel cusLogModel) {
		if (request.getSession().getAttribute("customer") == null) {
			return new ModelAndView("accessDenied");
		}
		String username = (String) request.getSession()
				.getAttribute("customer");
		Customer c = storeManager.getCustomerInfo(username);

		String oldPass = request.getParameter("oldPassword");
		cusLogModel.setUsername(username);
		cusLogModel.setPassword(oldPass);
		if (!storeManager.customerLogin(cusLogModel)) {
			request.getSession().setAttribute("changePassError",
					"Invalid password!");

		} else {
			String newPass = request.getParameter("newPassword");
			c.setPassword(newPass);

			storeManager.updateCustomer(c);
			request.getSession().removeAttribute("changePassError");
			request.getSession().setAttribute("changePassSuccess",
					"Password changed successfully!");
		}

		return new ModelAndView("changePassword");
	}

	@RequestMapping(value = "/forgotPassword")
	public ModelAndView forgotPassword(HttpServletRequest request) {

		return new ModelAndView("forgotPassword");
	}

	@RequestMapping(value = "/recoverPassword")
	public ModelAndView recoverPassword(HttpServletRequest request) {
		String username = request.getParameter("username");
		Customer customer = storeManager.getCustomerInfo(username);
		if (customer == null) {
			request.getSession().setAttribute("usernameError",
					"This username does not exist!");

		} else {
			request.getSession().removeAttribute("usernameError");
			StringBuffer buffer = new StringBuffer();
			String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
			for (int i = 0; i < 20; i++) {
				double index = Math.random() * characters.length();
				buffer.append(characters.charAt((int) index));

			}
			String password = buffer.toString();
			customer.setPassword(password);
			storeManager.updateCustomer(customer);
			storeManager.sendRecoveredPassword(customer.getEmail(), password);
			request.getSession()
					.setAttribute("passRecovered",
							"Your new password has been sent via your registered email!");
		}
		return new ModelAndView("forgotPassword");
	}

	@RequestMapping(value = "/toAddBook")
	public ModelAndView toAddBook(HttpServletRequest request,
			BookstoreModel storeModel) {

		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		storeManager.getCategoryInfo(storeModel);
		request.getSession().setAttribute("categories",
				storeModel.getCategories());

		return new ModelAndView("addBook");
	}

	@RequestMapping(value = "/addPromotion")
	public ModelAndView addPromotion(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		String discountType = request.getParameter("type");
		float discountAmount = Float.parseFloat(request.getParameter("amount"));
		float conditionAmount = Float.parseFloat(request
				.getParameter("condition"));
		String description = request.getParameter("description");
		@SuppressWarnings("deprecation")
		Date dateStart = new Date(request.getParameter("start"));
		@SuppressWarnings("deprecation")
		Date dateEnd = new Date(request.getParameter("end"));

		StringBuffer buffer = new StringBuffer();
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		for (int i = 0; i < 25; i++) {
			double index = Math.random() * characters.length();
			buffer.append(characters.charAt((int) index));

		}
		String promotionCode = buffer.toString();

		Promotion promotion = new Promotion();
		promotion.setPromotionCode(promotionCode);
		promotion.setDiscountType(discountType);
		promotion.setDiscountAmount(discountAmount);
		promotion.setConditionAmount(conditionAmount);
		promotion.setStartDate(dateStart);
		promotion.setEndDate(dateEnd);
		promotion.setDescription(description);
		promotion.setStatus("Active");
		storeManager.addPromotion(promotion);
		request.getSession().setAttribute("addPromoteSuccess",
				"Added coupons successfully!");
		return new ModelAndView("addPromotion");
	}

	@RequestMapping(value = "/toUpdatePromotion")
	public ModelAndView toUpdatePromotion(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Promotion promotion = storeManager.getPromoteById(id);
		request.getSession().setAttribute("promotion", promotion);
		return new ModelAndView("updatePromotion");
	}

	@RequestMapping(value = "/updatePromotion")
	public ModelAndView updatePromotion(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String discountType = request.getParameter("type");
		float discountAmount = Float.parseFloat(request.getParameter("amount"));
		float conditionAmount = Float.parseFloat(request
				.getParameter("condition"));
		String description = request.getParameter("description");
		@SuppressWarnings("deprecation")
		Date dateStart = new Date(request.getParameter("startDate"));
		@SuppressWarnings("deprecation")
		Date dateEnd = new Date(request.getParameter("endDate"));
		String status = request.getParameter("status");
		Promotion promotion = storeManager.getPromoteById(id);
		promotion.setDiscountType(discountType);
		promotion.setDiscountAmount(discountAmount);
		promotion.setConditionAmount(conditionAmount);
		promotion.setStartDate(dateStart);
		promotion.setEndDate(dateEnd);
		promotion.setDescription(description);
		promotion.setStatus(status);

		storeManager.updatePromotion(promotion);
		request.getSession().setAttribute("updatePromoteSuccess",
				"Updated coupons successfully!");

		return new ModelAndView("updatePromotion");

	}

	@RequestMapping(value = "/toAddPromotion")
	public ModelAndView toAddPromotion(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		return new ModelAndView("addPromotion");
	}

	@RequestMapping(value = "/toAddBookImages")
	public ModelAndView toAddBookImages(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		return new ModelAndView("addBookImages");
	}

	@RequestMapping(value = "/toUpdateBook")
	public ModelAndView toUpdateBook(HttpServletRequest request,
			BookstoreModel storeModel) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		storeManager.getCategoryInfo(storeModel);
		request.getSession().setAttribute("categories",
				storeModel.getCategories());
		int id = Integer.parseInt(request.getParameter("id"));
		Book b = storeManager.getBookById(id);
		request.getSession().setAttribute("book", b);

		List<Category> selCates = new ArrayList<Category>(b.getCategories());
		List<String> selCatesName = new ArrayList<String>();

		for (Category c : selCates) {
			selCatesName.add(c.getName());
		}

		request.getSession().setAttribute("selCates", selCatesName);

		return new ModelAndView("updateBook");
	}

	@RequestMapping(value = "/updateBook")
	public String updateBook(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		float price = Float.parseFloat(request.getParameter("unitPrice"));
		String author = request.getParameter("authorList");
		String description = request.getParameter("description");
		String[] selectedCateId = request.getParameterValues("selectedCate");

		Book b = storeManager.getBookById(id);
		b.setTitle(title);
		b.setUnitPrice(price);
		b.setAuthorList(author);
		b.setDescription(description);
		List<Category> selCates = storeManager
				.getSelectedCateById(selectedCateId);
		storeManager.updateBook(selCates, b);
		request.getSession().setAttribute("updateBookSuccess",
				"Updated book successfully!");
		return "updateBook";
	}

	@RequestMapping(value = "/deleteBook")
	public String deleteBook(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		if (storeManager.bookOrdered(id)) {
			request.getSession().setAttribute("ChangeImgError",
					"Unable to remove books ordered!");
		} else {
			storeManager.deleteBook(id);
			request.getSession().removeAttribute("ChangeImgError");
			request.getSession().setAttribute("ChangeImgSuccess",
					"Removed book successfully!");
		}
		return "redirect:uploadSuccess";
	}

	@RequestMapping(value = "/deleteImage")
	public String deleteImage(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		storeManager.deleteImage(id);
		request.getSession().removeAttribute("ChangeImgError");
		request.getSession().setAttribute("ChangeImgSuccess",
				"Removed image successfully!");
		return "redirect:uploadSuccess";
	}

	@RequestMapping(value = "/viewBooks")
	public ModelAndView viewBooks(BookstoreModel storeModel,
			HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		ModelAndView mav = new ModelAndView("viewBooks", "model", storeModel);
		String key = request.getParameter("key");
		String author = request.getParameter("author");
		storeManager.getBookInfo(storeModel, key, author);
		request.getSession().removeAttribute("addCategorySuccess");
		request.getSession().removeAttribute("addBookSuccess");
		request.getSession().removeAttribute("updateBookSuccess");

		List<ImageGallery> gallery = storeManager.getImageGallery();
		request.getSession().setAttribute("GALLERY", gallery);
		return mav;
	}

	@RequestMapping(value = "/CustomerViewBooks")
	public ModelAndView customerViewBooks(BookstoreModel storeModel,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("CustomerViewBooks", "model",
				storeModel);
		String key = request.getParameter("key");
		String author = request.getParameter("author");
		storeManager.getBookInfo(storeModel, key, author);
		List<ImageGallery> gallery = storeManager.getImageGallery();
		request.getSession().setAttribute("GALLERY", gallery);
		return mav;
	}

	@RequestMapping(value = "/viewCart")
	public ModelAndView viewCart() {
		return new ModelAndView("viewCart");
	}

	@RequestMapping(value = "/removeFromCart")
	public ModelAndView removeFromCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<Cart> listCart = (List<Cart>) session.getAttribute("CART");
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		for (Cart cart : listCart) {
			if (cart.getBook().getId() == bookId) {
				listCart.remove(cart);
				break;
			}
		}
		CartDAO daoCart = new CartDAO();
		session.setAttribute("CART", listCart);
		session.setAttribute("totalAmount", daoCart.totalPrice(listCart));
		return viewCart();
	}

	@RequestMapping(value = "/addToCart")
	public ModelAndView addToCart(HttpServletRequest request) {

		HttpSession session = request.getSession();

		List<Cart> listCart = new ArrayList<Cart>();
		// cart empty a.k.a no cart
		// add new book to cart
		if (session.getAttribute("CART") == null) {
			Book book = new Book();
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			book = storeManager.getBookById(bookId);
			int quantity = 1;
			Cart cart = new Cart(book, quantity);
			listCart.add(cart);

			session.setAttribute("CART", listCart);
		} else {
			listCart = (List<Cart>) session.getAttribute("CART");
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			boolean isAvail = false;
			// consider if cart has the book
			for (Cart item : listCart) {
				// if yes
				if (item.getBook().getId() == bookId) {
					int quantity = -1;

					if (request.getParameter("quantity") != null) {
						quantity = Integer.parseInt(request
								.getParameter("quantity"));
					}

					else {
						quantity = item.getQuantity() + 1;
					}
					item.setQuantity(quantity);
					isAvail = true;
					break;
				}
			}

			if (!isAvail) {
				Book book = new Book();
				book = storeManager.getBookById(Integer.parseInt(request
						.getParameter("bookId")));
				int quantity = 1;

				Cart cart = new Cart(book, quantity);
				listCart.add(cart);

			}
		}

		CartDAO daoCart = new CartDAO();
		session.setAttribute("totalAmount", daoCart.totalPrice(listCart));
		session.setAttribute("CART", listCart);
		return viewCart();
	}

	@RequestMapping(value = "/toSubmitOrder")
	public ModelAndView toSubmitOrder(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer customer = null;
		OrderConfig config = storeManager.getOrderConfig();
		float totalAmount = (float) session.getAttribute("totalAmount");
		if ((totalAmount < config.getMin() || totalAmount > config.getMax())
				&& config.getActive() == 1) {
			session.setAttribute("OrderOutOfRange",
					"You cannot order more than " + config.getMax()
							+ " VND or less than " + config.getMin() + " VND");
		} else {
			session.removeAttribute("OrderOutOfRange");

		}
		if (session.getAttribute("customer") == null) {
			customer = storeManager.getCustomerInfo("guest");
		} else {
			customer = storeManager.getCustomerInfo(session.getAttribute(
					"customer").toString());
		}
		session.setAttribute("CUSTOMER", customer);
		return new ModelAndView("submitOrder");
	}

	@RequestMapping(value = "/toOrderConfig")
	public ModelAndView toOrderConfig(HttpServletRequest request) {
		OrderConfig config = storeManager.getOrderConfig();
		HttpSession session = request.getSession();
		session.setAttribute("config", config);
		return new ModelAndView("configOrder");
	}

	@RequestMapping(value = "/configOrder")
	public ModelAndView configOrder(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int min = Integer.parseInt(request.getParameter("min"));
		int max = Integer.parseInt(request.getParameter("max"));
		int active = 0;
		if (request.getParameter("active") != null) {
			active = 1;
		}
		OrderConfig config = storeManager.getOrderConfig();
		config.setMin(min);
		config.setMax(max);
		config.setActive(active);
		storeManager.updateConfig(config);
		session.setAttribute("configSuccess", "Configured success");
		return new ModelAndView("configOrder");
	}

	@RequestMapping(value = "/order")
	public ModelAndView order(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer customer = null;
		if (session.getAttribute("customer") == null) {
			customer = storeManager.getCustomerInfo("guest");
		} else {
			customer = storeManager.getCustomerInfo(session.getAttribute(
					"customer").toString());
		}

		List<OrderPromotion> listOrdPro = new ArrayList<OrderPromotion>();

		List<Cart> listCart = (List<Cart>) session.getAttribute("CART");
		float totalAmount = (float) session.getAttribute("totalAmount");

		OrderPromotion ordpro = new OrderPromotion();
		ordpro = new OrderPromotion();
		ordpro.setValue(totalAmount * 10 / 100);
		ordpro.setType("Shipping Fee");
		ordpro.setDescription("10% Shipping Fee");
		listOrdPro.add(ordpro);

		float promoteAmount = 0;
		if (session.getAttribute("promote") != null) {
			Promotion promote = (Promotion) session.getAttribute("promote");
			if (promote.getDiscountType().equals("Percent")) {
				promoteAmount = totalAmount * promote.getDiscountAmount() / 100;
				ordpro = new OrderPromotion();
				ordpro.setValue(promoteAmount);
				ordpro.setType("Percent discount");
				ordpro.setDescription("Discount Coupon");
				listOrdPro.add(ordpro);
			} else if (promote.getDiscountType().equals("Fee")) {
				promoteAmount = promote.getDiscountAmount();
				ordpro = new OrderPromotion();
				ordpro.setValue(promoteAmount);
				ordpro.setType("Fee discount");
				ordpro.setDescription("Discount Coupon");
				listOrdPro.add(ordpro);
			}
		}

		float memberAmount = 0;
		float shippingFee = totalAmount * 10 / 100;
		if (session.getAttribute("customer") != null) {
			memberAmount = totalAmount * 5 / 100;
			ordpro = new OrderPromotion();
			ordpro.setValue(memberAmount);
			ordpro.setType("Member Discount");
			ordpro.setDescription("Discount 5% for member");
			listOrdPro.add(ordpro);
		}
		totalAmount = totalAmount - memberAmount - promoteAmount + shippingFee;
		if (totalAmount < 0) {
			totalAmount = 0;
		}
		Order order = new Order();
		order.setCustomer(customer);
		order.setTotalAmount(totalAmount);
		order.setFullname(request.getParameter("fullname"));
		order.setAddress(request.getParameter("address"));
		order.setEmail(request.getParameter("email"));
		order.setPhone(request.getParameter("phone"));
		order.setStatus("Pending");
		order.setPaymentMethod("Cash");
		order.setOrderDate(new Date());
		StringBuffer buffer = new StringBuffer();
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		for (int i = 0; i < 15; i++) {
			double index = Math.random() * characters.length();
			buffer.append(characters.charAt((int) index));

		}
		order.setConfirmCode(buffer.toString());
		List<OrderDetail> lstDetail = new ArrayList<OrderDetail>();
		for (Cart cart : listCart) {
			OrderDetail detail = new OrderDetail();
			Book book = cart.getBook();
			detail.setBook(book);
			detail.setQuantity(cart.getQuantity());
			detail.setOrder(order);
			book.setQuantity(book.getQuantity() - cart.getQuantity());
			storeManager.updateBook(book);
			lstDetail.add(detail);
		}
		order.setOrderdetails(new HashSet<OrderDetail>(lstDetail));

		for (OrderPromotion orderPromotion : listOrdPro) {
			orderPromotion.setOrder(order);

		}
		storeManager.submitOrder(order, lstDetail, listOrdPro);
		storeManager.sendConfirmEmail(order.getEmail(), order.getConfirmCode());
		session.setAttribute("order", order);
		session.removeAttribute("CART");
		session.removeAttribute("totalAmount");
		session.removeAttribute("promote");
		return new ModelAndView("updatePaymentMethod");
	}

	@RequestMapping(value = "/updatePaymentMethod")
	public ModelAndView updatePaymentMethod(HttpServletRequest request) {
		String method = request.getParameter("method");
		Order order = (Order) request.getSession().getAttribute("order");
		order.setPaymentMethod(method);
		if (!method.equals("Cash")) {
			String card = request.getParameter("card");
			order.setPayCardId(card);
		}

		storeManager.updateOrder(order);
		return new ModelAndView("confirmOrder");
	}

	@RequestMapping(value = "/toConfirmOrder")
	public ModelAndView toConfirmOrder(HttpServletRequest request) {
		int orderId = Integer.parseInt(request.getParameter("id"));
		Order order = storeManager.getOrderById(orderId);
		// request.getSession().setAttribute("cfmCode", order.getConfirmCode());
		request.getSession().setAttribute("order", order);
		return new ModelAndView("confirmOrder");
	}

	@RequestMapping(value = "/resendEmail")
	public ModelAndView resendEmail(HttpServletRequest request) {
		int orderId = Integer.parseInt(request.getParameter("id"));
		Order order = storeManager.getOrderById(orderId);
		storeManager.sendConfirmEmail(order.getEmail(), order.getConfirmCode());
		request.getSession().setAttribute("order", order);
		return new ModelAndView("confirmOrder");
	}

	@RequestMapping(value = "/confirmOrder")
	public ModelAndView confirmOrder(HttpServletRequest request) {
		String code = request.getParameter("code");
		Order order = (Order) request.getSession().getAttribute("order");

		if (code.equals(order.getConfirmCode())) {

			request.getSession().removeAttribute("order");
			request.getSession().removeAttribute("confirmError");

			order.setStatus("Submitted");
			storeManager.updateOrder(order);
		} else {
			request.getSession().setAttribute("confirmError", "Invalid code");
			return new ModelAndView("confirmOrder");
		}
		return new ModelAndView("orderSuccess");
	}

	@RequestMapping(value = "/verifyCode")
	public ModelAndView verifyCode(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String code = request.getParameter("proCode");
		Promotion promote = storeManager.getPromoteByCode(code);
		float totalAmount = Float.parseFloat(session
				.getAttribute("totalAmount").toString());
		if (promote == null) {
			session.setAttribute("promoteError", "Invalid code!");
		} else if (promote.getStatus().equals("Inactive")) {
			session.setAttribute("promoteError", "This code was deactivated!");
		} else if (promote.getEndDate().compareTo(new Date()) < 0) {
			session.setAttribute("promoteError", "This code was expired!");
		} else if (totalAmount < promote.getConditionAmount()) {
			session.setAttribute(
					"promoteError",
					"This coupon is applicable for "
							+ "order total amount more than "
							+ promote.getConditionAmount());
		} else {
			session.removeAttribute("promoteError");
			session.setAttribute("promote", promote);
		}

		return new ModelAndView("submitOrder");
	}

	@RequestMapping(value = "/customerViewOrder")
	public ModelAndView customerViewOrder(HttpServletRequest request) {
		if (request.getSession().getAttribute("customer") == null) {
			return new ModelAndView("accessDenied");
		}
		String username = (String) request.getSession()
				.getAttribute("customer");
		List<Order> lstOrder = storeManager.getOrderByUser(username);

		request.getSession().setAttribute("ORDERHISTORY", lstOrder);
		return new ModelAndView("customerViewOrder");
	}

	@RequestMapping(value = "/customerViewDetails")
	public ModelAndView customerViewDetails(HttpServletRequest request) {
		if (request.getSession().getAttribute("customer") == null) {
			return new ModelAndView("accessDenied");
		}
		int id = Integer.parseInt(request.getParameter("id").toString());
		List<OrderDetail> lstOrderDetail = storeManager.getOrderDetail(id);

		List<OrderPromotion> lstPromoteDetail = storeManager
				.getPromotionByOrder(id);
		request.getSession().setAttribute("PROMS", lstPromoteDetail);
		request.getSession().setAttribute("DETAILS", lstOrderDetail);
		return new ModelAndView("customerViewDetails");
	}

	@RequestMapping(value = "/viewOrder")
	public ModelAndView viewOrder(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		List<Order> lstOrder = storeManager.getOrderList();

		request.getSession().setAttribute("ORDERLIST", lstOrder);
		return new ModelAndView("viewOrder");
	}

	@RequestMapping(value = "/viewOrderByCustomer")
	public ModelAndView viewOrderByCustomer(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		String username = request.getParameter("username");
		List<Order> lstOrder = storeManager.getOrderByUser(username);

		request.getSession().setAttribute("ORDERLIST", lstOrder);
		return new ModelAndView("viewOrder");
	}

	@RequestMapping(value = "/viewOrderMonthly")
	public ModelAndView viewOrderBetweenDays(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}

		int month = Integer.parseInt(request.getParameter("month"));
		int year = Integer.parseInt(request.getParameter("year"));
		List<Order> lstOrder;
		lstOrder = storeManager.getOrderListMonthly(month, year);

		request.getSession().setAttribute("ORDERLIST", lstOrder);
		return new ModelAndView("viewOrder");
	}

	@RequestMapping(value = "/viewDetails")
	public ModelAndView viewDetails(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		int id = Integer.parseInt(request.getParameter("id").toString());
		List<OrderDetail> lstOrderDetail = storeManager.getOrderDetail(id);

		request.getSession().setAttribute("DETAILS", lstOrderDetail);

		List<OrderPromotion> lstPromoteDetail = storeManager
				.getPromotionByOrder(id);
		request.getSession().setAttribute("PROMS", lstPromoteDetail);

		return new ModelAndView("viewDetails");
	}

	@RequestMapping(value = "/viewCustomers")
	public ModelAndView viewCustomer(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		List<Customer> lstCustomer = storeManager.getCustomerList();
		
		request.getSession().setAttribute("CUSTOMERLIST", lstCustomer);
		
		return new ModelAndView("viewCustomers");
	}
	
	@RequestMapping(value = "/warehouse")
	public String warehouse(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return "redirect:accessDeniedAd";
		}
		int bookId = Integer.parseInt(request.getParameter("id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Book book = storeManager.getBookById(bookId);
		book.setQuantity(book.getQuantity() + quantity);
		Warehouse wh = new Warehouse(new Date(), quantity, book);
		storeManager.warehouseBook(wh, book);
		
		request.getSession().setAttribute("warehouseSuccess", 
				"Warehoused successfully!");
		return "redirect:viewStock?wh=0";
	}

	@RequestMapping(value = "/viewStock")
	public ModelAndView viewWarehouse(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		if (request.getParameter("wh") == null) {
			request.getSession().removeAttribute("warehouseSuccess");
		}
		List<Warehouse> lstWarehouse = storeManager.getWarehousingHistory();
		request.getSession().setAttribute("WAREHOUSE", lstWarehouse);
		List<Book> lstBook = storeManager.getBookList();
		request.getSession().setAttribute("BOOK", lstBook);
		
		return new ModelAndView("viewStock");
	}
	
	@RequestMapping(value = "/viewPromotions")
	public ModelAndView viewPromotions(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		request.getSession().removeAttribute("updatePromoteSuccess");
		request.getSession().removeAttribute("addPromoteSuccess");
		List<Promotion> lstPromotion = storeManager.getPromotionList();

		request.getSession().setAttribute("PROMOTIONLIST", lstPromotion);
		return new ModelAndView("viewPromotions");
	}

	@RequestMapping(value = "/updateOrderStatus")
	public ModelAndView updateOrderStatus(HttpServletRequest request) {
		if (request.getSession().getAttribute("admin") == null) {
			return new ModelAndView("accessDeniedAd");
		}
		int id = Integer.parseInt(request.getParameter("id").toString());
		Order order = storeManager.getOrderById(id);
		order.setStatus(request.getParameter("status"));
		storeManager.updateOrder(order);
		List<Order> lstOrder = storeManager.getOrderList();

		request.getSession().setAttribute("ORDERLIST", lstOrder);
		return new ModelAndView("viewOrder");
	}
	
	private String REPORT_OUTPUT_FOLDER = "D:/Nigellus Bookstore/Reports/";
	public void makeReportDir() {
		File dir = new File (REPORT_OUTPUT_FOLDER);
		if (!dir.exists()) {
			dir.mkdir();
		}
	}
	@RequestMapping(value = "/reportYearIncome")
	public String reportYearIncome(HttpServletRequest request) {
		makeReportDir();
		String year = request.getParameter("yearIncome");
		String outputFile = REPORT_OUTPUT_FOLDER + year + "IncomeReport.pdf";
		try {
			reportManager.yearIncomePerMonth(year, outputFile);
			request.getSession().setAttribute
				("ReportNoti", "Report exported successfully");
		} catch (Exception e) {
			request.getSession().setAttribute
				("ReportNoti", e.getMessage());
		}
		
		return "redirect:admin?rp=0";
	}
	
	@RequestMapping(value = "/warehouseReport")
	public String warehouseReport(HttpServletRequest request) {
		makeReportDir();
		String year = request.getParameter("yearWh");
		String month = request.getParameter("monthWh");
		String outputFile = REPORT_OUTPUT_FOLDER 
				+ year + "_" + month + "_" + "Warehouse.pdf";
		try {
			reportManager.monthWarehouse(year, month, outputFile);
			request.getSession().setAttribute
				("ReportNoti", "Report exported successfully");
		} catch (Exception e) {
			request.getSession().setAttribute
				("ReportNoti", e.getMessage());
		}
		
		return "redirect:admin?rp=0";
	}
	
	@RequestMapping(value = "/reportTop5BestSeller")
	public String reportTop5BestSeller(HttpServletRequest request) {
		makeReportDir();
		String outputFile = REPORT_OUTPUT_FOLDER + "Top 5 Best-sellers.pdf";
		try {
			reportManager.top5BestSeller(outputFile);
			request.getSession().setAttribute
				("ReportNoti", "Report exported successfully");
		} catch (Exception e) {
			request.getSession().setAttribute
				("ReportNoti", e.getMessage());
		}
		
		return "redirect:admin?rp=0";
	}
	
	@RequestMapping(value = "/exportReceipt")
	public String exportReceipt(HttpServletRequest request) {
		makeReportDir();
		String orderId = request.getParameter("id");
		String cus = request.getParameter("cus");
		String outputFile = REPORT_OUTPUT_FOLDER + 
				"Order_" + orderId + "_" + cus.replace(" ", "") + ".pdf";
		try {
			reportManager.printOrderReceipt(orderId, outputFile);
			request.getSession().setAttribute
				("ReportNoti", "Report exported successfully");
		} catch (Exception e) {
			request.getSession().setAttribute
				("ReportNoti", e.getMessage());
		}
		
		return "redirect:admin?rp=0";
	}
}
