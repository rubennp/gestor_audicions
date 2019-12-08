package cifo.cursjava.pf.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String llistaUsuaris(Model model) {
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
	
	@RequestMapping("/user/nou")
	public String newUser(Model model) {
		User user = new User();
		
		model.addAttribute("user", user);
		return "nou-usuari"; 
	}
	
	@RequestMapping("/user/guarda")
	public String procesarFormulario(@ModelAttribute("user") User user, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			System.out.println("Error en donar d'alta usuari!");
			return "nou-usuari";
		} else {
			userService.saveOrUpdate(user);
			return "redirect:/admin/";
		}
	}
}
