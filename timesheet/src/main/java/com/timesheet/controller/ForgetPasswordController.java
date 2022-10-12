package com.timesheet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ForgetPasswordController {

	@GetMapping(value = "/forget-password")
	public String getForgetPassword() {
		return "forget-password";
	}
}
