package com.onul.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileManagerService {

	// 서버에 저장될 디렉토리
//	public final static String FILE_UPLOAD_PATH = "/Users/janghana/Desktop/java/megait/7_portfolio/onul/workspace/images/";
	public final static String FILE_UPLOAD_PATH = "/home/ec2-user/upload_images/";
	
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
			String fileName = file.getOriginalFilename();
			String ext = fileName.substring(fileName.lastIndexOf("."), fileName.length());
			UUID uuid = UUID.randomUUID();
			String newFileName = uuid.toString() + ext;
			
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + newFileName);
			Files.write(path, bytes);
			return "/images/" + directoryName + newFileName;
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
			String fileName = fileList.get(i).getOriginalFilename();
			String ext = fileName.substring(fileName.lastIndexOf("."), fileName.length());
			UUID uuid = UUID.randomUUID();
			String newFileName = uuid.toString() + ext;
			
			byte[] bytes = fileList.get(i).getBytes();
			Path path = Paths.get(filePath + newFileName);
			Files.write(path, bytes); // 파일 생성
			imagePaths.add("/images/" + directoryName + newFileName);
		}
		return imagePaths;
	}
	
	// delete 
	public void deleteFile(String imagePath) throws IOException {
		// 디렉토리당 1개일때
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
	
	public void deleteOneFile(String imagePath) throws IOException {
		Path path = Paths.get(FILE_UPLOAD_PATH + imagePath.replace("/images/", ""));
		if (Files.exists(path)) {
			Files.delete(path);
		}
	}
	
	public void deleteFiles(List<String> imagePaths) throws IOException {
		// /images/jaeyong_1649588582473/FAB54EA0-9BB2-4DCB-93AF-3F1F30518D85_4_5005_c.jpeg
		for(int i = 0; i < imagePaths.size(); i++) {
			deleteOneFile(imagePaths.get(i));
		}
		// 디렉토리(폴더) 삭제
		for (int i = 0; i < imagePaths.size(); i++) {
			Path path = Paths.get(FILE_UPLOAD_PATH + imagePaths.get(i).replace("/images/", ""));
			path = path.getParent();
			if (Files.exists(path)) {
				Files.delete(path);
			}
		}
	}
}
