package waa.mum.edu.repository;

import org.springframework.data.repository.CrudRepository;

import waa.mum.edu.domain.User;

public interface UserRepository extends CrudRepository<User, Long> {
}
