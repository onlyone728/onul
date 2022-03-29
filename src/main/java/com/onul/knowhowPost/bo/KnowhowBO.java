package com.onul.knowhowPost.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.knowhowPost.dao.KnowhowDAO;
import com.onul.knowhowPost.model.Knowhow;
import com.onul.knowhowPost.model.KnowhowFiles;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class KnowhowBO {

	@Autowired
	private FileManagerService fms;

	@Autowired
	private KnowhowDAO knowhowDAO;

	public List<Knowhow> getKnowhowOrderByHit() {
		return knowhowDAO.selectKnowhowOrderByHit();
	}

	public void addHit(int id) {
		knowhowDAO.updateHit(id);
	}

	public int addKnowhow(Knowhow knowhow, String userLoginId, MultipartFile coverImage, List<MultipartFile> files) {
		// coverImage 1개
		String coverImagePath = null;
		// 첨부 이미지 1개
		String imagePath = null;
		// 이미지 2개 이상
		List<String> imagePaths = null;

		// post 객체에 coverImage 추가해서 DB insert
		coverImagePath = fms.saveFile(userLoginId, coverImage);
		knowhow.setCoverImage(coverImagePath);

		// DB insert 하면서 postId 받아오기
		int count = knowhowDAO.insertKnowhow(knowhow);
		if (count < 1) {
			return 0;
		}

		int postId = knowhow.getId();

		if (files != null) {
			if (files.size() == 1) {
				imagePath = fms.saveFile(userLoginId, files.get(0));
				knowhowDAO.insertFile(postId, imagePath);
			} else {
				try {
					imagePaths = fms.saveFiles(userLoginId, files);
					if (imagePaths.size() < 1) {
						// 첨부 파일이 저장이 안되었을때
						// post 삭제 & 커버 이미지 디렉토리 삭제
						fms.deleteFile(coverImagePath);
						knowhowDAO.deleteKnowhowById(postId);
						log.error("[knowhow] 첨부파일 저장에 실패하였습니다.");
						return 0;
					} else {
						for (int i = 0; i < imagePaths.size(); i++) {
							knowhowDAO.insertFile(postId, imagePaths.get(i));
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return postId;
	}
	
	public Knowhow getKnowhowById(int id) {
		return knowhowDAO.selectKnowhowById(id);
	}
	
	public List<Knowhow> getKnowhowList() {
		return knowhowDAO.selectKnowhowList();
	}
	
	public List<Knowhow> getKnowhowListByUserId(int userId) {
		return knowhowDAO.selectKnowhowListByUserId(userId);
	}
	
	public List<KnowhowFiles> getKnowhowFilesListByPostId(int postId) {
		return knowhowDAO.selectKnowhowFilesListByPostId(postId);
	}
	
	public void deleteKnowhowById(int id) {
		knowhowDAO.deleteKnowhowById(id);
	}
}
