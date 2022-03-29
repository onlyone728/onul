package com.onul.photo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.photo.model.Photo;

@Repository
public interface PhotoDAO {

	public List<Photo> selectphotoListOrderByHit();
	
	public List<Photo> selectPhotoList();
	
	public Photo selectPhotoById(int id);
	
	public List<Photo> selectPhotoListByUserId(int userId);
	
	public void updateHit(int id);
	
	public int insertPhoto(Photo photo);
}
