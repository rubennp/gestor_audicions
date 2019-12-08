package cifo.cursjava.pf.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cifo.cursjava.pf.dao.IUserDAO;
import cifo.cursjava.pf.models.User;
import cifo.cursjava.pf.services.IUserService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private IUserDAO userDao;
	
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
		String[] authoritiesToStore = {};
		
		model.addAttribute("user", user).addAttribute("authoritiesToStore", authoritiesToStore);
		return "nou-usuari"; 
	}
	
	@RequestMapping("/user/guarda")
	public String procesarFormulario(@ModelAttribute("user") User user, @ModelAttribute("authoritiesToStore") String[] authoritiesToStore, BindingResult bindingResult) {
		
		UserBuilder userBuilder = null;
		
		if (userDao.findUserByUsername(user.getUsername()) == null) {
			userBuilder.username(user.getUsername());
			userBuilder.password(user.getPassword());
			userBuilder.disabled(user.isEnabled());
			userBuilder.authorities(authoritiesToStore);
		}
		
		User userToStore = new User(user.getUsername(), user.getPassword(), user.getAuthorities())
		if (bindingResult.hasErrors()) {
			System.out.println("Error en donar d'alta usuari!");
			return "nou-usuari";
		} else {
			userService.saveOrUpdate(User.UserBuilder.with ) userBuilder.build());
			return "redirect:/admin/";
		}
	}
}
