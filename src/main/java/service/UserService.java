package service;

import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import entity.User;

@Service
public class UserService {
	
	private static RestTemplate restTemplate = new RestTemplate();
	private static final String BASE_URL = "http://localhost:8081/";
	
	private UserService() {
	    throw new IllegalStateException("Utility class");
	  }
	
	public static User login(String username, String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		HttpEntity<User> httpEntity = new HttpEntity<>(user);
		try {
			return restTemplate.postForObject(BASE_URL+"login", httpEntity, User.class);
		}catch(Exception e) {
			return null;
		}
	}

}
