package com.onul.introduceHousePost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.introduceHousePost.model.IntroduceHouse;

@Repository
public interface IntroduceHouseDAO {

	public List<IntroduceHouse> selectIntroduceListOrderByHit();
	
	public int insertIntroduceHouse(IntroduceHouse house);
	
	public void insertFile(
			@Param("postId") int postId,
			@Param("imagePath") String imagePath);
	
	public void deleteIntroduceHouseById(int id);
	
	public IntroduceHouse selectIntroduceHouseById(int id);
	
	public void updateHit(int id);
}