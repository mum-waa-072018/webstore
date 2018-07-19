package waa.mum.edu.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Cart implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "cart_id", unique = false)
//	@MapKeyJoinColumn(name = "product")
	private List<CartItem> items;

	private double totalCost = 0;
	
	public Cart() {
		items = new ArrayList<>();
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Collection<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}

//	public void addItem(CartItem cartItem) {
//		if (items.containsKey(cartItem.getProduct().getId())) {
//			CartItem existingCartItem = items.get(cartItem.getProduct().getId());
//			existingCartItem.setQuantity(existingCartItem.getQuantity() + cartItem.getQuantity());
//			updateCost();
//		} else {
//			items.put(cartItem.getProduct().getId(), cartItem);
//			updateCost();
//		}
//	}
//	
//	public void removeItem(Long productId) {
//		items.remove(productId);
//		updateCost();
//	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}
	
	public void updateCost() {
		double totalCost = 0;
		for(CartItem cartItem: getItems()) {
			totalCost += cartItem.getCost();
		}
		
		setTotalCost(totalCost);
	}
}
