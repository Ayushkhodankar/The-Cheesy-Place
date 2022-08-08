package model;

public class User {
	private int id;
	private String name,email,mobno,uname,pass;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String uname, String pass) {
		super();
		this.uname = uname;
		this.pass = pass;
	}
	public User(int id, String name, String email, String mobno, String uname, String pass) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobno = mobno;
		this.uname = uname;
		this.pass = pass;
	}
	public User(String name, String email, String mobno, String uname, String pass) {
		super();
		this.name = name;
		this.email = email;
		this.mobno = mobno;
		this.uname = uname;
		this.pass = pass;
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	

}
