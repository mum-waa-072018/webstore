package waa.mum.edu.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import waa.mum.edu.domain.Cart;

@Repository
public interface CartRepository extends CrudRepository<Cart, Long> {}
