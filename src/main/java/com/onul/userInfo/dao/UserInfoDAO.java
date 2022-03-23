package com.onul.userInfo.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.userInfo.model.UserInfo;

@Repository
public interface UserInfoDAO {

	public void insertUserInfo(
			@Param("nickName") String nickName, 
			@Param("profileImage") String profileImage, 
			@Param("introduce") String introduce);
	
	public UserInfo selectUserInfoByUserId(int userId);
}
