package ggmProject;

public class RegisterBean {
	private String name;
	private String id;
	private String pw;
	private String pwc;
	private String email;
	public RegisterBean() {
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPwc() {
		return pwc;
	}
	public void setPwc(String pwc) {
		this.pwc = pwc;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
