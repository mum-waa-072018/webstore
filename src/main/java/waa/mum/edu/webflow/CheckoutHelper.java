package waa.mum.edu.webflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import waa.mum.edu.domain.Address;
import waa.mum.edu.domain.BillingInfo;
import waa.mum.edu.domain.Cart;
import waa.mum.edu.domain.Order;
import waa.mum.edu.service.CartService;
import waa.mum.edu.service.OrderService;

@Component
public class CheckoutHelper {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	OrderService orderService;
	
	public Cart validateCart(Long cartId) {
		
		return cartService.validateCart(cartId);
	}
	
	public void saveOrder(Order order, Address shippingAddress, BillingInfo billingInfo) {
		cartService.save(order.getCart());
		order.setShippingAddress(shippingAddress);
		order.setBillingInfo(billingInfo);
		
		orderService.save(order);
	}
}
