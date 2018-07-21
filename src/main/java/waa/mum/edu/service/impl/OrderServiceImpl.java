package waa.mum.edu.service.impl;


import org.springframework.transaction.annotation.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import waa.mum.edu.domain.Order;
import waa.mum.edu.repository.OrderRepository;
import waa.mum.edu.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderRepository orderRepository;
	
	@Override
	public void save(Order order) {
		
		orderRepository.save(order);
	}

}
