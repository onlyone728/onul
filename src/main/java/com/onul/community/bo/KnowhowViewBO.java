package com.onul.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.comment.bo.CommentBO;
import com.onul.comment.follow.bo.FollowBO;
import com.onul.comment.model.Comment;
import com.onul.community.model.KnowhowView;
import com.onul.knowhowPost.bo.KnowhowBO;
import com.onul.knowhowPost.model.Knowhow;
import com.onul.knowhowPost.model.KnowhowFiles;
import com.onul.like.bo.LikeBO;
import com.onul.user.bo.UserBO;
import com.onul.user.model.User;

@Service
public class KnowhowViewBO {
	
	@Autowired
	private KnowhowBO knowhowBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private FollowBO followBO;
	
	@Autowired
	private LikeBO likeBO;

	public List<KnowhowView> generateKnowhowList(
			@RequestParam(value="userId", required=false) Integer uId) {
		List<KnowhowView> knowhowViewList = new ArrayList<>();
		List<Knowhow> knowhowList = new ArrayList<>();
		
		knowhowList = knowhowBO.getKnowhowList();
		
		for (Knowhow knowhow : knowhowList) {
			KnowhowView knowhowView = new KnowhowView();
			knowhowView.setKnowhow(knowhow);
			
			int postId = knowhow.getId();
			int userId = knowhow.getUserId();
			String postType = knowhow.getPostType();
			
			List<KnowhowFiles> fileList = knowhowBO.getKnowhowFilesListByPostId(postId);
			knowhowView.setFileList(fileList);
			
			User user = userBO.getUserById(userId);
			knowhowView.setUser(user);
			
			List<Knowhow> writerKnowhowList = knowhowBO.getKnowhowListByUserId(userId);
			knowhowView.setKnowhowList(writerKnowhowList);
			
			List<Comment> commentList = commentBO.getCommentListByPostTypeAndPostId(postType, postId);
			knowhowView.setCommentList(commentList);
			
			int commentCount = commentBO.commentCount(postType, postId);
			knowhowView.setCommentCount(commentCount);
			
			int followCount = followBO.getFollowCountByFollowId(userId);
			knowhowView.setFollowCount(followCount);
			
			boolean isFollow = followBO.existFollow(uId, userId);
			knowhowView.setFollow(isFollow);
			
			int likeCount = likeBO.getLikeCountByPostId(postId, postType);
			knowhowView.setLikeCount(likeCount);
			
			boolean filledLike = likeBO.existLike(postId, postType, uId);
			knowhowView.setFilledLike(filledLike);
			
			knowhowViewList.add(knowhowView);
		}
		
		
		return knowhowViewList;
	}
	
	
	public KnowhowView generateKnowhowView(
			@RequestParam("postId") int postId,
			@RequestParam(value="userId", required=false) Integer uId) {
		KnowhowView knowhowView = new KnowhowView();
		Knowhow knowhow = knowhowBO.getKnowhowById(postId);
		knowhowView.setKnowhow(knowhow);
		
		int userId = knowhow.getUserId();
		String postType = knowhow.getPostType();
		
		List<KnowhowFiles> fileList = knowhowBO.getKnowhowFilesListByPostId(postId);
		knowhowView.setFileList(fileList);
		
		User user = userBO.getUserById(userId);
		knowhowView.setUser(user);
		
		List<Knowhow> knowhowList = knowhowBO.getKnowhowListByUserId(userId);
		knowhowView.setKnowhowList(knowhowList);
		
		List<Comment> commnetList = commentBO.getCommentListByPostTypeAndPostId(postType, postId);
		knowhowView.setCommentList(commnetList);
		
		int commentCount = commentBO.commentCount(postType, postId);
		knowhowView.setCommentCount(commentCount);
		
		int followCount = followBO.getFollowCountByFollowId(userId);
		knowhowView.setFollowCount(followCount);
		
		boolean isFollow = followBO.existFollow(uId, userId);
		knowhowView.setFollow(isFollow);
		
		int likeCount = likeBO.getLikeCountByPostId(postId, postType);
		knowhowView.setLikeCount(likeCount);
		
		boolean filledLike = likeBO.existLike(postId, postType, uId);
		knowhowView.setFilledLike(filledLike);
		
		return knowhowView;
	}
}
