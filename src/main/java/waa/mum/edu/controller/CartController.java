package waa.mum.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String showCart() {
		
		return "cart";
	}

}
