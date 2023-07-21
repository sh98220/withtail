package com.sp.withtail.admin.couponManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service
public class CouponManageServiceImpl implements CouponManageService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertCoupon(CouponManage dto) throws Exception {
		try {
			long couponNum = dao.selectOne("couponManage.couponSeq");
			dto.setCouponNum(couponNum);
			
			dto.setStartDate(dto.getStartDay() + " " + dto.getStartTime() + ":00");
			dto.setEndDate(dto.getEndDay() + " " + dto.getEndTime() + ":00");

			dao.insertData("couponManage.insertCoupon", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;

		try {
			result = dao.selectOne("couponManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CouponManage> listCoupon(Map<String, Object> map) {
		List<CouponManage> list = null;
		try {
			list = dao.selectList("couponManage.listCoupon", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public CouponManage readCoupon(long couponNum) {
		CouponManage dto = null;

		try {
			dto = dao.selectOne("couponManage.readCoupon", couponNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateCoupon(CouponManage dto) throws Exception {

		try {
			dao.updateData("couponManage.updateCoupon", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteCoupon(long couponNum) throws Exception {
		try {
			
			dao.deleteData("couponManage.deleteCoupon", couponNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}
	@Override
	public void insertToMember(Map<String, Object> map) throws Exception {
		try {
			
			int couponNum = Integer.parseInt((String)map.get("couponNum"));
			String userIds = (String)map.get("userIds");
			userIds = userIds.substring(0, userIds.lastIndexOf(","));
			String[] userIdss = userIds.split(",");
			for(int i = 0; i < userIdss.length; i++) {
				Map<String, Object> paramMap = new HashMap<>();
				paramMap.put("userId", userIdss[i]);
				paramMap.put("couponNum",couponNum);
				dao.insertData("couponManage.insertToMember", paramMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<CouponManage> allMember(long couponNum) {
		List<CouponManage> list = null;
		try {
			list = dao.selectList("couponManage.allMember", couponNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CouponManage> nocouponMember(long couponNum) {
		List<CouponManage> list = null;
		try {
			list = dao.selectList("couponManage.nocouponMember", couponNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
