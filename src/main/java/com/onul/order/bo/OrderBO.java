package com.onul.order.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.order.dao.OrderDAO;
import com.onul.order.model.Order;

@Service
public class OrderBO {

	@Autowired
	private OrderDAO orderDAO;
	
	public List<Order> getOrderListByProductId(int productId) {
		return orderDAO.selectOrderListByProductId(productId);
	}
	
	public int orderCountByProductId(int productId) {
		return orderDAO.orderCountByProductId(productId);
	}
}
