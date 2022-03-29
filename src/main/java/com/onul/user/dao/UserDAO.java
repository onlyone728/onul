package com.onul.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.user.model.User;

@Repository
public interface UserDAO {

	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public User selectUserByLoginId(String loginId);
	
	public User selectUserByNickName(String nickName);
	
	public User selectUserById(int id);
	
	public int insertUser(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("nickName") String nickName, 
			@Param("profileImage") String profileImage, 
			@Param("name") String name, 
			@Param("email") String email);
}
