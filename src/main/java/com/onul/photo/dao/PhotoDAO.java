package com.onul.photo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.photo.model.Photo;

@Repository
public interface PhotoDAO {

	public List<Photo> selectphotoListOrderByHit();
	
	public int insertPhoto(
			@Param("userId") int userId, 
			@Param("nickName") String nickName, 
			@Param("postType") String postType, 
			@Param("content") String content, 
			@Param("imagePath") String imagePath);
}