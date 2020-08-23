package com.cricket.controller.view;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cricket.common.Util;
import com.cricket.model.Customer;
import com.cricket.model.Scenario;
import com.cricket.service.CityService;
import com.cricket.service.CustomerService;
import com.cricket.service.ScenarioService;

@Controller
@RequestMapping("/mvc/customer")
public class CustomerViewController {

  @Autowired
  private CustomerService customerService;

  @Autowired
  private ScenarioService scenarioService;

  @Autowired
  private CityService cityService;

  @Value("${file.upload.path}")
  private String fileUploadPath;


  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(@RequestParam(required = false) String startDate, @RequestParam(
      required = false) String endDate, Model model) {
    if (startDate != null && endDate != null) {
      List<Customer> customers = customerService.listByParam(startDate, endDate);
      model.addAttribute("customerList", customers);
    } else {
      List<Customer> customers = customerService.list();
      model.addAttribute("customerList", customers);
    }
    model.addAttribute("startDate", startDate);
    model.addAttribute("endDate", endDate);

    return "customer/list";
  }

  @RequestMapping(value = "/view", method = RequestMethod.GET)
  public String view(@RequestParam(required = false) Long id, Model model) {
    // if id is null than user adding is new one
    Customer customer = null;
    List<String> productList = new ArrayList<String>();
    List<String> customerScenarioList = new ArrayList<String>();
    if (id != null) {
      customer = customerService.get(id);
      productList = customerService.getInterestedProductList(customer.getId());
      customerScenarioList = customerService.getInterestedScenarioList(customer.getId());
    }

    // customer product list will goes here
    List<Scenario> scenarioList = scenarioService.list();
    model.addAttribute("productList", productList);
    model.addAttribute("cityList", cityService.list());
    model.addAttribute("scenarioList", scenarioList);
    model.addAttribute("customerScenarioList", customerScenarioList);
    model.addAttribute("customer", customer);

    return "customer/view";
  }


  @RequestMapping(value = "/save", method = RequestMethod.POST)
  public String save(@ModelAttribute("customer") Customer customer, Model model,
      RedirectAttributes rm) {

    // saving city in database
    // Customer product = convertVOtoDTO(productVO);
    if (customer.getId() != null) {
      customerService.update(customer.getId(), customer);
    } else {
      customerService.save(customer);
    }

    rm.addFlashAttribute("message", "Record Added Sucessfully");
    return "redirect:list";
  }

  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public String delete(@RequestParam(required = false) Long id, Model model, RedirectAttributes rm) {
    customerService.delete(id);
    rm.addFlashAttribute("message", "Record Deleted Sucessfully");
    return "redirect:list";
  }

  @RequestMapping(value = "/downloadSnapshot", method = RequestMethod.GET,
      produces = "application/zip")
  public void view(@RequestParam(required = true) String zipfile, Model model,
      HttpServletRequest request, HttpServletResponse response) throws IOException {
    // String directoryPath = request.getRealPath(CustomerService.CUSTOMER_ZIP_FILE_PATH);
    String directoryPath = fileUploadPath;
    // zip code will goes here
    String filePath = directoryPath + File.separator + zipfile;
    File downloadFolder = new File(filePath);
    if (downloadFolder.exists()) {



      response.setContentType("application/zip");
      response.setStatus(HttpServletResponse.SC_OK);
      response.addHeader("Content-Disposition", "attachment; filename=\"" + zipfile + ".zip\"");

      // creating byteArray stream, make it bufforable and passing this buffor to ZipOutputStream
      ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
      BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(byteArrayOutputStream);
      ZipOutputStream zipOutputStream = new ZipOutputStream(bufferedOutputStream);

      // simple file list, just for tests
      ArrayList<File> files = new ArrayList<>(2);
      files.add(new File("README.md"));

      if (downloadFolder.listFiles() != null) {
        // packing files
        for (final File file : downloadFolder.listFiles()) {
          if (file.isFile()) {
            // new zip entry and copying inputstream with file to zipOutputStream, after all closing
            // streams
            zipOutputStream.putNextEntry(new ZipEntry(file.getName()));
            FileInputStream fileInputStream = new FileInputStream(file);

            IOUtils.copy(fileInputStream, zipOutputStream);

            fileInputStream.close();
            zipOutputStream.closeEntry();
          }

        }

      }
      if (zipOutputStream != null) {
        zipOutputStream.finish();
        zipOutputStream.flush();
        IOUtils.closeQuietly(zipOutputStream);
      }
      IOUtils.closeQuietly(bufferedOutputStream);
      IOUtils.closeQuietly(byteArrayOutputStream);

      File someFile = new File(zipfile + ".zip");
      OutputStream outputStream = new FileOutputStream(someFile);
      byteArrayOutputStream.writeTo(outputStream);
      outputStream.close();
      Util.downloadFileProperties(request, response, zipfile + ".zip", someFile);
      // return byteArrayOutputStream.toByteArray();


    } else {
      // return null;
    }
  }



}
