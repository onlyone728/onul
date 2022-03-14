package com.onul.test.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.test.model.User;

@Repository
public interface UserDAO {

	public List<User> selectUserList();
}
