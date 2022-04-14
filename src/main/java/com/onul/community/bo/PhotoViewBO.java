package com.onul.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.comment.follow.bo.FollowBO;
import com.onul.community.model.CommentView;
import com.onul.community.model.PhotoView;
import com.onul.like.bo.LikeBO;
import com.onul.photo.bo.PhotoBO;
import com.onul.photo.model.Photo;
import com.onul.photo.model.Space;
import com.onul.user.bo.UserBO;
import com.onul.user.model.User;

@Service
public class PhotoViewBO {
	
	@Autowired
	private PhotoBO photoBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentViewBO commentBO;
	
	@Autowired
	private FollowBO followBO;
	
	@Autowired
	private LikeBO likeBO;

	public List<PhotoView> generatePhotoViewList(
			@RequestParam(value="space", required=false) Space space,
			@RequestParam(value="userId", required=false) Integer uId,
			@RequestParam(value="keyword", required=false) String keyword) {
		
		List<PhotoView> photoViewList = new ArrayList<>();
		List<Photo> photoList = new ArrayList<>();
		String postType = "photo";
		
		if(space != null) {
			photoList = photoBO.getPhotoListBySpace(space);
		} else if (uId != null) {
			photoList = photoBO.getPhotoListByUserId(uId);
		} else if (keyword != null) {
			photoList = photoBO.getPhotoListByKeyword(keyword);
		} else {
			photoList = photoBO.getPhotoList();
		}
		
		for(Photo photo : photoList) {
			PhotoView photoView = new PhotoView();
			photoView.setPhoto(photo);
			
			int postId = photo.getId();
			int writerId = photo.getUserId();
			
			User user = userBO.getUserById(writerId);
			photoView.setUser(user);
			
			List<Photo> writerPhotoList = photoBO.getPhotoListByUserId(writerId);
			photoView.setPhotoList(writerPhotoList);
			
			List<CommentView> commentList = commentBO.generateCommentViewList(postId, postType);
			photoView.setCommentList(commentList);
			
			int followCount = followBO.getFollowCountByFollowId(writerId);
			photoView.setFollowCount(followCount);
			
			boolean isFollow = followBO.existFollow(uId, writerId);
			photoView.setFollow(isFollow);
			
			int likeCount = likeBO.getLikeCountByPostId(postId, postType);
			photoView.setLikeCount(likeCount);
			
			boolean isLike = likeBO.existLike(postId, postType, uId);
			photoView.setFilledLike(isLike);
			
			photoViewList.add(photoView);
		}
		return photoViewList;
	}
	
	public List<PhotoView> generatePhotoViewListByHit(
			@RequestParam(value="userId", required=false) Integer uId) {
		
		List<PhotoView> photoViewList = new ArrayList<>();
		List<Photo> photoList = new ArrayList<>();
		String postType = "photo";
		
		if (uId != null) {
			photoList = photoBO.getPhotoListByUserId(uId);
		} else {
			photoList = photoBO.getphotoListOrderByHit();
		}
		
		for(Photo photo : photoList) {
			PhotoView photoView = new PhotoView();
			photoView.setPhoto(photo);
			
			int postId = photo.getId();
			int writerId = photo.getUserId();
			
			User user = userBO.getUserById(writerId);
			photoView.setUser(user);
			
			List<Photo> writerPhotoList = photoBO.getPhotoListByUserId(writerId);
			photoView.setPhotoList(writerPhotoList);
			
			List<CommentView> commentList = commentBO.generateCommentViewList(postId, postType);
			photoView.setCommentList(commentList);
			
			int followCount = followBO.getFollowCountByFollowId(writerId);
			photoView.setFollowCount(followCount);
			
			boolean isFollow = followBO.existFollow(uId, writerId);
			photoView.setFollow(isFollow);
			
			int likeCount = likeBO.getLikeCountByPostId(postId, postType);
			photoView.setLikeCount(likeCount);
			
			boolean isLike = likeBO.existLike(postId, postType, uId);
			photoView.setFilledLike(isLike);
			
			photoViewList.add(photoView);
		}
		return photoViewList;
	}
	
	public PhotoView photoViewByPostId(
			@RequestParam("postId") int postId, 
			@RequestParam(value="userId", required=false) Integer uId) {
		PhotoView photoView = new PhotoView();

		Photo photo = photoBO.getPhotoById(postId);
		photoView.setPhoto(photo);
		
		String postType = photo.getPostType();
		int userId = photo.getUserId();
		
		User user = userBO.getUserById(userId);
		photoView.setUser(user);
		
		List<Photo> photoList = photoBO.getPhotoListByUserId(userId);
		photoView.setPhotoList(photoList);
		
		List<CommentView> commentList = commentBO.generateCommentViewList(postId, postType);
		photoView.setCommentList(commentList);
		
		int followCount = followBO.getFollowCountByFollowId(userId);
		photoView.setFollowCount(followCount);
		
		boolean isFollow = followBO.existFollow(uId, userId);
		photoView.setFollow(isFollow);
		
		int likeCount = likeBO.getLikeCountByPostId(postId, postType);
		photoView.setLikeCount(likeCount);
		
		boolean isLike = likeBO.existLike(postId, postType, uId);
		photoView.setFilledLike(isLike);
				
		
		return photoView;
	}
	
}
