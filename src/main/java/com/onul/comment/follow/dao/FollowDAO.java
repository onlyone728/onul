package com.onul.comment.follow.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
	
	public int selectFollowCountByUserId(int userId);
	
	public int selectFollowCountByFollowId(int followId);
}
