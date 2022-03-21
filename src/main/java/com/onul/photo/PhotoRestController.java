package com.onul.photo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.onul.photo.bo.PhotoBO;

@RestController
public class PhotoRestController {
	
	@Autowired
	private PhotoBO photoBO;

	@PostMapping("/post/photo_create")
	public Map<String, Object> createPhoto(
			@RequestParam("postType") String postType,
			@RequestParam("content") String content,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		String userNickName = (String) session.getAttribute("userNickName");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 다시 시도해주세요.");
		} else {
			// DB insert
			int count = photoBO.addPhoto(userId, userLoginId, userNickName, postType, content, file);
			
			if (count < 1) {
				result.put("result", "error");
				result.put("errorMessage", "사진 저장에 실패하였습니다. 다시 시도해주세요.");
			}
		}
		return result;
	}
}
