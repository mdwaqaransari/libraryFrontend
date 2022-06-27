package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import entity.Book;
import service.BookService;


@Controller
public class BookController {
	
	private static final String LIBVIEW = "redirect:/library-view";
	
	@GetMapping("/library-view")
	public ModelAndView viewLibrary() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("library-view.jsp");
		return modelAndView;
	}
	
	@GetMapping("add-book")
	public ModelAndView addBook() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("add-book.jsp");
		return modelAndView;
	}
	
	@PostMapping("add-book")
	public String addBook(String code, String name, String author) {
		Book book = new Book();
		book.setAuthor(author);
		book.setName(name);
		book.setCode(code);
		try {
			BookService.addBook(book);
			return LIBVIEW;
		}catch(Exception e){
			return "redirect:/add-book";
		}
		
	}
	
	@GetMapping("/edit-book")
	public ModelAndView editBook(@RequestParam String id) {
		Book book = BookService.getBookById(id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(book);
		modelAndView.setViewName("edit-book.jsp");
		return modelAndView;
	}
	
	@PostMapping("/edit-book")
	public String editBook(int id, String name, String code, String author) {
		Book book = new Book();
		book.setId(id);
		book.setName(name);
		book.setCode(code);
		book.setAuthor(author);
		Book newBook = BookService.updateBook(book);
		if(newBook != null) {
			return LIBVIEW;
		}else {
			return "redirect:/edit-book/"+book.getCode();
		}
		
	}
	
	@GetMapping("delete-book")
	public String deleteBook(@RequestParam String code) {
		boolean result = BookService.deleteBook(code);
		if(result) {
			return LIBVIEW;
		}
		return LIBVIEW;
	}
	
}
