package com.onul.community.model;

import com.onul.comment.follow.model.Follow;
import com.onul.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class FollowView {

	private Follow follow;
	private User user;
	private User follower;
}
