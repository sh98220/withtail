package com.sp.withtail.state;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;



@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	private CommonDAO dao;
	
	@Scheduled(cron="0 0 0 * * *")  // 매일 밤 1시
	@Override
	public void automaticRepeatOperation() {
		try {
			// 15일이 지난 장바구니 지우기
			dao.deleteData("cart.deleteCartExpiration");
			
			// 배송 완료 5일 후에 자동 구매 확정
			dao.updateData("orderManage.updateOrderStateDone");
			
			// 쿠폰 만료기한 지나면 자동 삭제
			dao.deleteData("couponManage.deleteDoneCoupon");

		} catch (Exception e) {
		}
	}
}
