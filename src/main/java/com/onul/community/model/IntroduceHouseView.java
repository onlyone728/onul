package com.onul.community.model;

import java.util.List;

import com.onul.comment.model.Comment;
import com.onul.introduceHousePost.model.IntroduceFiles;
import com.onul.introduceHousePost.model.IntroduceHouse;
import com.onul.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class IntroduceHouseView {
	private IntroduceHouse house;
	private List<IntroduceFiles> fileList; 
	private User user;
	private List<IntroduceHouse> houseList;
	private List<Comment> commentList;
	private int commentCount;
	private int followCount;
	private boolean isFollow;
	private int likeCount;
	private boolean filledLike;
}
