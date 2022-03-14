package com.onul.test.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.test.dao.UserDAO;
import com.onul.test.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public List<User> getUserList() {
		return userDAO.selectUserList();
	}
}
