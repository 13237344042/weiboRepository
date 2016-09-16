package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;


public interface WeiboService {
	boolean addWeibo(Map<String, Object> map);
	int selectCurrMaxWBid();
	boolean initWeibohelp(int currWBid);
	
	boolean updateaddWeiboLike(int wbid);
	boolean updateminuWeiboLike(int wbid);
	int selectAfterLikeGreateAcount(int wbid);
	
	boolean updateCollectionAccount(int wbid);
	int selectAfterCollection(int wbid);
	
	char selectTransmityon(int wbid);
	List<Map<String,Object>> selectWeiboandweiboHelpById(int wbid);
	
	
	
	List<Map<String,Object>> findWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findtWeiboOrderByWHgreateAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findWeiboOrderByWBdate(Map<String,Integer> map);
	List<Map<String, Object>> findHotWeiBo(Map<String,Integer> map);
	List<Map<String, Object>> findFriendWeiBo(Map<String, Integer> params);
	List<Weibo> myCollections(int wBUid);
}
