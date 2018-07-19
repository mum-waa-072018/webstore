package waa.mum.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import waa.mum.edu.domain.Cart;
import waa.mum.edu.domain.CartItem;
import waa.mum.edu.domain.Product;
import waa.mum.edu.exception.InvalidCartException;
import waa.mum.edu.repository.CartRepository;
import waa.mum.edu.service.CartService;

@Service
@Transactional
public class CartServiceImpl implements CartService {

	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	ProductService productService;

	@Override
	public List<Cart> findAllByUserId(Long userId) {

		return null; // (List<Cart>) cartRepository.findAllByUserId(userId);
	}

	@Override
	public Cart findById(Long id) {
		if(id == null) {
			Cart newCart = new Cart();
			save(newCart);
			
			return newCart;
		}
			
		return cartRepository.findOne(id);
	}

	@Override
	public void save(Cart cart) {

		cartRepository.save(cart);
	}

	@Override
	public void delete(Cart cart) {

		cartRepository.delete(cart);
	}

	@Override
	public boolean exists(Long id) {

		return cartRepository.exists(id);
	}

	
	@Override
	public Cart validateCart(Long cartId) {
		Cart foundCart = findById(cartId);

		if (foundCart == null || foundCart.getItems().size() == 0)
			throw new InvalidCartException(cartId);
		
		return foundCart;
	}
}
