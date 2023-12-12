package com.teamb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamb.service.WebtoonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/page/*")
@AllArgsConstructor
public class PageController {
	
	@GetMapping("/memberlogin")
	public void memberlogin() {
		
	}
	
	@GetMapping("/memberdelete")
	public void memberdelete() {
		
	}
	
	@GetMapping("/membereditpw")
	public void membereditpw() {
		
	}
	
	@GetMapping("/memberjoin")
	public void memberjoin() {
		
	}

	@GetMapping("/myinfo")
	public void myinfo() {
		
	}

	@GetMapping("/successpage")
	public void successpage() {
		
	}
	
	@GetMapping("/errorpage")
	public void errorpage() {
		
	}
}
