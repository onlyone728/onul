package com.onul.comment.follow.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Follow {

	private int userId;
	private int followId;
	private Date createdAt;
}
