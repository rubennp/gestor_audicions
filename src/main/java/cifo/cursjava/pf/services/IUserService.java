package cifo.cursjava.pf.services;

import cifo.cursjava.pf.models.User;

public interface IUserService {
	User findUserByUsername(String username);
}
