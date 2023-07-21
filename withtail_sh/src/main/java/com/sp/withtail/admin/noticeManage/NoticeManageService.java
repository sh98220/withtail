package com.sp.withtail.admin.noticeManage;

import java.util.List;
import java.util.Map;

public interface NoticeManageService {
	
	public void insertNotice(NoticeManage dto, String pathname) throws Exception;

	public int dataCount(Map<String, Object> map);
	public List<NoticeManage> listNotice(Map<String, Object> map);
	public List<NoticeManage> listNoticeTop();

	public void updateHitCount(long num) throws Exception;
	public NoticeManage readNotice(long num);
	public NoticeManage preReadNotice(Map<String, Object> map);
	public NoticeManage nextReadNotice(Map<String, Object> map);


	public void updateNotice(NoticeManage dto, String pathname) throws Exception;
	public void deleteNotice(long num, String pathname) throws Exception;

	
	public List<NoticeManage> listFile(long num);
	public NoticeManage readFile(long fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;








}
