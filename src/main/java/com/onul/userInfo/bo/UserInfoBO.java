package com.onul.userInfo.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.userInfo.dao.UserInfoDAO;
import com.onul.userInfo.model.UserInfo;

@Service
public class UserInfoBO {
	
	@Autowired
	private UserInfoDAO userInfoDAO;
	
	public void addUserInfo(String nickName, String profileImage, String introduce) {
		userInfoDAO.insertUserInfo(nickName, profileImage, introduce);
	}
	
	public UserInfo getUserInfoByUserId(int userId) {
		return userInfoDAO.selectUserInfoByUserId(userId);
	}
}
