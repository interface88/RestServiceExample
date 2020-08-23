package com.cricket.controller.view;

import java.util.Arrays;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cricket.common.AppUtil;
import com.cricket.model.PasswordResetToken;
import com.cricket.model.User;
import com.cricket.service.CityService;
import com.cricket.service.PasswordResetTokenService;
import com.cricket.service.StateService;
import com.cricket.service.UserService;
import com.cricket.vo.PasswordVO;

@Controller
@RequestMapping("/mvc/security")
public class SecurityViewController {

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

  @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
  public String showChangePasswordPage(Model model, @RequestParam("id") long id,
      @RequestParam("token") String token) {
    String result = validatePasswordResetToken(id, token);
    if (result != null) {
      model.addAttribute("message", "Invalid token");
      return "error";
    }
    return "user/updatePassword";
  }

  // ------- other user functionality ------
  @RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
  public String resetPassword(Model model, HttpServletRequest request) {
    return "resetPassword";
  }

  @RequestMapping(value = "/sendResetPasswordLink", method = RequestMethod.POST)
  public String sendResetPasswordLink(@RequestParam("email") String email, Model model,
      HttpServletRequest request) {
    User user = userService.getUserByEmail(email);
    if (user == null) {
      model.addAttribute("error", "No user found with given E-Mail ID.");
    } else {
      generatePasswordLink(user, request);
      // model.addAttribute("message", "Password reset link send to your E-Mail ID.");
      return "redirect:/loginPage";
    }
    return "resetPassword";
  }

  @RequestMapping(value = "/savePassword", method = RequestMethod.POST)
  public String updatePassword(Model model, PasswordVO passwordVO) {
    User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    String hashedPassword = passwordEncoder.encode(passwordVO.getNewPassword());
    userService.changeUserPassword(user.getName(), hashedPassword);
    return "redirect: /";
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

  private String validatePasswordResetToken(long id, String token) {
    PasswordResetToken passToken = passwordResetTokenService.findByToken(token);
    if ((passToken == null) || (passToken.getUser().getId() != id)) {
      return "invalidToken";
    }

    // currently no token get expired.
    /*
     * Calendar cal = Calendar.getInstance(); if ((passToken.getExpiryDate() .getTime() -
     * cal.getTime() .getTime()) <= 0) { return "expired"; }
     */

    User user = passToken.getUser();
    Authentication auth =
        new UsernamePasswordAuthenticationToken(user, null,
            Arrays.asList(new SimpleGrantedAuthority("CHANGE_PASSWORD_PRIVILEGE")));
    SecurityContextHolder.getContext().setAuthentication(auth);
    return null;
  }



}
