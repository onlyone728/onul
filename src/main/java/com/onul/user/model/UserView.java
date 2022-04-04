package com.onul.user.model;

import java.util.List;

import com.onul.community.model.IntroduceHouseView;
import com.onul.community.model.KnowhowView;
import com.onul.community.model.PhotoView;
import com.onul.like.model.Like;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UserView {

	private User user;
	private List<PhotoView> photoList;
	private List<IntroduceHouseView> houseList;
	private List<KnowhowView> knowhowList;
	private List<Like> likeList;
	private int followCount;
	private int followedCount;
}
