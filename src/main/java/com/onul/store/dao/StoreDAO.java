package com.onul.store.dao;

import org.springframework.stereotype.Repository;

import com.onul.store.model.Store;

@Repository
public interface StoreDAO {

	public Store selectStoreByLoginId(String loginId);
	
	public int insertStore(Store store);
}
