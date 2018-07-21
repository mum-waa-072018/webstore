package waa.mum.edu.webflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import waa.mum.edu.domain.Address;
import waa.mum.edu.domain.BillingInfo;
import waa.mum.edu.domain.CustomerOrder;
import waa.mum.edu.exception.InvalidOrderException;
import waa.mum.edu.service.OrderService;

@Component
public class CheckoutHelper {
	
	@Autowired
	OrderService orderService;
	
	public CustomerOrder validateOrder(Long orderId) {
		CustomerOrder order = orderService.findOne(orderId);
		
		if(order != null)
			return order;
		
		throw new InvalidOrderException(orderId);
	}
	
	public void saveOrder(CustomerOrder order, Address shippingAddress, BillingInfo billingInfo) {
		
		order.setShippingAddress(shippingAddress);
		order.setBillingInfo(billingInfo);
		
		orderService.save(order);
	}
}
