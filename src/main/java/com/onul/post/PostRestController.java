package com.onul.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		String userNickName = (String) session.getAttribute("userNickName");
		String userProfileImage = (String) session.getAttribute("userProfileImage");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 다시 시도해주세요.");
			return result;
		} 
		
		photo.setUserId(userId);
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
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
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
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		Integer userId = (Integer) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		String userNickName = (String) session.getAttribute("userNickName");
		String userProfileImage = (String) session.getAttribute("userProfileImage");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		}
		
		knowhow.setUserId(userId);
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
	
	@PostMapping("/post/update_photo")
	public Map<String, Object> updatePhoto(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		String loginId = (String) session.getAttribute("userLoginId");
		
		if (loginId == "" || loginId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		} 
		
		// DB update
		int count = photoBO.updatePhoto(postId, loginId, content, file);

		if (count < 1) {
			result.put("result", "error");
			result.put("errorMessage", "수정에 실패하였습니다. 관리자에게 문의하세요.");
		} else {
			result.put("postId", postId);
		}
		
		return result;
	}
	
	@PutMapping("/post/update_introduce")
	public Map<String, Object> updateIntroduce(
			@RequestParam("postId") int postId,
			@ModelAttribute IntroduceHouse house,
			@RequestParam(value="coverImageFile", required=false) MultipartFile coverImageFile,
			@RequestParam(value="images", required=false) List<MultipartFile> files,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		result.put("result", "success");
		
		Integer userId = (Integer) session.getAttribute("userId");
		String loginId = (String) session.getAttribute("userLoginId");
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		} else {
			int count = introduceBO.updateIntroduceHouse(postId, userId, loginId, house, coverImageFile, files);
			if (count < 1) {
				result.put("result", "error");
				result.put("errorMessage", "수정에 실패했습니다. 관리자에게 문의하세요.");
			} else if (count == -1) {
				result.put("result", "error");
				result.put("errorMessage", "수정할 글이 존재하지 않습니다. 확인 후 시도해주세요.");
			}
			
			return result;
		}
	}
	
	@DeleteMapping("/post/phote_delete")
	public Map<String, Object> deletePhoto(int postId,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// user : writer 확인
		Photo photo = photoBO.getPhotoById(postId);
		int writerId = photo.getUserId();
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		} else if (userId != writerId) {
			result.put("result", "error");
			result.put("errorMessage", "잘못된 접근입니다.");
			return result;
		}
		
		int count = photoBO.deletePhotoByIdAndUserId(postId, userId);
		
		if (count < 1) {
			result.put("result", "error");
			result.put("errorMessage", "삭제에 실패하였습니다. 관리자에게 문의하세요.");
		}
		
		return result;
	}
	
	@DeleteMapping("/post/house_delete")
	public Map<String, Object> deleteHouse(int postId,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		IntroduceHouse house = introduceBO.getIntroduceHouseById(postId);
		int writerId = house.getUserId();
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		} else if (userId != writerId) {
			result.put("result", "error");
			result.put("errorMessage", "잘못된 접근입니다.");
			return result;
		}
		
		int count = introduceBO.deleteIntroduceHouseByPostIdUserId(postId, userId);
		
		if (count < 1) {
			result.put("result", "error");
			result.put("errorMessage", "삭제에 실패하였습니다. 관리자에게 문의하세요.");
		}
		return result;
	}
	
	@DeleteMapping("/post/file-delete")
	public Map<String, Object> fileDelete(
			@RequestParam("postType") String postType,
			@RequestParam("postId") int postId,
			@RequestParam("imagePath") String imagePath,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		result.put("result", true);
		
		// session 가져와서 post 작성자 확인
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		}
		
		if (postType.equals("introduceHouse")) {
			IntroduceHouse house = introduceBO.getIntroduceHouseByIdUserId(postId, userId);
			if (house == null) {
				result.put("result", "error");
				result.put("errorMessage", "수정할 글이 존재하지 않습니다.");
				return result;
			} else {
				introduceBO.deleteFileByPostIdImagePath(postId, imagePath);
			}
		} else if (postType.equals("knowhow")) {
			Knowhow knowhow = knowhowBO.getKnowhowByIdUserId(postId, userId);
			if (knowhow == null) {
				result.put("result", "error");
				result.put("errorMessage", "수정할 글이 존재하지 않습니다.");
				return result;
			} else {
				knowhowBO.deleteFileByPostIdImagePath(postId, imagePath);
			}
		}
		return result;
	}
}
