package com.onul.qna.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.qna.model.Qna;

@Repository
public interface QnaDAO {

	public List<Qna> selectQnaListByProductId(int productId);
}
