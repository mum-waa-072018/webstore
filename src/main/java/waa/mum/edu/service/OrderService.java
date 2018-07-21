package waa.mum.edu.service;

import waa.mum.edu.domain.CustomerOrder;

public interface OrderService {
	void save(CustomerOrder order);
	
	CustomerOrder findOne(Long orderId);
	
}
