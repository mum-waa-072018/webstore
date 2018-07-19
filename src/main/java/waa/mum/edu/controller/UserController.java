package waa.mum.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import waa.mum.edu.domain.Address;
import waa.mum.edu.domain.Role;
import waa.mum.edu.domain.Telephone;
import waa.mum.edu.domain.User;
import waa.mum.edu.service.UserService;


@Controller
@RequestMapping("users")
public class UserController {

  @Autowired
  private UserService userService;

  @SuppressWarnings("unchecked")
  @RequestMapping(value = "/addPhones", method = RequestMethod.POST)
  public @ResponseBody Telephone savePhone( @RequestBody Telephone phone, Model model) {
    List<Telephone> phoneList = (List<Telephone>) model.asMap().get("phoneList");
    phoneList.add(phone);
    System.out.println("WWW:" + phone);
    return phone;
  }

  @RequestMapping(value = "register", method = RequestMethod.GET)
  public ModelAndView getRegistrationPage(@ModelAttribute Telephone phone, Model model) {
    ArrayList<Telephone> telephones = new ArrayList<>();
    model.addAttribute("phoneList", telephones);
    model.addAttribute("phone", new Telephone());
    model.addAttribute("user", new User());
    ModelAndView mav = new ModelAndView();
    mav.setViewName("register");
    return mav;
  }
//  @ResponseBody
//  public User addUser() {
//    Telephone telephone = new Telephone("100", "222", "1222");
//    List<Telephone> phones = new ArrayList<Telephone>();
//    Address address = new Address("N 4 Str", "Fairfield", "IA", "52557");
//    phones.add(telephone);
//    Role role = new Role("Yuliang", "ROLE_USER");
//    Role role1 = new Role("Yuliang", "ROLE_ADMIN");
//    List<Role> roles = new ArrayList<>();
//    roles.add(role);
//    roles.add(role1);
//    User user = new User("Yuliang", "Jin", new Date(), address, roles, phones, "kjkjk");
//    userService.addUser(user);
//    return user;
//  }

  @RequestMapping(value = "user", method = RequestMethod.POST)
  public String register(@Valid @ModelAttribute User user, BindingResult bindingResult, Model model) {
    if(bindingResult.hasErrors()) {
      return "register";
    }
    userService.addUser(user);
    System.out.println("WWW:" + user.toString());
    return "loginPage";
  }

  @PreAuthorize("hasRole('ROLE_ADMIN')")
  @RequestMapping(value = "hello", method = RequestMethod.GET)
  @ResponseBody
  public User getUser() {
    Telephone telephone = new Telephone("100", "222", "1222");
    List<Telephone> phones = new ArrayList<Telephone>();
    Address address = new Address("N 4 Str", "Fairfield", "IA", "52557");
    phones.add(telephone);
    Role role = new Role("Yuliang", "ROLE_USER");
    List<Role> roles = new ArrayList<>();
    roles.add(role);
    User user = new User("Yuliang", "Jin", new Date(), address, roles, telephone, "kjkjk");
    return user;
  }
}
