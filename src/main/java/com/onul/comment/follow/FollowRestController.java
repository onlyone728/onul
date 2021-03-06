package com.onul.comment.follow;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.onul.comment.follow.bo.FollowBO;

@RestController
public class FollowRestController {

	@Autowired
	private FollowBO followBO;
	
	@RequestMapping("/follow/create")
	public Map<String, Object> createFollow(
			@RequestParam("followId") int followId,
			HttpServletRequest request,
			Model model) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("message", "팔로우를 추가하였습니다.");
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		} else if (userId == followId) {
			result.put("result", "error");
			result.put("errorMessage", "유저 본인은 팔로우 할 수 없습니다.");
			return result;
		}
		
		// insert BO
		String resultStr = followBO.addFollow(userId, followId);
		
		if (resultStr == "error") {
			result.put("result", "error");
			result.put("errorMessage", "팔로우 추가에 실패하였습니다. 관리자에게 문의하세요.");
			return result;
		} else if (resultStr == "delete") {
			result.put("result", "success");
			result.put("message", "팔로우를 삭제하였습니다.");
		}
		
		return result;
	}
}
