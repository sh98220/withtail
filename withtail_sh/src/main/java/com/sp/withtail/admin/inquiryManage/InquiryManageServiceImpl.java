package com.sp.withtail.admin.inquiryManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service("admin.inquiryManageService")
public class InquiryManageServiceImpl implements InquiryManageService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("inquiryManage.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<InquiryManage> listInquiry(Map<String, Object> map) {
		List<InquiryManage> list = null;

		try {
			list = dao.selectList("inquiryManage.listInquiry", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public InquiryManage readInquiry(long num) {
		InquiryManage dto = null;

		try {
			dto = dao.selectOne("inquiryManage.readInquiry", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void answerInquiry(InquiryManage dto) throws Exception {
		try {
			dao.updateData("inquiryManage.answerInquiry", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteAnswer(long num) throws Exception {
		try {
			dao.deleteData("inquiryManage.deleteAnswer", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteInquiry(long num) throws Exception {
		try {
			dao.deleteData("inquiryManage.deleteInquiry", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
  
}
