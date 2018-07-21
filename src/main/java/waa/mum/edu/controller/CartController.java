package waa.mum.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import waa.mum.edu.domain.Cart;
import waa.mum.edu.domain.User;
import waa.mum.edu.service.CartService;
import waa.mum.edu.util.UserSessionUtil;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	CartService cartService;

	@RequestMapping(value = {""}, method = RequestMethod.POST)
	@ResponseBody
	public String saveCart(@RequestBody Cart cart) {
		User user =UserSessionUtil.currentUser();

		if(null==user){
			return "loginPage";
		}
		cartService.save(cart);
		
		return cart.getId().toString();
	}
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String showCart() {
		
		return "cart";
	}

}
