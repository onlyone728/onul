package com.onul.qna.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.qna.dao.QnaDAO;
import com.onul.qna.model.Qna;

@Service
public class QnaBO {

	@Autowired
	private QnaDAO qnaDAO;
	
	public List<Qna> getQnaListByProductId(int productId) {
		return qnaDAO.selectQnaListByProductId(productId);
	}
}
