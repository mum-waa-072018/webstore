package waa.mum.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import waa.mum.edu.domain.Cart;
import waa.mum.edu.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	CartService cartService;

	@RequestMapping(value = {""}, method = RequestMethod.POST)
	@ResponseBody
	public Cart getCartItems(@RequestBody Cart cart) {
		
		cartService.save(cart);
		
		return cart;
	}
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String showCart() {
		
		return "cart";
	}

}
