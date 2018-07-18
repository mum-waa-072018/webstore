package waa.mum.edu.repository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import waa.mum.edu.domain.Employee;
import waa.mum.edu.domain.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>
{
        @Query(value = "SELECT e FROM Product e WHERE e.id =?1")
        public Employee findEmployeeByEmployeeNumber(int number);


  }

