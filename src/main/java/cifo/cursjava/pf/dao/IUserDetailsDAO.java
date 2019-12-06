package cifo.cursjava.pf.dao;

import cifo.cursjava.pf.models.User;

public interface IUserDetailsDAO {
	User findUserByUsername(String username);
}
