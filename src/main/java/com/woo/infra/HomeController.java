package com.woo.infra;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
		
		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		/**
		 * Simply selects the home view to render by returning its name.
		 */
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			logger.info("Welcome home! The client locale is {}.", locale);
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
			
			return "home";
		}
		
		@RequestMapping(value = "/a", method = RequestMethod.GET)
		public String a(Locale locale, Model model) {
			System.out.println("kjygfik");
			return "aLIst";
		}

		
		@RequestMapping(value = "/codeGroupList", method = RequestMethod.GET)
		public String CGL(Locale locale, Model model) {
			
			return "codeGroupList";
		}
		
		@RequestMapping(value = "/codeList", method = RequestMethod.GET)
		public String codeList(Locale locale, Model model) {
			
			return "codeList";
		}
		
		@RequestMapping(value = "/memberList", method = RequestMethod.GET)
		public String memberList(Locale locale, Model model) {
			
			return "memberList";
		}
		
		
	
}
