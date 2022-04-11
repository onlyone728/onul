package com.onul.knowhowPost.bo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.knowhowPost.dao.KnowhowDAO;
import com.onul.knowhowPost.model.Category;
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

	public int updateKnowhowById(int id, int userId, String loginId, Knowhow knowhow, MultipartFile coverImage,
			List<MultipartFile> files) {
		// coverImage 1개
		String coverImagePath = null;
		// 첨부 이미지 1개
		String imagePath = null;
		// 이미지 2개 이상
		List<String> imagePaths = null;

		Knowhow origin = knowhowDAO.selectKnowhowByIdUserId(id, userId);

		if (origin == null) {
			return -1;
		} else {
			if (coverImage != null) {
				// 파일 삭제
				try {
					fms.deleteFile(origin.getCoverImage());
				} catch (IOException e) {
					log.error("[file delete] 파일 삭제 실패 {} {}", id, origin.getCoverImage());
				}

				// 파일 저장
				coverImagePath = fms.saveFile(loginId, coverImage);

				// DB insert
				knowhow.setCoverImage(coverImagePath);
			}

			if (files != null) {
				if (files.size() == 1) {
					imagePath = fms.saveFile(loginId, files.get(0));
					knowhowDAO.insertFile(id, imagePath);
				} else {
					try {
						imagePaths = fms.saveFiles(loginId, files);
						for (int i = 0; i < imagePaths.size(); i++) {
							knowhowDAO.insertFile(id, imagePaths.get(i));
						}
					} catch (IOException e) {
						log.error("[knowhow] 업데이트 중 첨부파일 저장에 실패하였습니다. {}", id);
					}
				}
			}
		}
		return knowhowDAO.updateKnowhow(id, knowhow);
	}

	public Knowhow getKnowhowById(int id) {
		return knowhowDAO.selectKnowhowById(id);
	}

	public List<Knowhow> getKnowhowList() {
		return knowhowDAO.selectKnowhowList();
	}

	public List<Knowhow> getKnowhowListByCategory(Category category) {
		return knowhowDAO.selectKnowhowListByCategory(category);
	}

	public List<Knowhow> getKnowhowListByUserId(int userId) {
		return knowhowDAO.selectKnowhowListByUserId(userId);
	}

	public List<KnowhowFiles> getKnowhowFilesListByPostId(int postId) {
		return knowhowDAO.selectKnowhowFilesListByPostId(postId);
	}

	public Knowhow getKnowhowByIdUserId(int id, int userId) {
		return knowhowDAO.selectKnowhowByIdUserId(id, userId);
	}

	public void deleteFileByPostIdImagePath(int postId, String imagePath) {
		try {
			fms.deleteOneFile(imagePath);
		} catch (IOException e) {
			log.error("[file delete] 이미지 삭제에 실패했습니다. {} {}", postId, imagePath);
		}
		knowhowDAO.deleteFileByPostIdImagePath(postId, imagePath);
	}

	public void deleteKnowhowById(int id) {
		knowhowDAO.deleteKnowhowById(id);
	}

	@SuppressWarnings("null")
	public void deleteKnowhow(int id, int userId) {
		Knowhow knowhow = knowhowDAO.selectKnowhowByIdUserId(id, userId);
		
		// file 삭제하기
		// coverImage
		try {
			fms.deleteFile(knowhow.getCoverImage());
		} catch (IOException e1) {
			log.error("[file delete] 노하우 커버이미지 삭제 실패 {}", id);
		}
		
		// 첨부파일
		List<KnowhowFiles> files = knowhowDAO.selectKnowhowFilesListByPostId(id);
		if (files != null) {
			List<String> pathList = new ArrayList<>();
			for (int i = 0; i < files.size(); i++) {
				pathList.add(files.get(i).getImagePath());
			}
			try {
				fms.deleteFiles(pathList);
			} catch (IOException e) {
				log.error("[file delete] 노하우 첨부파일 삭제 실패 {}", id);
			}
		}
		
		// DB 삭제하기
		// fileDB
		knowhowDAO.deleteFileById(id);
		
		// knowhowDB
		knowhowDAO.deleteKnowhowById(id);
	}
}
