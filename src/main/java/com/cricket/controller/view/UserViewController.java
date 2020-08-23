package com.cricket.controller.view;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.common.AppUtil;
import com.cricket.model.City;
import com.cricket.model.PasswordResetToken;
import com.cricket.model.State;
import com.cricket.model.User;
import com.cricket.service.CityService;
import com.cricket.service.PasswordResetTokenService;
import com.cricket.service.StateService;
import com.cricket.service.UserService;

@Controller
@RequestMapping("/mvc/user")
public class UserViewController {

  @Autowired
  JavaMailSender mailSender;

  @Autowired
  private UserService userService;

  @Autowired
  private CityService cityService;

  @Autowired
  private StateService stateService;

  @Autowired
  private PasswordResetTokenService passwordResetTokenService;

  @Value("${spring.mail.from}")
  private String fromEmail;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Model model) {

    List<User> users = userService.list();
    model.addAttribute("userList", users);
    return "user/list";
  }

  @RequestMapping(value = "/view", method = RequestMethod.GET)
  public String view(@RequestParam(required = false) Long id, Model model) {
    // if id is null than user adding is new one
    User user = new User();
    if (id != null) {
      user = userService.get(id);
    }

    // city list dropdown
    List<City> cityList = cityService.list();

    // state list dropdown
    List<State> stateList = stateService.list(null);

    List<String> roleList = new ArrayList<String>();
    roleList.add("ADMIN");
    roleList.add("SALES");

    model.addAttribute("user", user);
    model.addAttribute("roleList", roleList);
    model.addAttribute("cityList", cityList);
    model.addAttribute("stateList", stateList);
    return "user/view";
  }

  @RequestMapping(value = "/save", method = RequestMethod.POST)
  public String save(@ModelAttribute("user") User user, Model model, RedirectAttributes rm,
      HttpServletRequest request) {

    // saving city in database
    if (user.getId() != null) {
      userService.update(user.getId(), user);
      rm.addFlashAttribute("message", "Record Updated Sucessfully");
    } else {
      userService.save(user);
      rm.addFlashAttribute("message", "Record Added Sucessfully");
      generatePasswordLink(user, request);
      // password reset link code will goes here
    }

    // state list dropdown
    List<State> stateList = stateService.list(null);
    model.addAttribute("stateList", stateList);
    model.addAttribute("user", user);


    return "redirect:list";
  }

  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public String save(@RequestParam(required = false) Long id, Model model, RedirectAttributes rm) {
    userService.delete(id);
    rm.addFlashAttribute("message", "Record Deleted Sucessfully");
    return "redirect:list";
  }

  @RequestMapping(value = "/isUserNameUnique", method = RequestMethod.GET)
  public @ResponseBody String isUserNameUnique(@RequestParam(required = true) String name,
      @RequestParam Long id, Model model, RedirectAttributes rm) {
    User user = userService.loadUserByUsername(name);
    if (user == null) {
      return "true";
    } else {
      if (id != null && user.getId().intValue() == id.intValue()) {
        return "true";
      }
    }
    return "false";
  }

  @RequestMapping(value = "/isEmailUnique", method = RequestMethod.GET)
  public @ResponseBody String isEmailUnique(@RequestParam(required = true) String email,
      @RequestParam Long id, Model model, RedirectAttributes rm) {
    User user = userService.getUserByEmail(email);
    if (user == null) {
      return "true";
    } else {
      if (id != null && user.getId().intValue() == id.intValue()) {
        return "true";
      }
    }
    return "false";
  }

  @RequestMapping(value = "/isEmployeeIdUnique", method = RequestMethod.GET)
  public @ResponseBody String isEmployeeIdUnique(@RequestParam(required = true) String employeeId,
      @RequestParam Long id, Model model, RedirectAttributes rm) {
    User user = userService.getUserByEmployeeId(employeeId);
    if (user == null) {
      return "true";
    } else {
      if (id != null && user.getId().intValue() == id.intValue()) {
        return "true";
      }
    }
    return "false";
  }

  private void generatePasswordLink(User user, HttpServletRequest request) {
    String token = UUID.randomUUID().toString();
    PasswordResetToken passwordResetToken = new PasswordResetToken();
    passwordResetToken.setToken(token);
    passwordResetToken.setUser(user);
    passwordResetTokenService.createPasswordResetTokenForUser(passwordResetToken);

    String resetLink = "/mvc/security/changePassword?id=" + user.getId() + "&token=" + token;
    resetLink = AppUtil.createURL(request, resetLink);
    String subject = "Password Reset link for HOLCIM dashboard";
    String body = "Hi User,\r\n Please find the reset link below \r\n" + resetLink;

    System.out.println("--------------------");
    System.out.println("resetLink" + resetLink);
    System.out.println("--------------------");
    SimpleMailMessage mailMessage = AppUtil.constructEmail(subject, body, user, fromEmail);
    mailSender.send(mailMessage);
  }
}
