package com.onul.introduceHousePost.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.introduceHousePost.dao.IntroduceHouseDAO;
import com.onul.introduceHousePost.model.IntroduceHouse;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class IntroduceHouseBO {

	@Autowired
	private FileManagerService fms;
	
	@Autowired
	private IntroduceHouseDAO introduceDAO;
	
	public List<IntroduceHouse> getIntroduceListOrderByHit() {
		return introduceDAO.selectIntroduceListOrderByHit();
	}
	
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
		int postId = introduceDAO.insertIntroduceHouse(house);
		
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
							introduceDAO.deleteIntroduceHouseById(postId);
							log.error("[introduceHouse] 첨부파일 저장에 실패하였습니다.");
							return 0;
						}
						for (int i = 0; i < imagePaths.size(); i++) {
							introduceDAO.insertFile(postId, imagePaths.get(i));
						}
					
						introduceDAO.insertFile(postId, imagePath);
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
		}
		return postId;
	}
	
	public void deleteIntroduceHouseById(int id) {
		introduceDAO.deleteIntroduceHouseById(id);
	}
}
