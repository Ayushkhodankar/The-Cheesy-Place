package model;

public class Pizza {
	
	private int id;
	private String pizza_name,pizza_desc,pizza_price;
	
	public Pizza() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Pizza(String pizza_name, String pizza_desc, String pizza_price) {
		super();
		this.pizza_name = pizza_name;
		this.pizza_desc = pizza_desc;
		this.pizza_price = pizza_price;
	}

	public Pizza(int id, String pizza_name, String pizza_desc, String pizza_price) {
		super();
		this.id = id;
		this.pizza_name = pizza_name;
		this.pizza_desc = pizza_desc;
		this.pizza_price = pizza_price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPizza_name() {
		return pizza_name;
	}

	public void setPizza_name(String pizza_name) {
		this.pizza_name = pizza_name;
	}

	public String getPizza_desc() {
		return pizza_desc;
	}

	public void setPizza_desc(String pizza_desc) {
		this.pizza_desc = pizza_desc;
	}

	public String getPizza_price() {
		return pizza_price;
	}

	public void setPizza_price(String pizza_price) {
		this.pizza_price = pizza_price;
	}
	
	
	
	

}
