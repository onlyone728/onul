package com.onul.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.comment.follow.bo.FollowBO;
import com.onul.common.FileManagerService;
import com.onul.introduceHousePost.bo.IntroduceHouseBO;
import com.onul.introduceHousePost.model.IntroduceHouse;
import com.onul.knowhowPost.bo.KnowhowBO;
import com.onul.knowhowPost.model.Knowhow;
import com.onul.like.bo.LikeBO;
import com.onul.like.model.Like;
import com.onul.photo.bo.PhotoBO;
import com.onul.photo.model.Photo;
import com.onul.user.dao.UserDAO;
import com.onul.user.model.User;
import com.onul.user.model.UserView;

@Service
public class UserBO {

	@Autowired
	private FileManagerService fms;

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PhotoBO photoBO; 
	
	@Autowired
	private IntroduceHouseBO introduceBO;
	
	@Autowired 
	private KnowhowBO knowhowBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private FollowBO followBO;
	
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
	
	public UserView generateUserView(int userId) {
		UserView userView = new UserView();
		User user = userDAO.selectUserById(userId);
		userView.setUser(user);
		
		List<Photo> photoList = photoBO.getPhotoListByUserId(userId);
		userView.setPhotoList(photoList);
		
		List<IntroduceHouse> houseList = introduceBO.getIntroduceHouseListByUserId(userId);
		userView.setHouseList(houseList);
		
		List<Knowhow> knowhowList = knowhowBO.getKnowhowListByUserId(userId);
		userView.setKnowhowList(knowhowList);
		
		List<Like> likeList = likeBO.getLikeListByUserId(userId);
		userView.setLikeList(likeList);
		
		int followCount = followBO.getFollowCountByUserId(userId);
		int followedCount = followBO.getFollowCountByFollowId(userId);
		userView.setFollowCount(followCount);
		userView.setFollowedCount(followedCount);
		
		return userView;
	}
}
