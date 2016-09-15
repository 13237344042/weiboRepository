package com.yc.weibo.service;

import java.util.List;
import java.util.Map;


public interface WeiboService {
	boolean addWeibo(Map<String, Object> map);
	int selectCurrMaxWBid();
	boolean initWeibohelp(int currWBid);
	
	boolean updateaddWeiboLike(int wbid);
	boolean updateminuWeiboLike(int wbid);
	int selectAfterLikeGreateAcount(int wbid);
	
	boolean updateCollectionAccount(int opnum, int wbid);
	int selectAfterCollection(int wbid);
	
	List<Map<String,Object>> findWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findtWeiboOrderByWHgreateAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findWeiboOrderByWBdate(Map<String,Integer> map);
	List<Map<String, Object>> findHotWeiBo(Map<String,Integer> map);
}
