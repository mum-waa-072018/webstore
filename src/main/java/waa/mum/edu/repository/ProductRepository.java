package waa.mum.edu.repository;


import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import waa.mum.edu.domain.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>
{
        /*@Query(value = "SELECT e FROM Product e WHERE e.id =?1")
        public Employee findEmployeeByEmployeeNumber(int number);*/
        @Modifying
        @Query(value = "UPDATE Product e SET e.status = 0 WHERE e.id =:id")
        public void sddd(@Param("id") Long id);
        //UPDATE `employee` SET `title` = 'Torque Masterd' WHERE `employee`.`id` = 2;


  }

