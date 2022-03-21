package com.onul.knowhowPost.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.knowhowPost.model.KnowhowPost;

@Repository
public interface KnowhowPostDAO {

	public List<KnowhowPost> selectKnowhowPostOrderByHit();
}
