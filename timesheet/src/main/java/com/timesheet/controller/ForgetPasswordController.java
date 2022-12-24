package com.timesheet.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.EmailService;

@Controller
public class ForgetPasswordController {

	@Autowired
	EmployeeRepository er;

	@Autowired
	EmailService emailService;

	@Autowired
	UserRepository ur;

	/*
	 * Access forget password page
	 */
	@GetMapping(value = "/forget-password")
	public String getForgetPassword() {
		return "forget-password";
	}

	/*
	 * Access forget password page
	 */
	@GetMapping(value = "/forget-pass")
	public String getForgetPassword2() {
		return "forget-pass";
	}

	/*
	 * Forget Password Sending mail on ESS mail Id
	 */
	@PostMapping(value = "/forget-pass")
	public String getForgetPassPost(@RequestParam("email") String email, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (er.findByEmpEmailIgnoreCase(email) != null) {
			String otp = String.valueOf(OTP(6));
			String msg = "<b>OTP : " + otp + "</b>";
			String subject = "Forget Password email";
			try {
				emailService.sendEmail(email, msg, subject);

			} catch (Exception e) {
				session.setAttribute("error", "	Specified Email doesn't meet ");
				return "redirect:/forget-pass";
			}
			session.setAttribute("email", email);
			session.setAttribute("otp", otp);
			session.setAttribute("error", "");
			return "redirect:/forget-pass-get-otp";
		} else {
			session.setAttribute("error", "	Specified Email doesn't meet");
			return "redirect:/forget-pass";
		}
	}

	/*
	 * Access Verify OTP page
	 */
	@GetMapping(value = "/forget-pass-get-otp")
	public String getForgetPasswordGetOtp(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("email") != null) {
			return "forget-pass-get-otp";
		} else {
			return "redirect:/forget-pass";
		}
	}

	/*
	 * Forget Password Verify OTP
	 */
	@PostMapping(value = "/forget-pass-get-otp")
	public String getForgetPassPostGetOtp(@RequestParam("otp") String otp, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("error", "");
		if (session.getAttribute("email") != null) {

			if (session.getAttribute("otp").toString().equals(otp)) {
				session.setAttribute("userOTP", otp);
				return "redirect:/forget-pass-change-pass";
			} else {
				session.setAttribute("error", "Wrong OTP !!");
				return "redirect:/forget-pass-get-otp";
			}

		} else {
			session.setAttribute("error", "");
			return "redirect:/forget-pass";
		}
	}

	/*
	 * Access Change password
	 */
	@GetMapping(value = "/forget-pass-change-pass")
	public String getForgetPasswordChagePass(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("email") != null && session.getAttribute("userOTP") != null) {
			return "forget-pass-change-pass";
		} else {
			session.setAttribute("error", "");
			return "redirect:/forget-pass";
		}
	}

	/*
	 * Change password page
	 */
	@PostMapping(value = "/forget-pass-change-pass")
	public String getForgetPasswordChagePass(@RequestParam("password") String password, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("email") != null && session.getAttribute("userOTP") != null) {
			Long empId = er.findByEmpEmailIgnoreCase(session.getAttribute("email").toString());
			if (empId == null) {
				session.setAttribute("error", "passsword should be more 3 character !!!");
				return "redirect:/forget-pass-change-pass";
			}
			if (password.length() <= 3) {
				session.setAttribute("error", "passsword should be more 3 character !!!");
				return "redirect:/forget-pass-change-pass";
			}
			ur.updateUserPassword(empId, password);
			return "redirect:/login";
		} else {
			session.setAttribute("error", "");
			return "redirect:/forget-pass";
		}
	}

	/*
	 * Generate OTP
	 */
	static char[] OTP(int len) {
		String numbers = "0123456789";
		Random rndm_method = new Random();
		char[] otp = new char[len];
		for (int i = 0; i < len; i++) {
			otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
		}
		return otp;
	}

}
