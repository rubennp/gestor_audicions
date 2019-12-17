package cifo.cursjava.pf.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import cifo.cursjava.pf.validation.EMail;

@Entity
@Table (name = "users_info")
public class Usuari {
	
	@Id
	@Column (name = "username")
	private String username;
	
	@NotNull 
	@Size(min = 1, message = "Obligatori")
	@Column (name = "nom")
	private String nom;
	
	@NotNull 
	@Size(min = 1, message = "Obligatori")
	@Column (name = "cognom1")
	private String cognom1;
	
	@Column (name = "cognom2")
	private String cognom2;
	
	@EMail
	@Column (name = "email")
	private String email;
		
	@OneToOne
	@JoinColumn(name = "username")
	private User user;
		
	public User getUser() {
		return this.user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getCognom1() {
		return cognom1;
	}

	public void setCognom1 (String cognom1) {
		this.cognom1 = cognom1;
	}
	
	public String getCognom2() {
		return cognom2;
	}

	public void setCognom2 (String cognom2) {
		this.cognom2 = cognom2;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
}
