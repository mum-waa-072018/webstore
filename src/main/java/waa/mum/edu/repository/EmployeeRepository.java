package waa.mum.edu.repository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import waa.mum.edu.domain.Employee;

	@Repository
	public interface EmployeeRepository extends  CrudRepository<Employee, Long> 
	{
		@Query("select e from Employee  e where e.id= :id")
		public Employee findByEmployeeNumber(@Param("id") Long employeeNumber);
 	}

