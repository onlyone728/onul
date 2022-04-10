package com.onul.knowhowPost.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Category {
	CONSTRUCTIONINFO("시공정보")
	, STORAGE("수납")
	, TIPSFORDECORATING("꾸미기 팁")
	, CLEANING("청소")
	, DIYANDREFORM("DIY&리폼")
	, LIFEINFO("생활정보")
	, ETC("기타");
	
	private String label;
}
