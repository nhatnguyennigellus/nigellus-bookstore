package nigellus.bookstore.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import nigellus.bookstore.business.BookstoreManager;
import nigellus.bookstore.dao.CategoryDAO;
import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;
import nigellus.bookstore.model.AddBookModel;
import nigellus.bookstore.model.AddCategoryModel;
import nigellus.bookstore.model.AdminLoginModel;
import nigellus.bookstore.model.BookstoreModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/index")
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/login", method = GET)
	public String login(@RequestParam("user") String username,
			@RequestParam("pass") String password, AdminLoginModel adLogModel,
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
		return "redirect:index";

	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return index();
	}

	@RequestMapping(value = "/viewCategories")
	public ModelAndView viewCategories(BookstoreModel storeModel,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("viewCategories", "model",
				storeModel);
		storeManager.getCategoryInfo(storeModel);
		if (request.getSession().getAttribute("addCateSuccess") != null) {
			request.getSession().removeAttribute("addCateSuccess");
		}
		if (request.getSession().getAttribute("addBookSuccess") != null) {
			request.getSession().removeAttribute("addBookSuccess");
		}
		return mav;
	}

	@RequestMapping(value = "/addCategory")
	public ModelAndView addCategory(AddCategoryModel addCategoryModel,
			HttpServletRequest request) {
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

	@RequestMapping(value = "/addBook")
	public ModelAndView addBook(AddBookModel addBookModel,
			HttpServletRequest request) {
		String title = request.getParameter("title");
		float price = Float.parseFloat(request.getParameter("unitPrice"));
		String author = request.getParameter("authorList");
		String description = request.getParameter("description");
		String imageUrl = "/resources/images/noimage.png";
		String[] selectedCateId = request.getParameterValues("selectedCate");
		//Set selectedCates = new HashSet<Category>(storeManager.getSelectedCateList(selectedCateId));
		Book book = new Book();
		book.setTitle(title);
		book.setAuthorList(author);
		book.setUnitPrice(price);
		book.setImageUrl(imageUrl);
		book.setDescription(description);
		List<Category> selCates = storeManager.getSelectedCateList(selectedCateId);
		storeManager.addBook(selCates, book);
		request.getSession().setAttribute("addBookSuccess",
				"Added book successfully!");
		return new ModelAndView("addBook");
	}

	@RequestMapping(value = "/toAddBook") 
	public ModelAndView toAddBook(HttpServletRequest request, BookstoreModel storeModel) {
		//ModelAndView mav = new ModelAndView("addBook", "model", storeModel);
		storeManager.getCategoryInfo(storeModel);
		request.getSession().setAttribute("categories", storeModel.getCategories());
		return new ModelAndView("addBook");
	}
	
	@RequestMapping(value = "/viewBooks")
	public ModelAndView viewBooks(BookstoreModel storeModel,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("viewBooks", "model", storeModel);
		String key = request.getParameter("key");
		storeManager.getBookInfo(storeModel, key);
		if (request.getSession().getAttribute("addCateSuccess") != null) {
			request.getSession().removeAttribute("addCateSuccess");
		}
		if (request.getSession().getAttribute("addBookSuccess") != null) {
			request.getSession().removeAttribute("addBookSuccess");
		}
		return mav;
	}
}
