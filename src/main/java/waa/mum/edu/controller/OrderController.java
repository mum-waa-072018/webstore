package waa.mum.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import waa.mum.edu.domain.Cart;
import waa.mum.edu.domain.CustomerOrder;
import waa.mum.edu.domain.User;
import waa.mum.edu.service.OrderService;
import waa.mum.edu.util.UserSessionUtil;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = {""}, method = RequestMethod.POST)
	@ResponseBody
	public String createOrder(@RequestBody Cart cart) {
		User user =UserSessionUtil.currentUser();

//		if(null==user){
//			return "loginPage";
//		}
		
		CustomerOrder order = new CustomerOrder();
		order.setCart(cart);
		
		orderService.save(order);
		
		return order.getId().toString();
	}
}
