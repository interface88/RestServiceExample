package com.cricket.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.util.NumberUtils;


public class Util {


  /**** Method #3 - This Method Is Used To Set The Download File Properties ****/
  public static void downloadFileProperties(HttpServletRequest req, HttpServletResponse resp,
      String toBeDownloadedFile, File downloadFile) {
    try {

      /**** Get The Mime Type Of The File & Setting The Binary Type If The Mime Mapping Is Not Found ****/
      String mimeType = req.getSession().getServletContext().getMimeType(toBeDownloadedFile);
      if (mimeType == null) {
        mimeType = "application/octet-stream";
      }

      /**** Setting The Content Attributes For The Response Object ****/
      resp.setContentType(mimeType);
      resp.setContentLength((int) downloadFile.length());

      /**** Setting The Headers For The Response Object ****/
      String headerKey = "Content-Disposition";
      String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
      resp.setHeader(headerKey, headerValue);

      /**** Get The Output Stream Of The Response ****/
      OutputStream outStream = resp.getOutputStream();
      FileInputStream inputStream = new FileInputStream(downloadFile);
      byte[] buffer = new byte[4096];
      int bytesRead = -1;

      /****
       * Write Each Byte Of Data Read From The Input Stream Write Each Byte Of Data Read From The
       * Input Stream Into The Output Stream
       ****/
      while ((bytesRead = inputStream.read(buffer)) != -1) {
        outStream.write(buffer, 0, bytesRead);
      }

      inputStream.close();
      outStream.close();
    } catch (IOException ioExObj) {
    }
  }

  public static String convertToString(Object o, String defaultValue) {
    if (o == null) {
      return defaultValue;
    }
    return o.toString();
  }

  public static Integer convertToInt(Object o, Integer defaultValue) {
    if (o == null) {
      return defaultValue;
    }
    return NumberUtils.parseNumber(convertToString(o, "0"), Integer.class);
  }
}
