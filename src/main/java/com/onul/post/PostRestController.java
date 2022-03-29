package com.onul.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.onul.introduceHousePost.bo.IntroduceHouseBO;
import com.onul.introduceHousePost.model.IntroduceHouse;
import com.onul.knowhowPost.bo.KnowhowBO;
import com.onul.knowhowPost.model.Knowhow;
import com.onul.photo.bo.PhotoBO;
import com.onul.photo.model.Photo;

@RestController
public class PostRestController {

	@Autowired
	private PhotoBO photoBO;
	
	@Autowired
	private IntroduceHouseBO introduceBO;
	
	@Autowired
	private KnowhowBO knowhowBO;

	@PostMapping("/post/photo_create")
	public Map<String, Object> createPhoto(
			@ModelAttribute Photo photo,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		String userNickName = (String) session.getAttribute("userNickName");
		String userProfileImage = (String) session.getAttribute("userProfileImage");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 다시 시도해주세요.");
			return result;
		} 
		
		photo.setNickName(userNickName);
		photo.setProfileImage(userProfileImage);

		// DB insert
		int count = photoBO.addPhoto(photo, userLoginId, file);
		
		if (count < 1) {
			result.put("result", "error");
			result.put("errorMessage", "사진 저장에 실패하였습니다. 다시 시도해주세요.");
		} else {
			int postId = photo.getId();
			result.put("postId", postId);
		}
		return result;
	}
	
	@PostMapping("/post/introduce_create")
	public Map<String, Object> createIntroduceHouse(
			@ModelAttribute IntroduceHouse house,
			@RequestParam("coverImageFile") MultipartFile coverImage,
			@RequestParam(value="images", required=false) List<MultipartFile> files,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		String userNickName = (String) session.getAttribute("userNickName");
		String userProfileImage = (String) session.getAttribute("userProfileImage");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		}
		
		house.setUserId(userId);
		house.setNickName(userNickName);
		house.setProfileImage(userProfileImage);
		
		// BO insert DB
		int postId = introduceBO.addIntroduceHouse(house, userLoginId, coverImage, files);
		if (postId < 1) {
			result.put("result", "error");
			result.put("errorMessage", "저장에 실패하였습니다. 관리자에게 문의하세요.");
			return result;
		}
		
		result.put("postId", postId);
		return result;
	}
	
	@PostMapping("/post/knowhow_create")
	public Map<String, Object> createKnowhow(
			@ModelAttribute Knowhow knowhow,
			@RequestParam("coverImageFile") MultipartFile coverImage,
			@RequestParam(value="images", required=false) List<MultipartFile> files,
			HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		String userNickName = (String) session.getAttribute("userNickName");
		String userProfileImage = (String) session.getAttribute("userProfileImage");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		}
		
		knowhow.setId(userId);
		knowhow.setNickName(userNickName);
		knowhow.setProfileImage(userProfileImage);
		
		// DB insert
		int postId = knowhowBO.addKnowhow(knowhow, userLoginId, coverImage, files);
		if (postId < 1) {
			result.put("result", "error");
			result.put("errorMessage", "저장에 실패하였습니다. 관리자에게 문의하세요.");
			return result;
		}
		
		result.put("postId", postId);
		
		return result;
	}
	
}
