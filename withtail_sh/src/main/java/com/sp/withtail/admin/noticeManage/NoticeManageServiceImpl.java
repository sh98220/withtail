package com.sp.withtail.admin.noticeManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.withtail.common.FileManager;
import com.sp.withtail.common.dao.CommonDAO;

@Service("admin.noticeManageService")
public class NoticeManageServiceImpl implements NoticeManageService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertNotice(NoticeManage dto, String pathname) throws Exception {
		
		try {
			long seq = dao.selectOne("noticeManage.seq");
			dto.setNum(seq);

			dao.insertData("noticeManage.insertNotice", dto);

			// 파일 업로드
			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();

					dto.setOriginalName(originalFilename);
					dto.setSaveName(saveFilename);
					dto.setFileSize(fileSize);

					// insertFile(dto);
					dao.insertData("noticeManage.insertFile", dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("noticeManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<NoticeManage> listNotice(Map<String, Object> map) {
		List<NoticeManage> list = null;

		try {
			list = dao.selectList("noticeManage.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<NoticeManage> listNoticeTop() {
		List<NoticeManage> list = null;

		try {
			list = dao.selectList("noticeManage.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("noticeManage.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public NoticeManage readNotice(long num) {
		NoticeManage dto = null;

		try {
			dto = dao.selectOne("noticeManage.readNotice", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public NoticeManage preReadNotice(Map<String, Object> map) {
		NoticeManage dto = null;

		try {
			dto = dao.selectOne("noticeManage.preReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public NoticeManage nextReadNotice(Map<String, Object> map) {
		NoticeManage dto = null;

		try {
			dto = dao.selectOne("noticeManage.nextReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public List<NoticeManage> listFile(long num) {
		List<NoticeManage> listFile = null;

		try {
			listFile = dao.selectList("noticeManage.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listFile;
	}

	@Override
	public void updateNotice(NoticeManage dto, String pathname) throws Exception {
		try {
			dao.updateData("noticeManage.updateNotice", dto);

			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();

					dto.setOriginalName(originalFilename);
					dto.setSaveName(saveFilename);
					dto.setFileSize(fileSize);

					// insertFile(dto);
					dao.insertData("noticeManage.insertFile", dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("noticeManage.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteNotice(long num, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<NoticeManage> listFile = listFile(num);
			if (listFile != null) {
				for (NoticeManage dto : listFile) {
					fileManager.doFileDelete(dto.getSaveName(), pathname);
				}
			}

			// 파일 테이블 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);

			dao.deleteData("noticeManage.deleteNotice", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public NoticeManage readFile(long fileNum) {
		NoticeManage dto = null;

		try {
			dto = dao.selectOne("noticeManage.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}



	
}
