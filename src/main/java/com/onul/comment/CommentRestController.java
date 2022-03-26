package com.onul.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.onul.comment.bo.CommentBO;

@RestController
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/comment/create")
	public Map<String, Object> addComment(
			@RequestParam("postType") String postType,
			@RequestParam("postId") int postId,
			@RequestParam("comment") String content,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String nickName = (String) session.getAttribute("userNickName");
		String profileImage = (String) session.getAttribute("userPorfileImage");
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 시도해주세요.");
			return result;
		}
		
		// insert DB
		int count = commentBO.addComment(userId, nickName, profileImage, postType, postId, content);
		
		if (count < 1) {
			result.put("result", "error");
			result.put("errorMessage", "댓글 작성에 실패하였습니다. 관리자에게 문의하세요.");
		}
		return result;
	}
}
