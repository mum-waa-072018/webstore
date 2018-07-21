package waa.mum.edu.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import waa.mum.edu.domain.CustomerOrder;

@Repository
public interface OrderRepository extends CrudRepository<CustomerOrder, Long> {}
