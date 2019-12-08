package cifo.cursjava.pf.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cifo.cursjava.pf.dao.IUserDAO;
import cifo.cursjava.pf.models.User;

@Service("userService")
public class UserService implements IUserService, UserDetailsService{
	
	@Autowired
	private IUserDAO userDao;
	
	@Transactional(readOnly = true)
	public List<User> getUsers() {
		return userDao.getUsers();
	}
	
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userDao.findUserByUsername(username);
		UserBuilder builder = null;
		if (user != null ) {
			builder = org.springframework.security.core.userdetails.User.withUsername(username);
			builder.disabled(!user.isEnabled());
			builder.password(user.getPassword());
			String[] authorities = 
				user.getAuthorities().stream().map(a -> a.getAuthority()).toArray(String[]::new);
			builder.authorities(authorities);
		} else {
			throw new UsernameNotFoundException("User not found");
		}
		return builder.build();
	}
	
	@Transactional(readOnly = true)
	public User findUserByUsername(String username) {
		return userDao.findUserByUsername(username);
	}

	@Transactional
	public void delete(User user) {
		userDao.delete(user);
	}
}
