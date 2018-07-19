package waa.mum.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import waa.mum.edu.domain.User;
import waa.mum.edu.service.UserService;
import waa.mum.edu.util.InvalidLoginInfoException;
import waa.mum.edu.util.UserSessionUtil;

@Controller
public class LoginController {

  @Autowired
  private UserService userService;

  @RequestMapping(value = "loginPage", method = RequestMethod.GET)
  public String getLoginPage(Model model) {
    model.addAttribute("user", new User());
    return "loginPage";
  }


  @RequestMapping(value = "loginPage", method = RequestMethod.POST)
  public String login(User user) {
    System.out.println("Login in user: " + user.toString());
    User userByName = userService.getUserByName(user.getFirstName());
    if(userByName != null && userByName.getPassword().equals(user.getPassword())) {
      System.out.println("db Users: " + userByName.toString());
      UserSessionUtil.setUser(user);
      return "redirect:/products";
    } else {
      throw new InvalidLoginInfoException();
    }
  }

  @RequestMapping(value = "logout", method = RequestMethod.GET)
  public String logout() {
    return "loginPage";
  }

  @ExceptionHandler(InvalidLoginInfoException.class)
  public String processException(InvalidLoginInfoException e, Model model) {
    model.addAttribute("error", e.getMessage());
    return "loginPage";
  }
}
