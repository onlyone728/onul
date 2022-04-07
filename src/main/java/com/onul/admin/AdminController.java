package com.onul.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onul.product.bo.ProductBO;
import com.onul.product.model.Product;

@Controller
public class AdminController {

	@Autowired
	private ProductBO productBO;
	
	@RequestMapping("/admin")
	public String signInView(Model model) {
		model.addAttribute("viewPath", "admin/signIn");
		return "template/user-layout";
	}
	
	@RequestMapping("/admin/summary")
	public String adminSummaryView(Model model) {
		model.addAttribute("viewPath", "admin/main");
		return "template/admin-layout";
	}
	
	@RequestMapping("/admin/sign_up_view")
	public String adminSignUpView(Model model) {
		model.addAttribute("viewPath", "admin/signUp");
		return "template/user-layout";
	}
	
	@RequestMapping("/admin/create_product_view")
	public String createProductView(Model model) {
		model.addAttribute("viewPath", "admin/create_product");
		return "template/admin-create-layout";
	}
	
	@RequestMapping("/admin/product_list_view")
	public String productListView(
			HttpSession session,
			Model model) {
		Integer storeId = (Integer) session.getAttribute("storeId");
		
		List<Product> productList = productBO.getProductListByStoreId(storeId);
		model.addAttribute("productList", productList);
		model.addAttribute("viewPath", "admin/product_list");
		return "template/admin-layout";
	}
	
	@RequestMapping("/admin/edit_product_view/{pId}")
	public String editProductView(
			@PathVariable("pId") int pId,
			Model model) {
		Product product = productBO.getProductById(pId);
		model.addAttribute("item", product);		
		model.addAttribute("viewPath", "admin/update_product");
		return "template/admin-create-layout";
	}
}
