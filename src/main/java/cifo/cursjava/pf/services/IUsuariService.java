package cifo.cursjava.pf.services;

import java.util.List;

import cifo.cursjava.pf.models.Usuari;

public interface IUsuariService {
	List<Usuari> getUsuaris();
	Usuari findUsuariByUsername(String username);
	void delete(Usuari usuari);
	void saveOrUpdate(Usuari usuari);
}
