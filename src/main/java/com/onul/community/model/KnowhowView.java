package com.onul.community.model;

import java.util.List;

import com.onul.knowhowPost.model.Knowhow;
import com.onul.knowhowPost.model.KnowhowFiles;
import com.onul.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class KnowhowView {
	
	private Knowhow knowhow;
	private List<KnowhowFiles> fileList;
	private User user;
	private List<Knowhow> knowhowList;
	private List<CommentView> commentList;
	private int followCount;
	private boolean isFollow;
	private int likeCount;
	private boolean filledLike;
}
