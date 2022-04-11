package com.onul.introduceHousePost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.introduceHousePost.model.IntroduceFiles;
import com.onul.introduceHousePost.model.IntroduceHouse;

@Repository
public interface IntroduceHouseDAO {

	public List<IntroduceHouse> selectIntroduceListOrderByHit();
	
	public List<IntroduceHouse> selectIntroduceHouseListByKeyword(String keyword);
	
	public int insertIntroduceHouse(IntroduceHouse house);
	
	public int updateIntroduceHouse(
			@Param("postId") int postId,
			@Param("house") IntroduceHouse house);
	
	public void insertFile(
			@Param("postId") int postId,
			@Param("imagePath") String imagePath);
	
	public int deleteIntroduceHouseByPostId(int postId);
	
	public IntroduceHouse selectIntroduceHouseById(int id);
	
	public List<IntroduceHouse> selectIntroduceHouseList();
	
	public List<IntroduceHouse> selectIntroduceHouseListByUserId(int userId); 
	
	public List<IntroduceFiles> selectIntroduceFilesByPostId(int postId);
	
	public IntroduceHouse selectIntroduceHouseByIdUserId(
			@Param("id") int id, 
			@Param("userId") int userId);
	
	public void deleteIntrodeceFilesByPostId(int postId);
	
	public void deleteFileByPostIdImagePath(
			@Param("postId") int postId, 
			@Param("imagePath") String imagePath);
	
	public void updateHit(int id);
}
