package com.onul.user.bo;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.user.dao.UserDAO;
import com.onul.user.model.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
	
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
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
		
		return count;
	}
	
	public int updateUser(int id, String loginId, String email, MultipartFile file, String introduce) {
		User user = userDAO.selectUserById(id);
		if (user == null) {
			log.error("[update user] 수정할 사용자가 존재하지않습니다.");
			return 0;
		}
		
		String imagePath = null;
		
		if (file != null) {
			imagePath = fms.saveFile(loginId, file);
			try {
				fms.deleteFile(user.getProfileImage());
			} catch (IOException e) {
				log.error("[update user] 파일 수정중 에러. postId:{}, error:{}", id, e.getMessage());
			}
		}
		
		return userDAO.updateUser(id, email, imagePath, introduce);
	}
	
	public int updatePasswordById(int id, String password) {
		return userDAO.updatePasswordById(id, password);
	}
	
}
