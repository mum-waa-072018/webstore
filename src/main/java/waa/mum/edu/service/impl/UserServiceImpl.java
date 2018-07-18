package waa.mum.edu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import waa.mum.edu.domain.User;
import waa.mum.edu.repository.UserRepository;
import waa.mum.edu.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

//  @Autowired
//  private PasswordEncoder passwordEncoder;

  @Autowired
  private UserRepository userRepository;

  public void addUser(User user) {
//    user.setPassword(passwordEncoder.encode(user.getPassword()));
    userRepository.save(user);
  }
}
