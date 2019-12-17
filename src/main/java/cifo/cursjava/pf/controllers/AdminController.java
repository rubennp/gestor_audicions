package cifo.cursjava.pf.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cifo.cursjava.pf.models.User;
import cifo.cursjava.pf.models.Usuari;
import cifo.cursjava.pf.services.IUserService;
import cifo.cursjava.pf.services.IUsuariService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	JdbcUserDetailsManager jdbcUserDetailsManager;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private IUsuariService usuariService;
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("/")
	public String llistaUsuaris(Model model) {
		List<Usuari> usuaris = usuariService.getUsuaris();
		
		model.addAttribute("usuaris", usuaris);
		
		return "index-admin";
	}
	
	@GetMapping("/user/borra")
	public String deleteUser(@RequestParam("username") String username) {
		Usuari usuari = usuariService.findUsuariByUsername(username);
		
		usuariService.delete(usuari);
		jdbcUserDetailsManager.deleteUser(usuari.getUser().getUsername());
		
		return "redirect:/admin/";
	}
	
	@RequestMapping("/user/nou")
	public String nouUser(Model model) {
		User user = new User();
		
		model.addAttribute("user", user);
		
		return "nou-user"; 
	}
	
	@GetMapping("/user/nou/info/{username}")
	public String nouUsusari(@PathVariable String username, Model model) {
		Usuari usuari = new Usuari();
		
		usuari.setUser(userService.findUserByUsername(username));
		usuari.setUsername(username);
		model.addAttribute("usuari", usuari);
		
		return "nou-usuari";
	}
	
	@PostMapping("/user/guarda-acces")
	public String guardarUser(@ModelAttribute("user") User user, @RequestParam("acces") String acces, BindingResult bindingResult) {
		jdbcUserDetailsManager.createUser(
				org.springframework.security.core.userdetails.User
				.withUsername(user.getUsername())
				.password(passwordEncoder.encode(user.getPassword()))
				.roles(acces).build());
		
		if (bindingResult.hasErrors()) {
			System.out.println("Error en donar d'alta usuari!");
			return "nou-user";
		} else {
			return "redirect:/admin/user/nou/info/" + user.getUsername();
		}
	}
	
	@PostMapping("/user/guarda-usuari")
	public String guardaUsuari(@ModelAttribute("usuari") Usuari usuari, BindingResult bindingResult) {
		usuariService.saveOrUpdate(usuari);
		
		return "redirect:/admin/";
	}
}
