package cifo.cursjava.pf.dao;

import java.util.List;

import cifo.cursjava.pf.models.User;

public interface IUserDAO {
	List<User> getUsers();
	User findUserByUsername(String username);
	void delete(User user);
}
