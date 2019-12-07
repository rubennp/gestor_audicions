package cifo.cursjava.pf.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cifo.cursjava.pf.dao.IUserDAO;
import cifo.cursjava.pf.models.User;

@Service("userService")
public class UserService implements IUserService {
	
	@Autowired
	private IUserDAO userDao;
	
	@Transactional(readOnly = true)
	public List<User> getUsers() {
		return userDao.getUsers();
	}
}
