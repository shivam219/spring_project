package com.timesheet.controller;

import org.springframework.stereotype.Controller;

@Controller
public class MyErrorController {
//	public class MyErrorController implements ErrorController {
////
//	@RequestMapping("/error")
//	public String handleError() {
//		return "error";
//	}

//	@RequestMapping("/error")
//	public String handleError(HttpServletRequest request) {
//		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
//
//		if (status != null) {
//			Integer statusCode = Integer.valueOf(status.toString());
//
//			if (statusCode == HttpStatus.NOT_FOUND.value()) {
//				return "error-404";
//			} else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
//				return "error-500";
//			}
//		}
//		return "error";
//	}
}