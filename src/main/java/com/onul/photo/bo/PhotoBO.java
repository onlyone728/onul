package com.onul.photo.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.photo.dao.PhotoDAO;
import com.onul.photo.model.Photo;

@Service
public class PhotoBO {

	@Autowired
	private FileManagerService fms;
	
	@Autowired
	private PhotoDAO photoDAO;
	
	public List<Photo> getphotoListOrderByHit() {
		return photoDAO.selectphotoListOrderByHit();
	}
	
	public Photo getPhotoById(String id) {
		return photoDAO.selectPhotoById(id);
	}
	
	public List<Photo> getPhotoListByUserId(int userId) {
		return photoDAO.selectPhotoListByUserId(userId);
	}
	
	public int addPhoto(int userId, String userLoginId, String nickName, String postType, String content, MultipartFile file) {
		// 파일매니저서비스
		String imagePath = fms.saveFile(userLoginId, file);
		
		// DAO
		return photoDAO.insertPhoto(userId, nickName, postType, content, imagePath);
	}
}
