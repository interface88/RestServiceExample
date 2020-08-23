package com.cricket.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cricket.model.City;
import com.cricket.model.Customer;
import com.cricket.service.CustomerService;
import com.cricket.vo.CustomerVO;

@RequestMapping("/api")
@RestController
public class CustomerController {

  @Autowired
  private CustomerService customerService;

  @Value("${file.upload.path}")
  private String fileUploadPath;

  /*---Add new customer---*/
  @PostMapping("/customer")
  public ResponseEntity<?> save(@RequestBody CustomerVO customerVO) {
    Customer customer = convertVOtoDTO(customerVO);
    Date now = new Date();
    customer.setCreatedDate(now);
    long id = customerService.save(customer);
    return ResponseEntity.ok().body("New Customer has been saved with ID:" + id);
  }

  /*---Get a customer by id---*/
  @GetMapping("/customer/{id}")
  public ResponseEntity<Customer> get(@PathVariable("id") long id) {
    Customer customer = customerService.get(id);
    return ResponseEntity.ok().body(customer);
  }

  /*---get all customers---*/
  @GetMapping("/customer")
  public ResponseEntity<List<CustomerVO>> list() {
    List<Customer> customers = customerService.list();
    List<CustomerVO> customerVOList = new ArrayList<CustomerVO>();
    for (Customer product : customers) {
      customerVOList.add(convertDTOtoVO(product));
    }
    return ResponseEntity.ok().body(customerVOList);
  }

  /*---Update a customer by id---*/
  @PutMapping("/customer/{id}")
  public ResponseEntity<?> update(@PathVariable("id") long id, @RequestBody Customer customer) {
    customerService.update(id, customer);
    return ResponseEntity.ok().body("Customer has been updated successfully.");
  }

  /*---Delete a customer by id---*/
  @DeleteMapping("/customer/{id}")
  public ResponseEntity<?> delete(@PathVariable("id") long id) {
    customerService.delete(id);
    return ResponseEntity.ok().body("Customer has been deleted successfully.");
  }

  @RequestMapping(value = "/fileupload", headers = ("content-type=multipart/*"),
      method = RequestMethod.POST)
  public ResponseEntity<String> productImageUpload(@RequestParam("file") MultipartFile inputFile,
      @RequestParam("zipfile") String zipfile, @RequestParam("productId") Long productId,
      @RequestParam("scenarioId") Long scenarioId, HttpServletRequest request) {
    if (!inputFile.isEmpty()) {
      try {
        // First we will create directory if it does not exist
        // String directoryPath = request.getRealPath(CustomerService.CUSTOMER_ZIP_FILE_PATH +
        // zipfile);
        String directoryPath = fileUploadPath + File.separator + zipfile;
        File directory = new File(directoryPath);
        if (!directory.exists()) {
          directory.mkdir();
        }


        String originalFilename = inputFile.getOriginalFilename();
        System.out.println(directoryPath + File.separator + originalFilename);


        File destinationFile = new File(directoryPath + File.separator + originalFilename);
        inputFile.transferTo(destinationFile);

        // code will execute further if file placed in correct path
        customerService.addProduct(zipfile, productId, scenarioId); // entering detail in database
        return ResponseEntity.ok().body("File Uploaded Successfully on folder : " + fileUploadPath);

      } catch (Exception e) {
        e.printStackTrace();
        return ResponseEntity.ok().body("Errr while uploading");
      }
    } else {
      return ResponseEntity.ok().body("Input data is blank");
    }
  }

  private CustomerVO convertDTOtoVO(Customer customer) {
    CustomerVO customerVO = new CustomerVO();
    customerVO.setId(customer.getId());

    customerVO.setCustomerName(customer.getCustomerName());

    customerVO.setEmail(customer.getEmail());

    customerVO.setPhone(customer.getPhone());

    customerVO.setZipfile(customer.getZipfile());

    customerVO.setCityId(customer.getCity().getId());
    customerVO.setCityName(customer.getCity().getCityName());

    customerVO.setCreatedDate(customer.getCreatedDate());

    return customerVO;
  }

  private Customer convertVOtoDTO(CustomerVO customer) {
    Customer customerVO = new Customer();
    customerVO.setId(customer.getId());

    customerVO.setCustomerName(customer.getCustomerName());

    customerVO.setEmail(customer.getEmail());

    customerVO.setPhone(customer.getPhone());

    customerVO.setZipfile(customer.getZipfile());

    City city = new City();
    city.setId(customer.getCityId());
    customerVO.setCity(city);

    // customerVO.setCreatedDate(customer.getCreatedDate());

    return customerVO;
  }
}
