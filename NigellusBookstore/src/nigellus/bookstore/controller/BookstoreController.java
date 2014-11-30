package nigellus.bookstore.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import nigellus.bookstore.business.BookstoreManager;
import nigellus.bookstore.dao.BookDAO;
import nigellus.bookstore.entity.Book;
import nigellus.bookstore.entity.Category;
import nigellus.bookstore.model.AddBookModel;
import nigellus.bookstore.model.AddCategoryModel;
import nigellus.bookstore.model.AdminLoginModel;
import nigellus.bookstore.model.BookstoreModel;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(value = "/index")
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/toChangeImage")
	public ModelAndView toChangeImage() {
		return new ModelAndView("changeImage");
	}

	@RequestMapping(value = "/uploadSuccess")
	public ModelAndView uploadSuccess() {
		return new ModelAndView("uploadSuccess");
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

	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/changeImage", method = RequestMethod.POST)
	public String changeImage(@RequestParam("name") String name,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				File serverFile = new File(request.getSession()
						.getServletContext().getRealPath("/resources/images")

						+ File.separator
						+ name
						+ file.getOriginalFilename().substring(
								file.getOriginalFilename().lastIndexOf(".")));

				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				BookDAO dao = new BookDAO();
				int id = Integer.parseInt(request.getParameter("id"));

				Book b = storeManager.getBookById(id);
				System.out.println(id);
				b.setImageUrl("/resources/images/"
						+ name
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
				// return "You failed to upload " + name + " => " +
				// e.getMessage();
				e.printStackTrace();
			}
		} else {
			request.getSession().removeAttribute("ChangeImgError");
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
		book.setImageUrl("");
		book.setDescription(description);
		List<Category> selCates = storeManager
				.getSelectedCateList(selectedCateId);
		storeManager.addBook(selCates, book);
		request.getSession().setAttribute("addBookSuccess",
				"Added book successfully!");
		return new ModelAndView("addBook");
	}

	@RequestMapping(value = "/toAddBook")
	public ModelAndView toAddBook(HttpServletRequest request,
			BookstoreModel storeModel) {
		// ModelAndView mav = new ModelAndView("addBook", "model", storeModel);
		storeManager.getCategoryInfo(storeModel);
		request.getSession().setAttribute("categories",
				storeModel.getCategories());

		return new ModelAndView("addBook");
	}

	@RequestMapping(value = "/toUpdateBook")
	public ModelAndView toUpdateBook(HttpServletRequest request,
			BookstoreModel storeModel) {
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
				.getSelectedCateList(selectedCateId);
		storeManager.updateBook(selCates, b);
		request.getSession().setAttribute("ChangeImgSuccess",
				"Updated book successfully!");
		return "redirect:uploadSuccess";
	}
	
	@RequestMapping(value = "/deleteBook")
	public String deleteBook(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		storeManager.deleteBook(id);
		request.getSession().setAttribute("ChangeImgSuccess",
				"Removed book successfully!");
		return "redirect:uploadSuccess";
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
