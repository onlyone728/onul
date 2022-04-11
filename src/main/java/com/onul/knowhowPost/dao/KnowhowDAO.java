package com.onul.knowhowPost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.knowhowPost.model.Category;
import com.onul.knowhowPost.model.Knowhow;
import com.onul.knowhowPost.model.KnowhowFiles;

@Repository
public interface KnowhowDAO {

	public List<Knowhow> selectKnowhowOrderByHit();
	
	public void updateHit(int id);
	
	public int insertKnowhow(Knowhow knowhow);
	
	public void insertFile(
			@Param("postId") int postId,
			@Param("imagePath") String imagePath);
	
	public void deleteKnowhowById(int id);
	
	public Knowhow selectKnowhowById(int id); 
	
	public List<Knowhow> selectKnowhowList();
	
	public List<Knowhow> selectKnowhowListByCategory(Category category);
	
	public List<Knowhow> selectKnowhowListByUserId(int userId);
	
	public List<Knowhow> selectKnowhowListByKeyword(String keyword);
	
	public Knowhow selectKnowhowByIdUserId(
			@Param("id") int id, 
			@Param("userId") int userId);
	
	public List<KnowhowFiles> selectKnowhowFilesListByPostId(int postId);
	
	public int updateKnowhow(
			@Param("id") int id,
			@Param("knowhow") Knowhow knowhow);
	
	public void deleteFileByPostIdImagePath(
			@Param("postId") int postId, 
			@Param("imagePath") String imagePath);
	
	public void deleteFileById(int postId);
}
