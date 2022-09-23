package com.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
public class CustomerMasterController {

	@Autowired
	CustomerService customerService;

	@ModelAttribute
	public void commonDataModel(Model m) {
		m.addAttribute("customerdata", customerService.getAllcustomer());
	}

	@GetMapping("CustomerMasterDashboard")
	public String CustomerMasterDashboard(Model m) {
		m.addAttribute("customerdata", customerService.getAllcustomer());
		return "CustomerMasterDashboard";
	}

	@PostMapping("/customermasterprocess")
	public String customermasterprocess(Model model, @ModelAttribute Customer customer) {
		customerService.save(customer);
		return "CustomerMasterDashboard";
	}
	@GetMapping(value = "/addproject")
	public String getprojectmaster(Model m) {
		m.addAttribute("customerdata", customerService.getAllcustomer());
		System.out.println(" called add prkject");
		return "addproject";

	}
	@GetMapping("/customerdelete")
	public String deleteCustomnerByCustomerId(Model m, @RequestParam("customerId") long CustId) {
		customerService.deleteCustomnerByCustomerId(CustId);
		commonDataModel(m);
		return "CustomerMasterDashboard";
	}

}
