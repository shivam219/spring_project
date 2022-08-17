package com.leaf.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@org.springframework.stereotype.Controller
public class Controller {

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Model model) {
		return "about";
	}

}
