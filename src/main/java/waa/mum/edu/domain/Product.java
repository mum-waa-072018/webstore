package waa.mum.edu.domain;

import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Min;

@Entity
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
 	private Long id;
	@Column
	@NotEmpty(message="Enter Title.")
	private String title;
	@Column
	@NotEmpty(message="Enter Description.")
    private String description;	
	@Column
	@Min(value=1, message="Enter at least 1 item")
	private int quantity;

	@Column
	@NotEmpty(message="Enter Item Condition.")
	private String conditions;
	
	@Column
	@Min(value=1, message="Enter Item Price")
	private double price;
	
	@Column
	private int status;
	

	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getConditions() {
		return conditions;
	}
	public void setConditions(String conditions) {
		this.conditions = conditions;
	}
	@Column
	private String color;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", title=" + title + ", description=" + description + ", quantity=" + quantity
				+ ", conditions=" + conditions + ", color=" + color + "]";
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	

 
}
