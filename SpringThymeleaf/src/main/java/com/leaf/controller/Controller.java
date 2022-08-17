package com.leaf.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@org.springframework.stereotype.Controller
public class Controller {

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Model model) {
		model.addAttribute("name","shivam");
		return "about";
	}
	@RequestMapping(value = "/loop", method = RequestMethod.GET)
	public String loop(Model model) {
		List<String> list = List.of("shivam", "deepak", "rama");
		model.addAttribute("name","shivam");
		model.addAttribute("name",list);
		return "loop";
	}
	

}
