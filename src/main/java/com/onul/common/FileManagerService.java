package com.onul.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {

	// 서버에 저장될 디렉토리
	public final static String FILE_UPLOAD_PATH = "/Users/janghana/Desktop/java/megait/7_portfolio/onul/workspace/images/";
	
	public String saveFile(String userLoginId, MultipartFile file) {
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		// 디렉토리 생성
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
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
	
}
