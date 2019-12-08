package cifo.cursjava.pf.services;

import java.util.List;

import cifo.cursjava.pf.models.User;

public interface IUserService {
	List<User> getUsers();
	User findUserByUsername(String username);
	void delete(User user);
	void saveOrUpdate(User user);
}
