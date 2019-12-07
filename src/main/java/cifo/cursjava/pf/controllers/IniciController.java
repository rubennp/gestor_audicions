package cifo.cursjava.pf.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IniciController {
	
	@GetMapping("/")
	public String inicio() {
		return "index";
	}
}
