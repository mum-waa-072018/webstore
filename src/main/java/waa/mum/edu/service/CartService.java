package waa.mum.edu.service;

import java.util.List;

import waa.mum.edu.domain.Cart;
import waa.mum.edu.domain.CartItem;

public interface CartService {

	List<Cart> findAllByUserId(Long userId);
	
	Cart findById(Long id);
	
	void save(Cart cart);
	
	void delete(Cart cart);
	
	boolean exists(Long id);

	Cart validateCart(Long cartId);
}
