package com.onul.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileManagerService {

	// 서버에 저장될 디렉토리
	public final static String FILE_UPLOAD_PATH = "/Users/janghana/Desktop/java/megait/7_portfolio/onul/workspace/images/";
	
	public String saveFile(String userLoginId, MultipartFile file) {
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		// 디렉토리 생성
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			log.error("[fileManagerService] 디렉토리 생성 안됨");
			return null;
		}
		
		// 파일을 바이트 단위로 업로드
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			return "/images/" + directoryName + file.getOriginalFilename();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 이미지 List로 받아 여러개 저장
	public List<String> saveFiles(String userLoginId, List<MultipartFile> fileList) throws IOException {
		// 폴더 만들기
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		// 디렉토리 생성
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			log.error("[fileManagerService] 디렉토리 생성 안됨");
			return null;
		}
		
		// 생성된 path를 저장할 List 생성
		List<String> imagePaths = new ArrayList<>();
		
		for (int i = 0; i < fileList.size(); i++) {
			byte[] bytes = fileList.get(i).getBytes();
			Path path = Paths.get(filePath + fileList.get(i).getOriginalFilename());
			Files.write(path, bytes); // 파일 생성
			imagePaths.add("/images/" + directoryName + fileList.get(i).getOriginalFilename());
		}
		return imagePaths;
	}
	
	// delete 
	public void deleteFile(String imagePath) throws IOException {
		// imagePath의 /images/onlyone728_173943/sun.png에서 /images/ 를 제거한 path를 실제 저장경로 뒤에 붙인다.
		Path path = Paths.get(FILE_UPLOAD_PATH + imagePath.replace("/images/", ""));
		if (Files.exists(path)) {	// 이미지 파일이 있으면 삭제
			Files.delete(path);
		}
				
		// 디렉토리(폴더) 삭제
		path = path.getParent();
		if (Files.exists(path)) {
			Files.delete(path);
		}
	}
	
	public void deleteOneFile(int postId, String imagePath) throws IOException {
		Path path = Paths.get(FILE_UPLOAD_PATH + imagePath.replace("/images/", ""));
		if (Files.exists(path)) {
			Files.delete(path);
		}
	}
	
}
