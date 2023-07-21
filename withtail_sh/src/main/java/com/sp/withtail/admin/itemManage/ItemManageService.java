package com.sp.withtail.admin.itemManage;

import java.util.List;
import java.util.Map;

public interface ItemManageService {
	public void insertItem(ItemManage dto, String pathname) throws Exception;
	public void updateItem(ItemManage dto, String pathname) throws Exception;
	public void deleteItem(long itemNum, String pathname) throws Exception;
	public void deleteItemList(List<Long> list, String pathname) throws Exception;
	public void deleteItemPhoto(long photoNum, String pathname) throws Exception;
	public void deleteOption2(long option2Num) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<ItemManage> listItem(Map<String, Object> map);
	public ItemManage readItem(long itemNum);
	public int orderCount(long itemNum);
	
	public List<ItemManage> listItemPhoto(long itemNum);
	public List<ItemManage> listItemOption1(long itemNum);
	public List<ItemManage> listItemOption2(long option1Num);
	
	public ItemManage readCategory(long ctNum);
	public List<ItemManage> listCategory();
	public List<ItemManage> listSubCategory(long parentCt);
	
	public List<ItemStock> stocklist(long itemNum);
	public void updateItemStock(Map<String, Object> map) throws Exception;
	public int stockDataCount(Map<String, Object> map);
 
}
