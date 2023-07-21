package com.sp.withtail.admin.itemManage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.withtail.common.FileManager;
import com.sp.withtail.common.dao.CommonDAO;

@Service("admin.itemManage.ItemManageService")
public class ItemManageServiceImpl implements ItemManageService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;


	@Override
	public void insertItem(ItemManage dto, String pathname) throws Exception {
		try {
			String photoName = fileManager.doFileUpload(dto.getMainImageFile(), pathname);
			dto.setMainImage(photoName);

			long itemNum = dao.selectOne("itemManage.itemSeq");
			dto.setItemNum(itemNum);
			dao.insertData("itemManage.insertItem", dto);

			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					photoName = fileManager.doFileUpload(mf, pathname);
					if(photoName == null) {
						continue;
					}
					dto.setPhotoName(photoName);
					dao.insertData("itemManage.insertItemPhoto", dto);
				}
			}

			ItemStock stock = new ItemStock();
			stock.setItemNum(itemNum);

			if((dto.getOption2Names() != null && dto.getOption2Names().size() != 0) &&
					(dto.getOption2Names2() != null && dto.getOption2Names2().size() != 0)){

				long option1Num = dao.selectOne("itemManage.option1Seq");
				dto.setOption1Num(option1Num);
				dto.setParent(null);
				dao.insertData("itemManage.insertOption1", dto);

				long option2Num;
				dto.setOption2Nums(new ArrayList<Long>());
				for(int i =0; i<dto.getOption2Names().size(); i++) {
					option2Num = dao.selectOne("itemManage.option2Seq");
					dto.setOption2Num(option2Num);
					dto.setOption2Name(dto.getOption2Names().get(i));
					dto.setExtraPrice(dto.getExtraPrices().get(i));
					dao.insertData("itemManage.insertOption2",dto);

					dto.getOption2Nums().add(option2Num);
				}


				long option1Num2 = dao.selectOne("itemManage.option1Seq");
				dto.setOption1Num(option1Num2);
				dto.setOption1Name(dto.getOption1Name2());
				dto.setParent(option1Num);
				dao.insertData("itemManage.insertOption1", dto);

				long option2Num2;
				dto.setOption2Nums2(new ArrayList<Long>());
				for(int i =0; i<dto.getOption2Names2().size(); i++) {
					option2Num2= dao.selectOne("itemManage.option2Seq");
					dto.setOption2Num(option2Num2);
					dto.setOption2Name(dto.getOption2Names2().get(i));
					dto.setExtraPrice(dto.getExtraPrices2().get(i));
					dao.insertData("itemManage.insertOption2",dto);

					dto.getOption2Nums2().add(option2Num2);
				}

				for(long op2Num : dto.getOption2Nums()) {
					for(long op2Num2 : dto.getOption2Nums2()) {
						stock.setOption2Num(op2Num);
						stock.setOption2Num2(op2Num2);

						dao.insertData("itemManage.insertItemStock", stock);
					}
				}

			} else if((dto.getOption2Names() != null && dto.getOption2Names().size() != 0) &&
					(dto.getOption2Names2() == null || dto.getOption2Names2().size() == 0)){
				long option1Num = dao.selectOne("itemManage.option1Seq");
				dto.setOption1Num(option1Num);
				dto.setParent(null);
				dao.insertData("itemManage.insertOption1", dto);

				long option2Num;
				dto.setOption2Nums(new ArrayList<Long>());
				for(int i =0; i<dto.getOption2Names().size(); i++) {
					option2Num = dao.selectOne("itemManage.option2Seq");
					dto.setOption2Num(option2Num);
					dto.setOption2Name(dto.getOption2Names().get(i));
					dto.setExtraPrice(dto.getExtraPrices().get(i));
					dao.insertData("itemManage.insertOption2",dto);

					dto.getOption2Nums().add(option2Num);
				}

				for(long op2Num : dto.getOption2Nums()) {
					stock.setOption2Num(op2Num);
					dao.insertData("itemManage.insertItemStock", stock);
				}

			} else {
				stock.setOption2Num(null);
				stock.setOption2Num2(null);
				dao.insertData("itemManage.insertItemStock", stock);
			}





		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void updateItem(ItemManage dto, String pathname) throws Exception {
		try {
			String photoName = fileManager.doFileUpload(dto.getMainImageFile(), pathname);
			if(photoName != null) {
				if(dto.getMainImage().length() != 0) {
					fileManager.doFileDelete(dto.getMainImage(), pathname);
				}

				dto.setMainImage(photoName);
			}
			dao.updateData("itemManage.updateItem", dto);

			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					photoName = fileManager.doFileUpload(mf, pathname);
					if(photoName == null) {
						continue;
					}
					dto.setPhotoName(photoName);

					dao.insertData("itemManage.insertItemPhoto",dto);
				}
			}

			// 상위 옵션 하위 옵션 모두 작성된 경우
			if((dto.getOption1Name() != null && ! dto.getOption1Name().equals("")) &&
					(dto.getOption1Name2() != null && ! dto.getOption1Name2().equals(""))) {

				// 상위 옵션과 하위옵션이 모두 새로 작성된 경우
				if((dto.getOption1Num() == null || dto.getOption1Num() == 0)) {

					long option1Num = dao.selectOne("itemManage.option1Seq");
					dto.setOption1Num(option1Num);
					dto.setParent(null);
					dao.insertData("itemManage.insertOption1", dto);


					long option2Num;
					dto.setOption2Nums(new ArrayList<Long>());
					for(int i = 0; i < dto.getOption2Names().size(); i++) {
						option2Num = dao.selectOne("itemManage.option2Seq");
						dto.setOption2Num(option2Num);
						dto.setOption2Name(dto.getOption2Names().get(i));
						dto.setOption1Num(dto.getOption1Num());
						dto.setExtraPrice(dto.getExtraPrices().get(i));
						dao.insertData("itemManage.insertOption2", dto);

						dto.getOption2Nums().add(option2Num);
					}

					long option1Num2 = dao.selectOne("itemManage.option1Seq");
					dto.setOption1Num(option1Num2);
					dto.setOption1Name(dto.getOption1Name2());
					dto.setParent(option1Num);
					dao.insertData("itemManage.insertOption1", dto);

					long option2Num2;
					dto.setOption2Nums2(new ArrayList<Long>());
					for(int i =0; i<dto.getOption2Names2().size(); i++) {
						option2Num2= dao.selectOne("itemManage.option2Seq");
						dto.setOption2Num(option2Num2);
						dto.setOption2Name(dto.getOption2Names2().get(i));
						dto.setExtraPrice(dto.getExtraPrices2().get(i));
						dao.insertData("itemManage.insertOption2",dto);

						dto.getOption2Nums2().add(option2Num2);
					}

					ItemStock stock = new ItemStock();
					stock.setItemNum(dto.getItemNum());
					for(long op2Num : dto.getOption2Nums()) {
						for(long op2Num2 : dto.getOption2Nums2()) {
							stock.setOption2Num(op2Num);
							stock.setOption2Num2(op2Num2);

							dao.insertData("itemManage.insertItemStock", stock);
						}
					}


					// 상위 옵셥은 수정, 하위옵션은 새로 등록하는 경우
				} else if((dto.getOption1Num() != null || dto.getOption1Num() != 0)) {

					// 상위옵션 업데이트
					dao.updateData("itemManage.updateOption1",dto);

					int size = dto.getOption2Nums().size();

					if(size != 0) {
						for(int i = 0; i< size; i++) {
							dto.setOption2Num(dto.getOption2Nums().get(i));
							dto.setOption2Name(dto.getOption2Names().get(i));
							dto.setOption1Num(dto.getOption1Num());
							dto.setExtraPrice(dto.getExtraPrices().get(i));
							dao.updateData("itemManage.updateOption2", dto);
						}
					} else if(size == 0) {
						long option2Num;
						dto.setOption2Nums(new ArrayList<Long>());
						for(int i = 0; i < dto.getOption2Names().size(); i++) {
							option2Num = dao.selectOne("itemManage.option2Seq");
							dto.setOption2Num(option2Num);
							dto.setOption2Name(dto.getOption2Names().get(i));
							dto.setOption1Num(dto.getOption1Num());
							dto.setExtraPrice(dto.getExtraPrices().get(i));
							dao.insertData("itemManage.insertOption2", dto);

							dto.getOption2Nums().add(option2Num);
						}
					}

					// 하위 옵션 인서트
					long option1Num2 = dao.selectOne("itemManage.option1Seq");
					dto.setOption1Num(option1Num2);
					dto.setParent(dto.getOption1Num());
					dao.insertData("itemManage.insertOption1", dto);

					long option2Num;
					dto.setOption2Nums2(new ArrayList<Long>());
					for(int i = 0; i < dto.getOption2Names2().size(); i++) {
						option2Num = dao.selectOne("itemManage.option2Seq");
						dto.setOption2Num(option2Num);
						dto.setOption2Name(dto.getOption2Names2().get(i));
						dto.setOption1Num(dto.getOption1Num());
						dto.setExtraPrice(dto.getExtraPrices2().get(i));
						dao.insertData("itemManage.insertOption2",dto);

						dto.getOption2Nums2().add(option2Num);
					}

					// 기존 재고 삭제
					dao.deleteData("itemManage.deleteStock", dto.getItemNum());

					// 새로 등록된 옵션에 따라 새로운 재고 등록
					ItemStock stock = new ItemStock();
					stock.setItemNum(dto.getItemNum());
					for(long op2Num : dto.getOption2Nums()) {
						for(long op2Num2 : dto.getOption2Nums2()) {
							stock.setOption2Num(op2Num);
							stock.setOption2Num2(op2Num2);

							dao.insertData("itemManage.insertItemStock", stock);
						}
					}

				}

				// 상위 옵션만 입력하고 하위 옵션은 입력하지 않았을 때	
			} else if((dto.getOption1Name() != null || ! dto.getOption1Name().equals("")) &&
					(dto.getOption1Name2() == null || dto.getOption1Name2().equals(""))) {

				// 상위 옵션 insert 일때
				if(dto.getOption1Num() == null || dto.getOption1Num() == 0) {

					long option1Num = dao.selectOne("itemManage.option1Seq");
					dto.setOption1Num(option1Num);
					dto.setParent(null);
					dao.insertData("itemManage.insertOption1", dto);

					long option2Num;
					dto.setOption2Nums(new ArrayList<Long>());
					for(int i = 0; i < dto.getOption2Names().size(); i++) {
						option2Num = dao.selectOne("itemManage.option2Seq");
						dto.setOption2Num(option2Num);
						dto.setOption2Name(dto.getOption2Names().get(i));
						dto.setOption1Num(dto.getOption1Num());
						dao.insertData("itemManage.insertOption2", dto);

						dto.getOption2Nums().add(option2Num);
					}

					// 재고 등록
					ItemStock stock = new ItemStock();
					stock.setItemNum(dto.getItemNum());
					for(long op2Num : dto.getOption2Nums()) {
						stock.setOption2Num(op2Num);

						dao.insertData("itemManage.insertItemStock", stock);
					}

				} else if(dto.getOption1Num() != null && dto.getOption1Num() != 0) {
					dao.updateData("itemManage.updateOption1",dto);

					int size = dto.getOption2Nums().size();

					if(size != 0) {

						for(int i = 0; i< size; i++) {
							dto.setOption2Num(dto.getOption2Nums().get(i));
							dto.setOption2Name(dto.getOption2Names().get(i));
							dto.setOption1Num(dto.getOption1Num());
							dto.setExtraPrice(dto.getExtraPrices().get(i));
							dao.updateData("itemManage.updateOption2", dto);

						}
					} else if(size == 0) {
						long option2Num;
						dto.setOption2Nums(new ArrayList<Long>());
						for(int i = 0; i < dto.getOption2Names().size(); i++) {
							option2Num = dao.selectOne("itemManage.option2Seq");
							dto.setOption2Num(option2Num);
							dto.setOption2Name(dto.getOption2Names().get(i));
							dto.setOption1Num(dto.getOption1Num());
							dto.setExtraPrice(dto.getExtraPrices().get(i));
							dao.insertData("itemManage.insertOption2", dto);

							dto.getOption2Nums().add(option2Num);
						}
					}

					// 기존 재고 삭제
					dao.deleteData("itemManage.deleteStock", dto.getItemNum());

					// 새로 등록된 옵션에 따라 새로운 재고 등록
					ItemStock stock = new ItemStock();
					stock.setItemNum(dto.getItemNum());
					for(long op2Num : dto.getOption2Nums()) {
						stock.setOption2Num(op2Num);

						dao.insertData("itemManage.insertItemStock", stock);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteItem(long itemNum, String pathname) throws Exception {
		try {

			ItemManage dto = dao.selectOne("itemManage.readItem", itemNum);

			String pathname2 = pathname + dto.getMainImage();

			if (pathname != null) {
				fileManager.doFileDelete(pathname2);
			}
			
			Long photoNum = null;
			List<String> photos = dao.selectList("itemManage.listItemPhotoName", itemNum);
			List<Long> nums = dao.selectList("itemManage.listItemPhotoNum", itemNum);

			for(int i = 0; i < photos.size(); i++) {
				pathname = pathname + photos.get(i);
				photoNum = nums.get(i);
				deleteItemPhoto(photoNum, pathname);
			}

			dao.deleteData("itemManage.deleteStock", itemNum);


			if(dto.getOption2Names2() != null && dto.getOption2Names2().size() != 0) {
				for(int i = 0; i < dto.getOption2Nums2().size(); i++ ) {
					dao.deleteData("itemManage.deleteOption2", dto.getOption2Nums2().get(i));
				}
			}

			if(dto.getOption2Names() != null && dto.getOption2Names().size() != 0) {
				for(int i = 0; i < dto.getOption2Nums().size(); i++ ) {
					dao.deleteData("itemManage.deleteOption2", dto.getOption2Nums().get(i));
				}
			}

			if(dto.getOption1Num2() != null && dto.getOption1Num2() != 0) {

				dao.deleteData("itemManage.deleteOption1", dto.getOption1Num2());
			}

			if(dto.getOption1Num() != null && dto.getOption1Num() != 0) {

				dao.deleteData("itemManage.deleteOption1", dto.getOption1Num());
			}

			dao.deleteData("itemManage.deleteItem", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteItemList(List<Long> list, String path) throws Exception {

		for(int i = 0; i < list.size(); i++) {
			deleteItem(list.get(i), path);
		}
	}

	@Override
	public void deleteItemPhoto(long photoNum, String pathname) throws Exception {
		try {
			if(pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			dao.deleteData("itemManage.deleteItemPhoto", photoNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteOption2(long option2Num) throws Exception {
		try {
			dao.deleteData("itemManage.deleteOption2", option2Num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("itemManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<ItemManage> listItem(Map<String, Object> map) {
		List<ItemManage> list = null;

		try {
			list = dao.selectList("itemManage.listItem", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public ItemManage readItem(long itemNum) {
		ItemManage dto = null;

		try {
			dto = dao.selectOne("itemManage.readItem", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<ItemManage> listItemPhoto(long itemNum) {
		List<ItemManage> list = null;

		try {
			list = dao.selectList("itemManage.listItemPhoto", itemNum);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ItemManage> listItemOption1(long itemNum) {
		List<ItemManage> list = null;

		try {
			list = dao.selectList("itemManage.listOption1", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ItemManage> listItemOption2(long option1Num) {
		List<ItemManage> list = null;

		try {
			list = dao.selectList("itemManage.listOption2", option1Num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public ItemManage readCategory(long ctNum) {
		ItemManage dto = null;

		try {
			dto = dao.selectOne("itemManage.readCategory", ctNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<ItemManage> listCategory() {
		List<ItemManage> list = null;

		try {
			list = dao.selectList("itemManage.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ItemManage> listSubCategory(long parentCt) {
		List<ItemManage> list = null;

		try {
			list = dao.selectList("itemManage.listSubCategory", parentCt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<ItemStock> stocklist(long itemNum) {
		List<ItemStock> list = null;

		try {
			list = dao.selectList("itemManage.stocklist", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateItemStock(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("itemManage.updateItemStock", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int stockDataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("itemManage.stockDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int orderCount(long itemNum) {
		int result = 0;

		try {
			result = dao.selectOne("itemManage.orderCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
