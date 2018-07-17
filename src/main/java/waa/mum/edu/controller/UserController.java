package waa.mum.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import waa.mum.edu.domain.Address;
import waa.mum.edu.domain.Telephone;
import waa.mum.edu.domain.User;
import waa.mum.edu.service.UserService;


@Controller
@RequestMapping("users")
public class UserController {

  @Autowired
  private UserService userService;

  @RequestMapping(value = "user", method = RequestMethod.GET)
  @ResponseBody
  public User addUser() {
    Telephone telephone = new Telephone("100", "222", "1222");
    List<Telephone> phones = new ArrayList<Telephone>();
    Address address = new Address("N 4 Str", "Fairfield", "IA", "52557");
    phones.add(telephone);
    User user = new User("Yuliang", "Jin", new Date(), address, "USER", phones, "kjkjk");
    userService.addUser(user);
    return user;
  }
}
