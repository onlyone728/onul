package com.onul.introduceHousePost.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.introduceHousePost.model.IntroduceHousePost;

@Repository
public interface IntroduceHousePostDAO {

	public List<IntroduceHousePost> selectIntroduceListOrderByHit();
}
