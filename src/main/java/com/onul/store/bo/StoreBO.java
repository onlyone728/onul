package com.onul.store.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.store.dao.StoreDAO;
import com.onul.store.model.Store;

@Service
public class StoreBO {
	
	@Autowired
	private FileManagerService fms;

	@Autowired
	private StoreDAO storeDAO;
	
	public Store getStoreByLoginId(String loginId) {
		return storeDAO.selectStoreByLoginId(loginId);
	}
	
	public int addStore(Store store, MultipartFile file) {
		String imagePath = null;
		
		if (file != null) {	// 파일 서버에 저장
			imagePath = fms.saveFile(store.getLoginId(), file);
			store.setStoreImage(imagePath);
		}
		return storeDAO.insertStore(store);
	}
}
