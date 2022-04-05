package com.onul.store;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.EncryptUtils;
import com.onul.store.bo.StoreBO;
import com.onul.store.model.Store;

@RestController
public class StoreRestController {
	
	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/store/is_duplicated_id")
	public Map<String, Object> isDuplicated(
			@RequestParam("loginId") String loginId) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", true);
		
		// TODO: loginId로 DB select
		// 결과는 boolean
		Store store = storeBO.getStoreByLoginId(loginId);
		
		if (store == null) {
			result.put("result", false);
		}
		return result;
	}

	@PostMapping("/store/sign_up")
	public Map<String, Object> signUp(
			@ModelAttribute Store store,
			@RequestParam(value="file", required=false) MultipartFile file) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		String password = store.getPassword();
		String salt = EncryptUtils.generateSalt();
		String encPassword = EncryptUtils.getEncrypt(password, salt); 
		String encSaltPw = encPassword + salt;	// 저장할 비번
		
		store.setPassword(encSaltPw);
		
		int count = storeBO.addStore(store, file);
		
		if (count < 1) {
			result.put("result", "error");
			result.put("errorMessage", "가입에 실패했습니다. 관리자에게 문의하세요.");
		}
		
		return result;
	}
	
	@PostMapping("/store/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		Store store = storeBO.getStoreByLoginId(loginId);
		
		if (store == null) {
			result.put("result", "error");
			result.put("errorMessage", "존재하지 않는 아이디입니다. 아이디를 확인해 주세요.");
			return result;
		}
		
		String salt = store.getPassword().substring(64);
		String encPassword = EncryptUtils.getEncrypt(password, salt);
		String tempPw = encPassword + salt;
		String storePw = store.getPassword();
		
		if (storePw.equals(tempPw) == false) {
			result.put("result", "error");
			result.put("errorMessage", "비밀번호를 확인해 주세요.");
		}
		
		return result;
	}
}
