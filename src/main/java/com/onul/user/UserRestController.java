package com.onul.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.EncryptUtils;
import com.onul.user.bo.UserBO;
import com.onul.user.model.User;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/user/sign_in")
	public Map<String, Object> signIn (
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", "success");

		// TODO: 암호화된 비번과 로그인 아이디로 DB select
		User user = userBO.getUserByLoginId(loginId);
		
		if (user == null) {
			result.put("result", "error");
			result.put("errorMessage", "아이디가 존재하지않습니다.");
		} else {
			// TODO: salt 분리 후 비밀번호 암호화  
			String salt = user.getPassword().substring(64);
			String encPw = EncryptUtils.getEncrypt(password, salt);
			String tempPw = encPw + salt;
			String userPw = user.getPassword();
			
			if (userPw.equals(tempPw)) {
				result.put("result", "success");
				// TODO: 로그인이 성공하면 session에 정보를 저장한다.
				HttpSession session = request.getSession();
				session.setAttribute("userLoginId", user.getLoginId());
				session.setAttribute("userId", user.getId());
				session.setAttribute("userNickName", user.getNickName());
				session.setAttribute("userImage", user.getProfileImage());
			} else {
				result.put("result", "error");
				result.put("errorMessage", "비밀번호가 일치하지 않습니다.");
			}
		}
		return result;
	}
	
	@PostMapping("/user/is_duplicated_id")
	public Map<String, Object> isDuplicated(
			@RequestParam("loginId") String loginId) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", true);
		
		// TODO: loginId로 DB select
		// 결과는 boolean
		User user = userBO.getUserByLoginId(loginId);
		
		if (user == null) {
			result.put("result", false);
		}
		return result;
	}
	
	@PostMapping("/user/is_duplicated_nickname")
	public Map<String, Object> isDuplicatedNickName(
			@RequestParam("nickName") String nickName) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", true);
		
		// nickName으로 DB select
		User user = userBO.getUserByNickName(nickName);
		if (user == null) {
			result.put("result", false);
		}
		
		return result;
	}
	
	@PostMapping("/user/sign_up")
	public Map<String, Object> signUp (
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("nickName") String nickName,
			@RequestParam(value="file", required=false) MultipartFile file,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// 비밀번호 암호화
		String salt = EncryptUtils.generateSalt();	// 보안향상을 위한 salt 추가
		String encPassword = EncryptUtils.getEncrypt(password, salt);	// sha256 해싱 
		String encSaltPw = encPassword + salt;	// 저장될 비밀번호
		
		// TODO: DB insert
		int count = userBO.addUser(loginId, encSaltPw, nickName, file, name, email);
		
		if (count < 1) {
			result.put("result", "error");
			result.put("errorMessage", "회원가입에 실패하였습니다.");
		}
		
		return result;
	}
	
}
