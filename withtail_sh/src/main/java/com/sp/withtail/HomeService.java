package com.sp.withtail;

import java.util.List;

public interface HomeService {
	public List<Home> listRank(int num);
	public List<Home> listHotdeal(int num);
	public List<Home> listnewst(int num);
	public int cartCount(String id);
}
