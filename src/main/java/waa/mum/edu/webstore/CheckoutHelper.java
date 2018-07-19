package waa.mum.edu.webstore;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import waa.mum.edu.domain.Cart;
import waa.mum.edu.exception.InvalidCartException;
import waa.mum.edu.service.CartService;

@Component
public class CheckoutHelper {
	
	@Autowired
	CartService cartService;
	
	public Cart validateCart(Long cartId) {
		
		return cartService.validateCart(cartId);
	}
}
