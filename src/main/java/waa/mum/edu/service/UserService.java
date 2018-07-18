package waa.mum.edu.service;

import waa.mum.edu.domain.User;

public interface UserService {
  void addUser(User user);

  User getUserById(Long id);

  String getNameById(Long id);

  public User getUserByName(String name);

}
