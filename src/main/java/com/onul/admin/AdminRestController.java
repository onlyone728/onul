package com.onul.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.onul.product.bo.ProductBO;
import com.onul.product.model.Product;

@RestController
public class AdminRestController {

	@Autowired
	private ProductBO productBO;
	
	@PostMapping("/admin/product_create")
	public Map<String, Object> productCreate(
			@ModelAttribute Product product,
			@RequestParam("thumbnailFile") MultipartFile thumbnailFile,
			@RequestParam(value="images", required=false) List<MultipartFile> files,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		Integer storeId = (Integer) session.getAttribute("storeId");
		String storeName = (String) session.getAttribute("storeName");
		String storeLoginId = (String) session.getAttribute("storeLoginId");
		
		if (storeId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		}
		
		// model에 값 넣기
		product.setStoreId(storeId);
		product.setStoreName(storeName);
		
		// DB insert
		int count = productBO.addProduct(product, thumbnailFile, files, storeLoginId);
		if (count < 1) {
			result.put("result", "error");
			result.put("errorMessage", "상품등록에 실패했습니다. 관리자에게 문의하세요.");
		}
		
		return result;
	}
}
