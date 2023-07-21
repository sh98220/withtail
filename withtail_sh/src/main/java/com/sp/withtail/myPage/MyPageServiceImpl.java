package com.sp.withtail.myPage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.withtail.common.FileManager;
import com.sp.withtail.common.dao.CommonDAO;

@Service("myPage.myPageService")
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<MyPage> listMyPages(MyPage dto) throws Exception {
		List<MyPage> list = null;
		
		try {
			list = dao.selectList("myPage.listMyPages", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MyPage readPet(long num) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("myPage.readPet", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deletePet(long num, String pathname) throws Exception {
		try {
			if(pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			dao.deleteData("myPage.deletePet", num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("myPage.dataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void updatePet(MyPage dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if(saveFilename != null) {
				if(dto.getPetsImageFilename().length() != 0) {
					fileManager.doFileDelete(dto.getPetsImageFilename(), pathname);
				}
				
				dto.setPetsImageFilename(saveFilename);
			}
			
			dao.updateData("myPage.petEdit", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertAdd(MyPage dto) throws Exception {
		try {
			if(dto.getAddDef() == 1) {
				dao.updateData("myPage.basicAddressClear", dto.getUserId());
			}
			
			dao.insertData("myPage.insertAdd", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<MyPage> listDelivery(MyPage dto) throws Exception {
		List<MyPage> list = null;
		
		try {
			list = dao.selectList("myPage.listDelivery", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateAdd(MyPage dto) throws Exception {
		try {
			
			if(dto.getAddDef() == 1) {
				dao.updateData("myPage.basicAddressClear", dto.getUserId());
			}
			
			dao.updateData("myPage.updateAdd", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public MyPage readAdd(long num) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("myPage.readAdd", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteAdd(long num) throws Exception {
		try {	
			dao.deleteData("myPage.deleteAdd", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int addDataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("myPage.addDataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void updateProfileName(MyPage dto) throws Exception {
		try {
			dao.updateData("myPage.updateProfileName", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public MyPage readProfile(String userId) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("myPage.readProfile", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateEnabled(MyPage dto) throws Exception {
		try {
			dao.updateData("myPage.updateEnabled", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertMemberState(MyPage dto) throws Exception {
		try {		
			dao.insertData("myPage.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<MyPage> listCoupon(MyPage dto) throws Exception {
		List<MyPage> list = null;
		
		try {
			list = dao.selectList("myPage.listCoupon", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int couponDataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("myPage.couponDataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int couponUnusedDataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("myPage.couponUnusedDataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MyPage> listOrder(MyPage dto) throws Exception {
		List<MyPage> list = null;
		
		try {
			list = dao.selectList("myPage.listOrder", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int orderDataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("myPage.orderDataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public MyPage readOrderList(long orderNum) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("myPage.readOrderList", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateOrderState(long orderNum) throws Exception {
		try {
			dao.updateData("myPage.updateOrderState", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	@Override
	public List<MyPage> listNumOrder(long orderNum) throws Exception {
		List<MyPage> list = null;
		
		try {
			list = dao.selectList("myPage.listNumOrder", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MyPage> listPoint(String userId) throws Exception {
		List<MyPage> list = null;
		
		try {
			list = dao.selectList("myPage.listPoint", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int pointDataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("myPage.pointDataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}

	@Override
	public void updateOrderCancel(long orderNum) throws Exception {
		try {
			dao.updateData("myPage.updateOrderCancel", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateOrderRefund(long orderNum) throws Exception {
		try {
			dao.updateData("myPage.updateOrderRefund", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<MyPage> listFavorite(String userId) throws Exception {
		List<MyPage> list = null;
		
		try {
			list = dao.selectList("myPage.listFavorite", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int favoriteDataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("myPage.favoriteDataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}

	@Override
	public void deleteFavorite(long itemNum) throws Exception {
		try {
		
			dao.deleteData("myPage.deleteFavorite", itemNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertCart(MyPage dto) throws Exception {
		try {		

			
			if(dto.getOption2Num() == null) {
				dto.setOption2Num(null);
			} else if(dto.getOption2Num2() == null) {
				dto.setOption2Num2(null);
			}
			
			int cnt = dao.selectOne("myPage.myCartCount", dto);
			if(cnt == 0) {
				dao.insertData("myPage.insertCart", dto);
			} else {
				dao.updateData("myPage.increaseCart", dto);
			}

			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertReview(MyPage dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("myPage.seq");
			dto.setRvNum(seq);
			
			dao.insertData("myPage.insertReview", dto);
			
			if (!dto.getSelectFile1().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile1()) {
					String savename = fileManager.doFileUpload(mf, pathname);
					if (savename == null) {
						continue;
					}

					dto.setSaveName(savename);

					insertReviewPhoto(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public MyPage readReviewItem(long orderDetailNum) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("myPage.readReviewItem", orderDetailNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertReviewPhoto(MyPage dto) throws Exception {
		try {
			dao.insertData("myPage.insertReviewPhoto", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void getPoint(MyPage dto) throws Exception {
		try {
			dao.insertData("myPage.getPoint", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public MyPage readPoint(String userId) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("myPage.readPoint", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;	
		
	}

	@Override
	public void memberEdit(MyPage dto) throws Exception {
		try {						
			dao.updateData("myPage.memberEdit", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public MyPage readMember(String userId) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("myPage.readMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updatePwd(MyPage dto) throws Exception {
		try {
			dao.updateData("myPage.updatePwd", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
	


}
