package com.onul.order.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.order.model.Order;

@Repository
public interface OrderDAO {

	public List<Order> selectOrderListByProductId(int productId);
	
	public int orderCountByProductId(int productId);
}
