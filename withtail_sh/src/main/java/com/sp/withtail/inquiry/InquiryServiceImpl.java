package com.sp.withtail.inquiry;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;


@Service("inquiry.inquiryService")
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertInquiry(Inquiry dto) throws Exception {
		try {
			dao.insertData("inquiry.insertInquiry", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("inquiry.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Inquiry> listInquiry(Map<String, Object> map) {
		List<Inquiry> list = null;

		try {
			list = dao.selectList("inquiry.listInquiry", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Inquiry readInquiry(long num) {
		Inquiry dto = null;

		try {
			dto = dao.selectOne("inquiry.readInquiry", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public void deleteInquiry(long num) throws Exception {
		try {
			dao.deleteData("inquiry.deleteInquiry", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}	
}
