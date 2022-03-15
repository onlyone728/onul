package com.onul.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onul.test.bo.UserBO;
import com.onul.test.model.User;

@Controller
public class TestController {
	
	@Autowired
	private UserBO userBO;
	
	 @ResponseBody
	 @RequestMapping("/test")
	 public String helloWorld() {
	     return "Hello world!";
	 }
	 
	 @ResponseBody
	 @RequestMapping("/test2")
	 public Map<String, String> test() {
		 Map<String, String> test = new HashMap<>();
		 test.put("Hello", "world");
		 return test;
	 }
	 
	 @RequestMapping("/test3")
	 public String jsp(Model model) {
		 
		 List<User> user = userBO.getUserList();
		 model.addAttribute("user", user);
		 return "template/layout";
	 }
	 
}
