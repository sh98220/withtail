package com.sp.withtail.admin.memberManage;

import java.util.List;
import java.util.Map;

public interface MemberManageService {
	public int dataCount(Map<String, Object> map);
	public int stopdataCount(Map<String, Object> map);
	public int withdrawdataCount(Map<String, Object> map);
	
	public List<MemberManage> listMember(Map<String, Object> map);
	public List<MemberManage> stoplistMember(Map<String, Object> map);
	public List<MemberManage> withdrawlistMember(Map<String, Object> map);
	
	public MemberManage readMember(String userId);
	public void insertMemberState(MemberManage dto) throws Exception;
	public List<MemberManage> readMemberState(String userId);
	public List<MemberManage> readPoint (String userId);
	
	public MemberManage readStateCode(String userId);
	public void updateFailureCountReset(String userId) throws Exception;
	
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public List<MemberManage> listMemberState(String userId);
}
