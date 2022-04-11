package com.onul.introduceHousePost.bo;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.comment.bo.CommentBO;
import com.onul.common.FileManagerService;
import com.onul.introduceHousePost.dao.IntroduceHouseDAO;
import com.onul.introduceHousePost.model.IntroduceFiles;
import com.onul.introduceHousePost.model.IntroduceHouse;
import com.onul.like.bo.LikeBO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class IntroduceHouseBO {

	@Autowired
	private FileManagerService fms;
	
	@Autowired
	private IntroduceHouseDAO introduceDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public List<IntroduceHouse> getIntroduceListOrderByHit() {
		return introduceDAO.selectIntroduceListOrderByHit();
	}
	
	@Options(useGeneratedKeys=true, keyProperty="id")
	public int addIntroduceHouse(IntroduceHouse house, String userLoginId, MultipartFile coverImage, List<MultipartFile> files) {
		// coverImage 1개
		String coverImagePath = null;
		// 첨부 이미지 1개
		String imagePath = null;
		// 이미지 2개 이상
		List<String> imagePaths = null;
		
		// post 객체에 coverImage 추가해서 DB insert
		coverImagePath = fms.saveFile(userLoginId, coverImage);
		house.setCoverImage(coverImagePath);
		
		// DB insert 하면서 postId 받아오기
		int count = introduceDAO.insertIntroduceHouse(house);
		if (count < 1) {
			return 0;
		}
		
		int postId = house.getId();
		
		if (files != null) {
			if (files.size() == 1) {
				imagePath = fms.saveFile(userLoginId, files.get(0));
				introduceDAO.insertFile(postId, imagePath);
			} else {
					try {
						imagePaths = fms.saveFiles(userLoginId, files);
						if (imagePaths.size() < 1) {
							// 첨부 파일이 저장이 안되었을때
							// post 삭제 & 커버 이미지 디렉토리 삭제
							fms.deleteFile(coverImagePath);
							introduceDAO.deleteIntroduceHouseByPostId(postId);
							log.error("[introduceHouse] 첨부파일 저장에 실패하였습니다.");
							return 0;
						} else {
							for (int i = 0; i < imagePaths.size(); i++) {
								introduceDAO.insertFile(postId, imagePaths.get(i));
							}
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
		}
		return postId;
	}
	
	public int updateIntroduceHouse(int postId, int userId, String loginId, IntroduceHouse house, MultipartFile coverImage, List<MultipartFile> files) {
		// coverImage 1개
		String coverImagePath = null;
		// 첨부 이미지 1개
		String imagePath = null;
		// 이미지 2개 이상
		List<String> imagePaths = null;
		
		IntroduceHouse origin = introduceDAO.selectIntroduceHouseByIdUserId(postId, userId);
		
		if (origin == null) {
			return -1;
		} else {
			if(coverImage != null) {
				// 파일 삭제
				try {
					fms.deleteFile(origin.getCoverImage());
				} catch (IOException e) {
					log.error("[file delete] 파일 삭제 실패 {} {}", postId, origin.getCoverImage());
				}
				
				// 파일 저장
				coverImagePath = fms.saveFile(loginId, coverImage);
				
				// DB insert
				house.setCoverImage(coverImagePath);
			}
			
			if (files != null) {
				if (files.size() == 1) {
					imagePath = fms.saveFile(loginId, files.get(0));
					introduceDAO.insertFile(postId, imagePath);
				} else {
					// 파일 저장
					try {
						imagePaths = fms.saveFiles(loginId, files);
					} catch (IOException e) {
						log.error("[introduceHouse] 업데이트 중 첨부파일 저장에 실패하였습니다. {}", postId);
					}
					
					// DB insert
					for (int i = 0; i < imagePaths.size(); i++) {
						introduceDAO.insertFile(postId, imagePaths.get(i));
					}
				}
			}
			return introduceDAO.updateIntroduceHouse(postId, house);
		}
	}
	
	public void deleteIntroduceHouseByPostPostId(int postId) {
		introduceDAO.deleteIntroduceHouseByPostId(postId);
	}
	
	public IntroduceHouse getIntroduceHouseById(int id) {
		return introduceDAO.selectIntroduceHouseById(id);
	}
	
	public List<IntroduceHouse> getIntroduceHouseList() {
		return introduceDAO.selectIntroduceHouseList();
	}
	
	public List<IntroduceHouse> getIntroduceHouseListByUserId(int userId) {
		return introduceDAO.selectIntroduceHouseListByUserId(userId);
	}
	
	public List<IntroduceFiles> getIntroduceFilesByPostId(int postId) {
		return introduceDAO.selectIntroduceFilesByPostId(postId);
	}
	
	public IntroduceHouse getIntroduceHouseByIdUserId(int id, int userId) {
		return introduceDAO.selectIntroduceHouseByIdUserId(id, userId);
	}
	
	public void deleteIntrodeceFilesByPostId(int postId) {
		introduceDAO.deleteIntrodeceFilesByPostId(postId);
	}
	
	public void deleteFileByPostIdImagePath(int postId, String imagePath) {
		try {
			fms.deleteOneFile(imagePath);
		} catch (IOException e) {
			log.error("[delete file] 이미지 삭제 실패, postId{}, path{}", postId, imagePath);
		}
		introduceDAO.deleteFileByPostIdImagePath(postId, imagePath);
	}
	
	public void addHit(int id) {
		introduceDAO.updateHit(id);
	}
	
	public int deleteIntroduceHouseByPostIdUserId(int postId, int userId) {
		IntroduceHouse house = introduceDAO.selectIntroduceHouseById(postId);
		List<IntroduceFiles> files = introduceDAO.selectIntroduceFilesByPostId(postId);
		String postType = house.getPostType();
		
		// cover image 삭제
		try {
			fms.deleteFile(house.getCoverImage());
		} catch (IOException e) {
			log.error("[delete introduce] 이미지 삭제 실패 {}, {}", postId, house.getImagePath());
		}
		
		// 첨부파일 삭제
		if (files != null) {
			for (int i =  0; i < files.size(); i++) {
				try {
					fms.deleteFile(files.get(i).getImagePath());
				} catch (IOException e) {
					log.error("[delete introduce] 첨부파일 삭제 실패 {}, {}", postId, files.get(i).getImagePath());
				}
			}
		}
		
		// comment delete
		commentBO.deleteCommentByPostIdPostType(postId, postType);
		
		// like delete
		likeBO.deleteLikeByPostIdPostType(postId, postType);
		
		// 파일 목록 삭제
		introduceDAO.deleteIntrodeceFilesByPostId(postId);
		
		// 글 삭제
		return introduceDAO.deleteIntroduceHouseByPostId(postId);
	}
}
