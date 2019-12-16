package cifo.cursjava.pf.dao;

import java.util.List;

import cifo.cursjava.pf.models.Usuari;

public interface IUsuariDAO {
	List<Usuari> getUsuaris();
	Usuari findUsuariByUsername(String username);
	void delete(Usuari usuari);
	void saveOrUpdate(Usuari usuari);
}
