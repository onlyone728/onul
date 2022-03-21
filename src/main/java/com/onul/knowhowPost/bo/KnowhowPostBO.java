package com.onul.knowhowPost.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.knowhowPost.dao.KnowhowPostDAO;
import com.onul.knowhowPost.model.KnowhowPost;

@Service
public class KnowhowPostBO {

	
	@Autowired
	private KnowhowPostDAO knowhowDAO;
	
	public List<KnowhowPost> getKnowhowPostOrderByHit() {
		return knowhowDAO.selectKnowhowPostOrderByHit();
	}
}
