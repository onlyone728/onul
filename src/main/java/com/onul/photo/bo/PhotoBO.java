package com.onul.photo.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.comment.bo.CommentBO;
import com.onul.common.FileManagerService;
import com.onul.like.bo.LikeBO;
import com.onul.photo.dao.PhotoDAO;
import com.onul.photo.model.Photo;
import com.onul.photo.model.Space;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PhotoBO {

	@Autowired
	private FileManagerService fms;
	
	@Autowired
	private PhotoDAO photoDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public List<Photo> getphotoListOrderByHit() {
		return photoDAO.selectphotoListOrderByHit();
	}
	
	public List<Photo> getPhotoList() {
		return photoDAO.selectPhotoList();
	}
	
	public List<Photo> getPhotoListBySpace(Space space) {
		return photoDAO.selectPhotoListBySpace(space);
	}
	
	public List<Photo> getPhotoListByKeyword(String keyword) {
		return photoDAO.selectPhotoListByKeyword(keyword);
	}
	
	public Photo getPhotoById(int id) {
		return photoDAO.selectPhotoById(id);
	}
	
	public List<Photo> getPhotoListByUserId(int userId) {
		return photoDAO.selectPhotoListByUserId(userId);
	}
	
	public void addHit(int id) {
		photoDAO.updateHit(id);
	}
	
	public int addPhoto(Photo photo, String userLoginId, MultipartFile file) {
		// 파일매니저서비스
		String imagePath = fms.saveFile(userLoginId, file);
		photo.setImagePath(imagePath);
		
		// DAO
		return photoDAO.insertPhoto(photo);
	}
	
	public int updatePhoto(int id, String loginId, String content, MultipartFile file) {
		Photo photo = photoDAO.selectPhotoById(id);
		
		if (photo == null) {
			log.error("[update photo] 수정할 사진이 존재하지않음");
			return 0;
		}
		
		String imagePath = null;
		
		if (file != null) {
			imagePath = fms.saveFile(loginId, file);
			
			try {
				fms.deleteFile(photo.getImagePath());
			} catch (IOException e) {
				log.error("[update post] 파일 수정중 에러. postId:{}, error:{}", id, e.getMessage());
			}
		}
		return photoDAO.updatePhoto(id, content, imagePath);
	}
	
	public int deletePhotoByIdAndUserId(int id, int userId) {
		Photo photo = photoDAO.selectPhotoById(id);
		
		if (photo == null) {
			log.error("[delete post] 삭제할 게시물이 없습니다. postId:{}", id);
			return 0;
		}
		
		try {
			// 로컬 사진 지우기
			fms.deleteFile(photo.getImagePath());
		} catch (IOException e) {
			log.error("[delete post] 이미지 삭제 실패, postId:{}, path:{}", id, photo.getImagePath());
		}
		
		String postType = photo.getPostType();
		// comment 삭제
		commentBO.deleteCommentByPostIdPostType(id, postType);
		
		// like 삭제
		likeBO.deleteLikeByPostIdPostType(id, postType);
		
		// photo 삭제
		return photoDAO.deletePhoto(id, userId);
		
	}
}
