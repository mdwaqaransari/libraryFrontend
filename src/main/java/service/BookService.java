package service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import entity.Book;

@Service
public class BookService {
	
	private static RestTemplate restTemplate = new RestTemplate();
	private static final String BASE_URL = "http://localhost:8081/";
	
	private BookService() {
	    throw new IllegalStateException("Utility class");
	  }
	
	@SuppressWarnings("unchecked")
	public static List<Book> getAllBooks(){
		Map<String, String> bookMap = new HashMap<>();
		List<Book> bookEntities = new ArrayList<>();
		try {
			List<Book> books = restTemplate.getForObject(BASE_URL+"getAllBooks", List.class);
			if(books == null) {
				throw new NullPointerException();
			}
			for(int i=0; i<books.size(); i++) {
				bookMap = (Map<String, String>)books.get(i);
				String name = bookMap.get("name");
				String author = bookMap.get("author");
				String code = bookMap.get("code");
				String date = bookMap.get("dateAdded");
				Book book = new Book();
				book.setAuthor(author);
				book.setCode(code);
				book.setName(name);
				book.setDateAdded(date);
				bookEntities.add(book);
			}
			return bookEntities;
		}catch(Exception e) {
			return bookEntities;
		}
		
	}
	
	public static Book getBookById(String id) {
		return restTemplate.getForObject(BASE_URL+"book/"+id, Book.class);
	}
	
	public static Book addBook(Book book) {
		HttpEntity<Book> httpEntity = new HttpEntity<>(book);
		try {
			return restTemplate.postForObject(BASE_URL+"book/add",httpEntity , Book.class);
		}catch(Exception e) {
			return null;
		}
		
		
	}

	public static Book updateBook(Book book) {
		HttpEntity<Book> httpEntity = new HttpEntity<>(book);
		try {
			return restTemplate.postForObject(BASE_URL+"book/update", httpEntity, Book.class);
		}catch(Exception e) {
			return null;
		}
		
	}
	
	public static boolean deleteBook(String code) {
		Book book = new Book();
		book.setCode(code);
		HttpEntity<Book> httpEntity = new HttpEntity<>(book);
		try {
			return restTemplate.postForObject(BASE_URL+"book/delete", httpEntity, Boolean.class);
		}catch(Exception e) {
			return false;
		}
	}


}
