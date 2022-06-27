package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import entity.Author;

@Service
public class AuthorService {
	private RestTemplate restTemplate = new RestTemplate();
	private String baseUrl = "http://localhost:8081/";
	
	@SuppressWarnings("unchecked")
	public List<Author> getAllAuthors() {
		Map<String, String> authorMap = new HashMap<>();
		List<Author> authorEntities = new ArrayList<>();
		try {
			List<Author> authors = restTemplate.getForObject(baseUrl+"getAllAuthors", List.class);
			if(authors == null) {
				throw new NullPointerException();
			}
			for(int i=0; i<authors.size(); i++) {
				authorMap = (Map<String, String>)authors.get(i);
				String name = authorMap.get("name");
				Author author = new Author();
				author.setName(name);
				authorEntities.add(author);
			}
			return authorEntities;
		}catch(Exception e) {
			return authorEntities;
		}
		
	}
}
