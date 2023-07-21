package com.sp.withtail.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;


@Service("cart.cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Cart> listCart(String userId) {
		List<Cart> list = null;
		
		try {
			list = dao.selectList("cart.listCart", userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Cart deliveryFee(String userId) {
		Cart dto = null;

		// 게시물 가져오기
		try {
			dto = dao.selectOne("cart.deliveryFeeMax", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	
	@Override
	public Cart listNullCheck(String userId) {
		Cart dto = null;
		
		try {
			dto = dao.selectOne("cart.listNullCheck", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("cart.deleteCart", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


}
