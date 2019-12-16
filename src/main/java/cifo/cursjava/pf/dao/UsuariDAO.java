package cifo.cursjava.pf.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cifo.cursjava.pf.models.Usuari;
import cifo.cursjava.pf.models.User;

@Repository
public class UsuariDAO implements IUsuariDAO {
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Usuari> getUsuaris() {
		Session s = sessionFactory.getCurrentSession();
		List<Usuari> usuaris = s.createQuery("from Usuari", Usuari.class).list();
		for (Usuari usuari : usuaris) System.out.println(usuari.getUser().getUsername());
		return usuaris;
	}
	
	@Override
	public Usuari findUsuariByUsername(String username) {
		User user = userDao.findUserByUsername(username);
		return sessionFactory.getCurrentSession().get(Usuari.class, user.getUsername());
	}
	
	@Override
	public void delete(Usuari usuari) {
		Session s = sessionFactory.getCurrentSession();
		s.delete(usuari);
	}

	@Override
	public void saveOrUpdate(Usuari usuari) {
		Session s = sessionFactory.getCurrentSession();
		s.saveOrUpdate(usuari);
	}
}
