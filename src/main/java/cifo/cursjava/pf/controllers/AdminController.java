package cifo.cursjava.pf.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cifo.cursjava.pf.models.User;
import cifo.cursjava.pf.services.IUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private IUserService userService;

	@RequestMapping("/")
	public String inici(Model model) {
		List<User> users = userService.getUsers();
		model.addAttribute("users", users);
		return "index-admin";
	}
}
