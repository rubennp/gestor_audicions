package cifo.cursjava.pf.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cifo.cursjava.pf.models.User;
import cifo.cursjava.pf.services.IUserService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private IUserService userService;

	@RequestMapping("/")
	public String lista(Model model) {
		List<User> users = userService.getUsers();
		model.addAttribute("users", users);
		return "index-admin";
	}
	
	@GetMapping("/user/borra")
	public String deleteUser(@RequestParam("username") String username) {
		User user = userService.findUserByUsername(username);
		userService.delete(user);
		return "redirect:/admin/";
	}
}
