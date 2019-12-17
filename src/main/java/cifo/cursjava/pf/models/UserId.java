package cifo.cursjava.pf.models;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class UserId implements Serializable {

	private String username;
	
	private static final long serialVersionUID = -7439428012810073649L;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
