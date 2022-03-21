package com.onul.introduceHousePost.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.introduceHousePost.dao.IntroduceHousePostDAO;
import com.onul.introduceHousePost.model.IntroduceHousePost;

@Service
public class IntroduceHousePostBO {

	@Autowired
	private IntroduceHousePostDAO introduceDAO;
	
	public List<IntroduceHousePost> getIntroduceListOrderByHit() {
		return introduceDAO.selectIntroduceListOrderByHit();
	}
}
