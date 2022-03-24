package com.onul.knowhowPost.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.knowhowPost.dao.KnowhowDAO;
import com.onul.knowhowPost.model.Knowhow;

@Service
public class KnowhowBO {

	
	@Autowired
	private KnowhowDAO knowhowDAO;
	
	public List<Knowhow> getKnowhowOrderByHit() {
		return knowhowDAO.selectKnowhowOrderByHit();
	}
}
