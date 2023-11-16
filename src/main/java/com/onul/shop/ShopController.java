package com.onul.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.shop.bo.ProductViewBO;
import com.onul.shop.model.ProductView;

@Controller
public class ShopController {
	
	@Autowired
	private ProductViewBO productBO;
	
	@RequestMapping("/store")
	public String storeView(Model model) {
		
		// post 가져오기
		
		// product 가져오기
		List<ProductView> productList = productBO.generateProductViewList(null);
		
		model.addAttribute("productList", productList);
		model.addAttribute("viewPath", "shop/main");
		
		return "template/layout";
	}
	
	@RequestMapping("/store/cart")
	public String cartView(
			@RequestParam(value="userId", required=false) Integer userId,
			Model model) {
		
		model.addAttribute("viewPath", "shop/cart");
		
		return "template/layout";
	}
	
	@RequestMapping("/store/detail_view")
	public String detailProductView(
			Model model) {
		model.addAttribute("viewPath", "shop/product_detail");
		return "template/layout";
	}
}
