package com.onul.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.user.dao.UserDAO;
import com.onul.user.model.User;
import com.onul.userInfo.bo.UserInfoBO;

@Service
public class UserBO {

	@Autowired
	private FileManagerService fms;

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserInfoBO userInfoBO;

	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}

	public User getUserByLoginId(String loginId) {
		return userDAO.selectUserByLoginId(loginId);
	}

	public User getUserByNickName(String nickName) {
		return userDAO.selectUserByNickName(nickName);
	}
	
	

	public int addUser(String loginId, String password, String nickName, MultipartFile file, String name,
			String email) {
		String imagePath = null;

		if (file != null) {
			// TODO: 파일매니저 서비스 input:MultipartFile output:이미지의 주소
			imagePath = fms.saveFile(loginId, file);
		}
		
		// insert DAO
		int count = userDAO.insertUser(loginId, password, nickName, imagePath, name, email);
		
		if (count > 0) {
			userInfoBO.addUserInfo(nickName, imagePath, null);
		}
		
		return count;
	}
}
