package waa.mum.edu.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.data.repository.query.Param;
import waa.mum.edu.domain.Employee;
import waa.mum.edu.domain.User;

public interface UserRepository extends CrudRepository<User, Long> {

    @Query("select u.firstName from User  u where u.id= :id")
    public String getNameById(@Param("id") Long id);

    @Query("select u from User  u where u.firstName= :name")
    public User getUserByName(@Param("name") String name);
}
