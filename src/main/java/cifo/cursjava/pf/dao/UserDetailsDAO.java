package cifo.cursjava.pf.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cifo.cursjava.pf.models.User;

public class UserDetailsDAO implements IUserDetailsDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public User findUserByUsername(String username) {
		return sessionFactory.getCurrentSession().get(User.class, username);
	}
}
