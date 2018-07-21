package waa.mum.edu.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import waa.mum.edu.domain.Order;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {}
