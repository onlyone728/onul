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
	
	public List<Photo> getPhotoList() {
		return photoDAO.selectPhotoList();
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
}
