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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cifo.cursjava.pf.models.User;
import cifo.cursjava.pf.models.Usuari;
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

	@RequestMapping("/")
	public String llistaUsuaris(Model model) {
		List<Usuari> usuaris = usuariService.getUsuaris();
		model.addAttribute("usuaris", usuaris);
		return "index-admin";
	}
	
	@GetMapping("/user/borra")
	public String deleteUser(@RequestParam("username") String username) {
		Usuari usuari = usuariService.findUsuariByUsername(username);
		
		jdbcUserDetailsManager.deleteUser(usuari.getUser().getUsername());
		usuariService.delete(usuari);
		return "redirect:/admin/";
	}
	
	@RequestMapping("/user/nou")
	public String newUser(Model model) {
		Usuari usuari = new Usuari();
		User user = new User();
		model.addAttribute("usuari", usuari);
		model.addAttribute("user", user);
		return "nou-usuari"; 
	}
	
	@RequestMapping("/user/guarda")
	public String guardarUsuari(@ModelAttribute("usuari") Usuari usuari, @ModelAttribute("user") User user, BindingResult bindingResult) {
		jdbcUserDetailsManager.createUser(
				org.springframework.security.core.userdetails.User
				.withUsername(user.getUsername())
				.password(passwordEncoder.encode(user.getPassword()))
				.roles("USER").build());
		
		if (bindingResult.hasErrors()) {
			System.out.println("Error en donar d'alta usuari!");
			return "nou-usuari";
		} else {
			return "redirect:/admin/";
		}
	}
}
