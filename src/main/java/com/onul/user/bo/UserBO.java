package com.onul.user.bo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.user.dao.UserDAO;
import com.onul.user.model.User;

@Service
public class UserBO {

	@Autowired
	private FileManagerService fms;
	
	@Autowired
	private UserDAO userDAO;
	
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
	
	public User getUserByLoginId(String loginId) {
		return userDAO.selectUserByLoginId(loginId);
	}
	
	public User getUserByNickName(String nickName) {
		return userDAO.selectUserByNickName(nickName);
	}
	
	public int addUser(String loginId, String password, String nickName, MultipartFile file, String name, String email) {
		String imagePath = null;
		Map<String, String> filePath = new HashMap<>();
		
		if (file != null) {
			// TODO: 파일매니저 서비스 	input:MultipartFile		output:이미지의 주소
			imagePath = fms.saveFile(loginId, file);
			filePath.put("imagePath", imagePath);
		}
		
		// insert DAO
		return userDAO.insertUser(loginId, password, nickName, filePath, name, email);
	}
}
