package cifo.cursjava.pf.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/authenticateTheUser")
	public String autenticado() {
		return "redirect:/";
	}
	
	@GetMapping("/locked")
	public String accessDenied() {
		return "denegat";
	}
}
