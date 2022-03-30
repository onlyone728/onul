package com.onul.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.onul.like.bo.LikeBO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	@RequestMapping("/like")
	public Map<String, Object> like (
			@RequestParam("postId") int postId,
			@RequestParam("postType") String postType,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("message", "좋아요를 추가하였습니다.");
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String nickName = (String) session.getAttribute("userNickName");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			log.error("[좋아요] 로그인 세션이 없습니다.");
			return result;
		}
		
		boolean existLike = likeBO.existLike(postId, postType, userId);
		if (existLike) {
			result.put("result", "success");
			result.put("message", "좋아요를 삭제하였습니다.");
		}
		
		// DB
		likeBO.like(userId, nickName, postType, postId);
		
		return result;
	}
}
