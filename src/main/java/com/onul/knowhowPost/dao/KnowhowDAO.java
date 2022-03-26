package com.onul.knowhowPost.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.knowhowPost.model.Knowhow;

@Repository
public interface KnowhowDAO {

	public List<Knowhow> selectKnowhowOrderByHit();
	
	public void updateHit(int id);
}
