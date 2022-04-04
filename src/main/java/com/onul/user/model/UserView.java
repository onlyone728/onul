package com.onul.user.model;

import java.util.List;

import com.onul.introduceHousePost.model.IntroduceHouse;
import com.onul.knowhowPost.model.Knowhow;
import com.onul.like.model.Like;
import com.onul.photo.model.Photo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UserView {

	private User user;
	private List<Photo> photoList;
	private List<IntroduceHouse> houseList;
	private List<Knowhow> knowhowList;
	private List<Like> likeList;
	private int followCount;
	private int followedCount;
}
