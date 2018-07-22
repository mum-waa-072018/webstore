package waa.mum.edu.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import waa.mum.edu.domain.CustomerOrder;
import waa.mum.edu.repository.OrderRepository;
import waa.mum.edu.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderRepository orderRepository;
	
	@Override
	public void save(CustomerOrder order) {
		
		orderRepository.save(order);
	}

	@Override
	public CustomerOrder findOne(Long orderId) {
		
		return orderRepository.findOne(orderId);
	}

	@Override
	public Iterable<CustomerOrder> findAll() {
		
		return orderRepository.findAll();
	}

}
