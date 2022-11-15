package com.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.Customer;
import com.timesheet.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@ModelAttribute
	public void commonDataModel(Model m) {
		m.addAttribute("customerList", customerService.getAllcustomer());
	}

	@GetMapping("/customer-add")
	public String getCustomerMaster() {
		return "customer-add";
	}
	
	@GetMapping("customer-dashboard")
	public String CustomerMasterDashboard(Model m) {
		m.addAttribute("customerdata", customerService.getAllcustomer());
		return "customer-dashboard";
	}

	@PostMapping("/customer-process")
	public String customermasterprocess(Model model, @ModelAttribute Customer customer) {
		customerService.save(customer);
		return "redirect:/customer-dashboard";
	}

	@GetMapping("/customer-delete")
	public ResponseEntity<Object> deleteCustomnerByCustomerId(Model m, @RequestParam("customerId") long CustId) {
			customerService.deleteCustomnerByCustomerId(CustId);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Deleted");
	}

}
