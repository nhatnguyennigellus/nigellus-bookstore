package nigellus.bookstore.controller;

import javax.servlet.http.HttpServletRequest;

import nigellus.bookstore.business.BookstoreManager;
import nigellus.bookstore.model.BookstoreModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@RequestMapping(value = "/viewCategories")
	public ModelAndView viewCategories(BookstoreModel storeModel,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("viewCategories", "model", storeModel);
		storeManager.getCategoryInfo(storeModel);
	/*	if (request.getSession().getAttribute("addCateSuccess") != null) {
			request.getSession().removeAttribute("addCateSuccess");
		}
		if (request.getSession().getAttribute("addBookSuccess") != null) {
			request.getSession().removeAttribute("addBookSuccess");
		}*/
		return mav;
	}
	
	@RequestMapping(value = "/viewBooks")
	public ModelAndView viewBooks(BookstoreModel storeModel,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("viewBooks", "model", storeModel);
		storeManager.getBookInfo(storeModel);
		if (request.getSession().getAttribute("addCateSuccess") != null) {
			request.getSession().removeAttribute("addCateSuccess");
		}
		if (request.getSession().getAttribute("addBookSuccess") != null) {
			request.getSession().removeAttribute("addBookSuccess");
		}
		return mav;
	}
}
