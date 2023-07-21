package com.sp.withtail.myPage;

import java.util.List;

public interface MyPageService {
	public List<MyPage> listMyPages(MyPage dto) throws Exception;
	public MyPage readPet(long num);
	public void deletePet(long num, String pathname) throws Exception;
	public int dataCount(String userId);
	public void updatePet(MyPage dto, String pathname) throws Exception;
	public void insertAdd(MyPage dto) throws Exception;
	public List<MyPage> listDelivery(MyPage dto) throws Exception;
	public void updateAdd(MyPage dto) throws Exception;
	public MyPage readAdd(long num);
	public void deleteAdd(long num) throws Exception;
	public int addDataCount(String userId);
	public void updateProfileName(MyPage dto) throws Exception;
	public MyPage readProfile(String userId);
	public void insertMemberState(MyPage dto) throws Exception;
	public void updateEnabled(MyPage dto) throws Exception;
	
	public List<MyPage> listCoupon(MyPage dto) throws Exception;
	public int couponDataCount(String userId);
	public int couponUnusedDataCount(String userId);
	
	public List<MyPage> listOrder(MyPage dto) throws Exception;
	public int orderDataCount(String userId);
	
	public MyPage readOrderList(long orderNum);
	public void updateOrderState(long orderNum) throws Exception;
	public List<MyPage> listNumOrder(long orderNum) throws Exception;
	
	public List<MyPage> listPoint(String userId) throws Exception;
	public int pointDataCount(String userId);
	
	public void updateOrderCancel(long orderNum) throws Exception;
	public void updateOrderRefund(long orderNum) throws Exception;
	public void updatePwd(MyPage dto) throws Exception;
	
	public List<MyPage> listFavorite(String userId) throws Exception;
	public int favoriteDataCount(String userId);
	public void deleteFavorite(long itemNum) throws Exception;
	
	public void insertCart(MyPage dto) throws Exception;
	
	public void insertReview(MyPage dto, String pathname) throws Exception;
	public MyPage readReviewItem(long orderDetailNum);
	public void insertReviewPhoto(MyPage dto) throws Exception;

	public void getPoint(MyPage dto) throws Exception;
	public MyPage readPoint(String userId);
	
	public void memberEdit(MyPage dto) throws Exception;
	
	public MyPage readMember(String userId);
	
}
