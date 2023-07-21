package com.sp.withtail.admin.memberManage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("admin.memberManageService")
public class MemberManageServiceImpl implements MemberManageService {
	@Autowired
	private com.sp.withtail.common.dao.CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("memberManage.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int stopdataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("memberManage.stopdataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@Override
	public int withdrawdataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("memberManage.withdrawdataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	@Override
	public List<MemberManage> listMember(Map<String, Object> map) {
		List<MemberManage> list = null;
		
		try {
			list = dao.selectList("memberManage.listMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<MemberManage> stoplistMember(Map<String, Object> map) {
		List<MemberManage> list = null;
		
		try {
			list = dao.selectList("memberManage.stoplistMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MemberManage> withdrawlistMember(Map<String, Object> map) {
		List<MemberManage> list = null;
		
		try {
			list = dao.selectList("memberManage.withdrawlistMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MemberManage readMember(String userId) {
		MemberManage dto = null;

		try {
			dto = dao.selectOne("memberManage.readMember", userId);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}


	@Override
	public void insertMemberState(MemberManage dto) throws Exception {
		try {
			dao.updateData("memberManage.insertMemberState",dto);
			dao.updateData("memberManage.updateEnabled",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<MemberManage> readMemberState(String userId) {
		List<MemberManage> list = null;

		try {
			list = dao.selectList("memberManage.readMemberState", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<MemberManage> readPoint (String userId) {
		List<MemberManage> list = null;
		
		
		try {
			list = dao.selectList("memberManage.readPoint",userId);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	

	@Override
	public MemberManage readStateCode(String userId) {
		MemberManage dto = null;
		
		try {
			dto = dao.selectOne("memberManage.readStateCode", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	

	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		try {
			dao.updateData("memberManage.updateFailureCountReset", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("memberManage.updateMemberEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public List<MemberManage> listMemberState(String userId) {
		List<MemberManage> list = null;
		
		try {
			list = dao.selectList("memberManage.listMemberState", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}




}
