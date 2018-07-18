package waa.mum.edu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import waa.mum.edu.domain.User;
import waa.mum.edu.repository.UserRepository;
import waa.mum.edu.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {
  @Autowired
  private UserRepository userRepository;

  public void addUser(User user) {
    userRepository.save(user);
  }

  public User getUserById(Long id) {
    return userRepository.findOne(id);
  }

  public String getNameById(Long id) {
    return userRepository.getNameById(id);
  }

  public User getUserByName(String name){return userRepository.getUserByName(name);};

}
