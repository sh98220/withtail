package com.sp.withtail.shop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.withtail.common.dao.CommonDAO;

@Service("shop.shopService")
public class ShopServiceImpl implements ShopService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Product> listCategory() {
		List<Product> list = null;
		
		try {
			list = dao.selectList("shop.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public Product readCategory(long ctNum) {
		Product dto = null;
		
		try {
			dto = dao.selectOne("shop.readCategory", ctNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public List<Product> listSubCategory(long ctNum) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("shop.listSubCategory", ctNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Product readSubCategory(long ctNum) {
		Product dto = null;
		
		try {
			dto = dao.selectOne("shop.readSubCategory", ctNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("shop.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Product> listProd(Map<String, Object> map) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("shop.listProd", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Product readProd(long itemNum) {
		Product dto = null;
		
		try {
			dto = dao.selectOne("shop.readProd", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Product> listProdImage(long itemNum) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("shop.listProdImage", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> listProdOption(long itemNum) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("shop.listProdOption", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> listOptionDetail(long option1Num) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("shop.listOptionDetail", option1Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("shop.insertLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("shop.deleteLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public boolean userLiked(Map<String, Object> map) {
		boolean result = false;
		
		try {
			Product dto = dao.selectOne("shop.deleteLike", map);
			if(dto != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Product> listRelated(long itemNum) {
		List<Product> list = null;
		
		try {
			list = dao.selectList("shop.listRelated", itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int rvDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("shop.rvDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
