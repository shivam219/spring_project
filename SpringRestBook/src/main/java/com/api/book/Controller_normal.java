package com.api.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Controller_normal {
	@GetMapping("/ess")
	private String essWork() {
		System.out.println("called");
		return "ess";
	}
}
