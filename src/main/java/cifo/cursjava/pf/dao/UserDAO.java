package cifo.cursjava.pf.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cifo.cursjava.pf.models.User;

@Repository
public class UserDAO implements IUserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<User> getUsers() {
		Session s = sessionFactory.getCurrentSession();
		List<User> users = s.createQuery("from User", User.class).list();
		return users;
	}
}
