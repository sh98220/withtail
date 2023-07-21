package com.sp.withtail.admin.couponManage;

import java.util.List;
import java.util.Map;

public interface CouponManageService {
	public void insertCoupon(CouponManage dto) throws Exception;
	
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<CouponManage> listCoupon(Map<String, Object> map);
	
	public CouponManage readCoupon(long couponNum);
	public void updateCoupon(CouponManage dto) throws Exception;
	public void deleteCoupon(long couponNum) throws Exception;
	
	public List<CouponManage> allMember(long couponNum);
	public List<CouponManage> nocouponMember(long couponNum);
	
	public void insertToMember(Map<String, Object> map) throws Exception;
	
}
