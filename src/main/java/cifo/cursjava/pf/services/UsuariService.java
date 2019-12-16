package cifo.cursjava.pf.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cifo.cursjava.pf.dao.IUsuariDAO;
//import cifo.cursjava.pf.models.User;
import cifo.cursjava.pf.models.Usuari;

@Service("usuariService")
public class UsuariService implements IUsuariService {
	
	@Autowired
	private IUsuariDAO usuariDao;
	
//	@Autowired 
//	private IUserDao userDao;
	
	@Transactional(readOnly = true)
	public List<Usuari> getUsuaris() {
		return usuariDao.getUsuaris();
	}
	
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuari usuari = usuariDao.findUsuariByUsername(username);
		UserBuilder builder = null;
		if (usuari != null ) {
			builder = org.springframework.security.core.userdetails.User.withUsername(usuari.getUser().getUsername());
			builder.disabled(!usuari.getUser().isEnabled());
			builder.password(usuari.getUser().getPassword());
			String[] authorities = 
				usuari.getUser().getAuthorities().stream().map(a -> a.getAuthority()).toArray(String[]::new);
			builder.authorities(authorities);
		} else {
			throw new UsernameNotFoundException("User not found");
		}
		return builder.build();
	}
	
	@Transactional(readOnly = true)
	public Usuari findUsuariByUsername(String username) {
		return usuariDao.findUsuariByUsername(username);
	}

	@Transactional
	public void delete(Usuari usuari) {
		usuariDao.delete(usuari);
	}
	
	@Transactional
	public void saveOrUpdate(Usuari usuari) {
		usuariDao.saveOrUpdate(usuari);
	}

//	@Override
//	public List<User> getUsers() {
//		return userDao.getUsers();
//	}
//
//	@Override
//	public User findUserByUsername(String username) {
//		return userDao.findUserByUsername(username);
//	}
//
//	@Override
//	public void delete(User user) {
//		userDao.delete(user);
//	}
//
//	@Override
//	public void saveOrUpdate(User user) {
//		userDao.saveOrUpdate(user);
//	}
}
