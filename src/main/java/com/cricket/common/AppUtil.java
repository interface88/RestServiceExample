package com.cricket.common;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import org.springframework.mail.SimpleMailMessage;

import com.cricket.model.User;

public class AppUtil {

  public static SimpleMailMessage constructEmail(String subject, String body, User user, String from) {
    SimpleMailMessage email = new SimpleMailMessage();
    email.setSubject(subject);
    email.setText(body);
    email.setTo(user.getEmail());
    email.setFrom(from);
    return email;
  }

  public static String generateUniqueString(int length) {
	  int leftLimit = 48; // numeral '0'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = length;
	    Random random = new Random();

	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	      .limit(targetStringLength)
	      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	      .toString();
	    return generatedString;
  }


  public static String createURL(HttpServletRequest request, String resourcePath) {

    int port = request.getServerPort();
    StringBuilder result = new StringBuilder();
    result.append(request.getScheme()).append("://").append(request.getServerName());

    if ((request.getScheme().equals("http") && port != 80)
        || (request.getScheme().equals("https") && port != 443)) {
      result.append(':').append(port);
    }

    result.append(request.getContextPath());

    if (resourcePath != null && resourcePath.length() > 0) {
      if (!resourcePath.startsWith("/")) {
        result.append("/");
      }
      result.append(resourcePath);
    }
    return result.toString();
  }

}
