package com.onul.photo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.photo.model.Photo;
import com.onul.photo.model.Space;

@Repository
public interface PhotoDAO {

	public List<Photo> selectphotoListOrderByHit();
	
	public List<Photo> selectPhotoList();
	
	public Photo selectPhotoById(int id);
	
	public List<Photo> selectPhotoListByUserId(int userId);
	
	public List<Photo> selectPhotoListBySpace(Space space); 
	
	public List<Photo> selectPhotoListByKeyword(String keyword);
	
	public void updateHit(int id);
	
	public int insertPhoto(Photo photo);
	
	public int updatePhoto(
			@Param("id") int id,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	public int deletePhoto(
			@Param("id") int id,
			@Param("userId") int userId);
}
