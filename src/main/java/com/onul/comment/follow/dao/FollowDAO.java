package com.onul.comment.follow.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.comment.follow.model.Follow;

@Repository
public interface FollowDAO {

	public int insertFollow(
			@Param("userId") int userId, 
			@Param("followId") int followId);
	
	
	public int selectFollowCountByUserIdAndFollowId(
			@Param("userId") int userId, 
			@Param("followId") int followId);
	
	public void deleteFollowByUserIdAndFollowId(
			@Param("userId") int userId, 
			@Param("followId") int followId);
	
	public List<Follow> selectFollowListByUserId(int userId);
	
	public List<Follow> selectFollowListByFollowId(int followId);
	
	public int selectFollowCountByUserId(int userId);
	
	public int selectFollowCountByFollowId(int followId);
}
