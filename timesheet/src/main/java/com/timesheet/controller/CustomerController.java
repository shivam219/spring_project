package com.timesheet.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Customer;
import com.timesheet.model.User;
import com.timesheet.repository.CustomerDomainRepository;
import com.timesheet.repository.CustomerRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@Autowired
	UserRepository ur;

	@Autowired
	CustomerDomainRepository cdr;

	@Autowired
	CustomerRepository cr;

	@ModelAttribute
	public void commonDataModel(Model m) {
		m.addAttribute("customerList", customerService.getAllcustomer());
	}

	/*
	 * Access Add customer page
	 */
	@GetMapping("/customer-add")
	public ModelAndView getCustomerMaster() {
		ModelAndView m = new ModelAndView("customer-add");
		m.addObject("users", (List<User>) ur.findAll());
		m.addObject("customerDomains", (List<CustomerDomain>) cdr.findAll());
		return m;
	}

	/*
	 * Adding customer
	 */
	@PostMapping("/customer-add-process")
	public ResponseEntity<Object> customermasterprocess(Model model, @RequestBody Customer customer) {
		customer.setOnBoardDate(new SimpleDateFormat("yyyy-mm-dd").format(new Date()));
		Optional<CustomerDomain> domain = cdr.findById(customer.getCustomerDomain().getId());
		Optional<User> user = ur.findById(customer.getUser().getEmpId());
		if (user.isEmpty()) {
			return ResponseEntity.status(HttpStatus.FOUND).body("Invalid Ess User");
		} else {
			customer.setUser(user.get());
			customer.setCustomerDomain(domain.get());
			customerService.save(customer);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("Created Customer");
		}
	}

	@GetMapping("customer-master")
	public String CustomerMasterDashboard(Model m) {
		m.addAttribute("customerdata", customerService.getAllcustomer());
		return "customer-master";
	}

	@GetMapping("customer-edit")
	public ModelAndView customerEdit(@RequestParam("customerId") Customer customer) {
		ModelAndView m = new ModelAndView("customer-edit");
		m.addObject("users", (List<User>) ur.findAll());
		m.addObject("customerDomains", (List<CustomerDomain>) cdr.findAll());
		m.addObject("customer", (customer));
		return m;
	}

	/*
	 * Editing Customer
	 */
	@PostMapping("/customer-edit-process")
	public ResponseEntity<Object> customerEditProcess(@RequestBody Customer customer) {
		Optional<Customer> c = cr.findById(customer.getCustomerId());
		Optional<CustomerDomain> domain = cdr.findById(customer.getCustomerDomain().getId());
		Optional<User> user = ur.findById(customer.getUser().getEmpId());
		if (user.isEmpty()) {
			return ResponseEntity.status(HttpStatus.FOUND).body("Invalid Ess User");
		} else {
			customer.setOnBoardDate(c.get().getOnBoardDate());
			customer.setUser(user.get());
			customer.setCustomerDomain(domain.get());
			customerService.save(customer);
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Created Customer");
	}

	/*
	 * Editing customer
	 */
	@GetMapping("/customer-delete")
	public ResponseEntity<Object> deleteCustomnerByCustomerId(Model m, @RequestParam("customerId") long CustId) {
		customerService.deleteCustomnerByCustomerId(CustId);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Deleted");
	}

	/*
	 * Access add customer domain
	 */
	@GetMapping(value = "/customer-domain")
	public String getCustomerDomain() {
		return "customer-domain";
	}

	/*
	 * Adding customer domain
	 */
	@PostMapping(value = "/customer-domain-create")
	public ResponseEntity<Object> getCustomerDomainCreate(@RequestBody CustomerDomain customerDomain) {
		cdr.save(customerDomain);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Deleted");
	}

}
