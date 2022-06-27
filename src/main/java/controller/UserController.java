package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.Error;
import entity.User;
import service.UserService;

@Controller
public class UserController {
	
	public ModelAndView gotoHome() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index.jsp");
		return modelAndView;
	}

	@GetMapping("/")
	public ModelAndView index() {
		return gotoHome();
	}

	@GetMapping("/login")
	public ModelAndView login() {
		return gotoHome();
	}

	@PostMapping("/login")
	public String login(String username, String password, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		User user = UserService.login(username, password);
		if (user != null) {
//			Setting user
			httpSession.setAttribute("user", user);
			return "redirect:/library-view";
		}
//		Setting error
		Error error = new Error("Invalid credentials! Please try again");
		request.setAttribute("errorMessage", error);
		return "redirect:/login";

	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		return "redirect:/";
	}

}
