<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.yc.weibo.entity.WeiBoUser" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="/vweibo/">
<title>登录后的页面</title>
<link type="text/css" rel="stylesheet" href="front/css/afterlogin.css"/>
<script src="front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="front/js/afterlogin.js"></script>
</head>

<%
	/* HttpSession sessions = request.getSession();
	WeiBoUser user = (WeiBoUser)sessions.getAttribute("user"); */
	
%>
<body id="bg">
	<div id="header">
    	<img class="head_logo" src="front/image/head_logo_sh_mini.png"/>
        <div class="searchTextBorder">
        	<input type="text" class="searchText" placeholder="微微一笑很倾城" onClick="searchClick()" onBlur="searchBlur()"/>
            <a href="javascript:void(0)" class="search_pic"></a>
        </div>
        <ul>
        	<li><a href="javascript:void(0)" class="homePage">首页</a></li>
            <li><a href="javascript:void(0)" class="videoPage">视频</a></li>
            <li><a href="javascript:void(0)" class="foundPage">发现</a></li>
            <li><a href="javascript:void(0)" class="gamePage">游戏</a></li>
            <li><a href="javascript:void(0)" class="personPage">巴拉拉</a></li>
        </ul>
        <div class="settingArea">
        	<a href="javascript:void(0)" class="message_pic"></a>
            <a href="javascript:void(0)" class="setting_pic"></a>
            <a href="javascript:void(0)" class="sendMess_pic"></a>
        </div>
	</div>
	
	
<div id="frame">
	<div id="left-part">
    	
        <ul id="left-part-content">
            <li style="height:25px;"><a href="javascript:void(0)" id="one">首页</a></li>
            <li style="height:25px;"><a href="javascript:void(0)" id="two">我的收藏</a></li>
            <li style="height:25px;"><a href="javascript:void(0)" id="two">我的赞</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo1.jpg" class="img"/><a href="javascript:void(0)" id="two">热门微博</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo2.jpg" class="img1"/><a href="javascript:void(0)" id="two">好友圈</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo3.jpg" class="img1"/><a href="javascript:void(0)" id="two">群微博</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo4.jpg" class="img"/><a href="javascript:void(0)" id="two">特别关注</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">大学</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">搞笑</a></li>
            <li style="height:25px;"><img src="front/image/afterlogin_logo5.jpg" class="img2"/><a href="javascript:void(0)" id="two">时尚</a></li>
        </ul>
        
    </div>
    <div id="center-part">
    	<div id="center-part-content">
        	<p>
                <span id="s1"><img src="front/image/weibonav.png"/></span>
                <a href="javascript:void(0)"><span id="s2" style="color:red;">王宝强，马蓉离婚案</span></a>
        	</p>
       		<textarea class="W_input" id="txt" title="微博输入框" name="" node-type="textE1" content=""></textarea>
        	<a href="javascript:void(0)" id="wword"><img src="front/image/write_img1.png" id="wimg"/>表情</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img2.png" id="wimg"/>图片</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img3.png" id="wimg"/>视频</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img4.png" id="wimg"/>话题</a>
            <a href="javascript:void(0)" id="wword"><img src="front/image/write_img5.png" id="wimg"/>头条文章</a>
            <a href="javascript:void(0)" class="wword" id="moreimg" onMouseOver="changemoreimg()" onMouseOut="changemoreimgs()" style="position:relative;top:5px;"><img src="front/image/write_img6.png"/></a>
            
            <a href="javascript:void(0)" id="aa" onClick='showhidediv("choose")'>公开<img src="front/image/limits_img5.png"/></a>
            <input name="imgbtn" type="image" src="front/image/write_img7.png" id="fabu">	
            
            <div id="choose" style="display:none;" onMouseUp="hidediv()">
            	<ul>
					<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changeword()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                    <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changeword1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                   	<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changeword2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                    <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changeword3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
                </ul>
           
            </div>
    	</div>
        
        <div id="navigation" style="display:block">
        	<a href="javascript:void(0)" id="na1">全部</a>
            <a href="javascript:void(0)" id="na1">原创</a>
            <a href="javascript:void(0)" id="na1">视频</a>
            <a href="javascript:void(0)" id="na1">图片</a>
            <a href="javascript:void(0)" id="na1">音乐</a>
            <a href="javascript:void(0)" id="na1">文章</a>
            <div id="nav_search">
                <input type="text" id="search_text" placeholder="搜索我关注人的微博"/>
                <a href="javascript:void(0)"><img src="front/image/icon_search.png" id="nav-search"/></a>
                <a href="javascript:void(0)" id="nav-icon" onMouseOver="changecolor()" onMouseOut="changecolors()" onClick='changesupersearch(1)'><img src="front/image/navigation_icon.png"/></a>
    		</div>
        </div>
        
        <div id="supersearch" style="display:none;background:#FFF;position:relative;top:10px">
            <p style="font-size:14px;font-weight:bold; margin-left:20px;position:relative;top:10px;">高级搜索</p>
            <a href="javascript:void(0)" id="superdivclose" class="superdivclose" onMouseOut="superdivcloseimg('superdivclose')" onClick="changesupersearch(2)" onMouseOver="superdivcloseimg2('superdivclose')"><img src="front/image/superdivclose.png" id="closepng"></a>
           	类&nbsp;&nbsp;&nbsp;型：<input type="checkbox" id="check" checked="checked" style="margin-top:30px;"/>原创
           	<input type="checkbox" checked="checked" id="check"/>转发&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>纯文字&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含图片&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含视频&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含音乐&nbsp;&nbsp;
           	<input type="checkbox" checked="checked" id="check"/>含文章<br>
           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关键字：<input type="text" id="keyword" placeholder="查找我关注人的微博" style="margin-top:10px;height:28px;"/><br>
           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;间：<input type="text" id="dateone" placeholder="选择日期" style="margin-top:10px;height:28px;"/>&nbsp;到&nbsp;<input type="text" id="datetwo" placeholder="2016-08-30" style="height:28px;"/><br>
           	<input type="image" src="front/image/supersearch.png" id="searchbtn" style="position:relative;left:70px;margin-top:20px;"/>
        </div>
       
        <div id="center-part-content_01" style="margin-top:20px;">
            <a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img title="啦啦啦" src="front/image/userphoto003.png"/></a>
            <a href="javascript:void(0)" class="center-part_way" id="center-part_way" onClick='showcenterhidediv("center-partchoose")' onMouseOver="changecentercolor('center-part_way')" onMouseOut="changecentercolors('center-part_way')"><img src="front/image/conter-part_wayimg01.png"/></a>
                <div style="display:none;" class="center-partchoose"  id="center-partchoose" onMouseUp="hidecenterdiv('center-partchoose')">
                    <ul>
                        <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                       <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>
                        <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                       <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                    </ul>
                </div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;position:relative;left:18px;">APP菌</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">8</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">【The Clocks】跟Fliqlo类似，都是拍照时候的背景神器[
                doge]！而且相比之下TheClocks有数字和指针两种形式，还可以设定闹铃中区也有，而且free帮APP菌卖安利#</p>
               <div id="content_img01">
               		<img src="front/image/weiboimg003.png"/>
               </div>
               
               <div id="center_footnum" class="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv('center_footnum1_col')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv('center_footnum2_transmit')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv('comment_div')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
               
             
               <div id="center_footnum1_col" class="center_footnum1_col" style="display:none;">
               		<div id="collection_div_unline">
               			<span id="collection_div_title">收藏</span>
                        <a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg('colle_closepng_a')" onClick="changecollectionsearch('center_footnum1_col')" onMouseOver="collectiondivcloseimg2('colle_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="collection_div_tishi">
                    	<img src="front/image/collectionsuccess.png" id="collection_div_img"/>
                        <span id="collection_div_su">收藏成功!</span>
                    </div>
                    <div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>
                   
              		<div id="keyword" style="width:390px;height:32px;">
                    	<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>
                        
                        <div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>
                        <input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv('center_footnum1_col')"/></div>
                    </div>
           	  </div>
              
          <div id="center_footnum2_transmit" class="center_footnum2_transmit" style="display:none;">
              		<div id="transmit_div_unline">
                    	<span id="transmit_div_title">转发微博</span>
                        <a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg('transmit_closepng_a')" onClick="changetransmitsearch('center_footnum2_transmit')" onMouseOver="transmitdivcloseimg2('transmit_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="transmit_header">
                    	<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>
                    </div>
              		<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>
                <a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>
           		<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>
                <a href="javascript:void(0)" id="transmit_aa" onClick='showhidetransmitdiv("transmit_choose")'>公开<img src="front/image/limits_img5.png"/></a>
       			<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">
                    
                    <div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv('transmit_choose')">
                        <ul>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
                        </ul>
           			 </div>
              </div>
              
              <div id="comment_div" class="comment_div" style="display:none;">
              		<img src="front/image/comment_header_img.png" id="comment_img">
                    <input type="text" id="comment_input"/><br>
                    <a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>
           			<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>
                    <input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>
                    <img src="front/image/comment_btn.png" id="comment_btn"/>
              </div>
              
        </div>
        
       <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="front/image/userphoto001.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way1" onClick="showcenterhidediv('center-part_choose1')"      onMouseOver="changecentercolor('center-part_way1')" onMouseOut="changecentercolors('center-part_way1')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose" id="center-part_choose1" onMouseUp="hidecenterdiv('center-part_choose1')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                   	  </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;position:relative;left:18px;">百科酱</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">3</a>小时前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">阿里巴巴集团董事局主席马云成功的十大法则！不要抱怨，寻找机会，时刻拥有梦想，尊重文化，取一个好听的名字</p>
               <div id="content_img01"><img src="front/image/weiboimg002.png"/></div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv('center_footnum1_col')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv('center_footnum2_transmit')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv1('comment_div1')"><img src="front/image/center-part_foot03.png" id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
               
               <div id="center_footnum1_col" style="display:none;">
               		<div id="collection_div_unline">
               			<span id="collection_div_title">收藏</span>
                        <a href="javascript:void(0)" id="colle_closepng_a" onMouseOut="collectiondivcloseimg('colle_closepng_a')" onClick="changecollectionsearch('center_footnum1_col')" onMouseOver="collectiondivcloseimg2('colle_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="collection_div_tishi">
                    	<img src="front/image/collectionsuccess.png" id="collection_div_img"/>
                        <span id="collection_div_su">收藏成功!</span>
                    </div>
                    <div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>
                   
              		<div id="keyword" style="width:390px;height:32px;">
                    	<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>
                        
                        <div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>
                        <input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv('center_footnum1_col')"/></div>
                    </div>
           	  </div>
              
          <div id="center_footnum2_transmit" style="display:none;">
              		<div id="transmit_div_unline">
                    	<span id="transmit_div_title">转发微博</span>
                        <a href="javascript:void(0)" id="transmit_closepng_a" onMouseOut="transmitdivcloseimg('transmit_closepng_a')" onClick="changetransmitsearch('center_footnum2_transmit')" onMouseOver="transmitdivcloseimg2('transmit_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="transmit_header">
                    	<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>
                    </div>
              		<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>
                <a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>
           		<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>
                <a href="javascript:void(0)" id="transmit_aa" onClick='showhidetransmitdiv("transmit_choose")'>公开<img src="front/image/limits_img5.png"/></a>
       			<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">
                    
                    <div id="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv('transmit_choose')">
                        <ul>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
                        </ul>
           			 </div>
              </div>
              
              <div id="comment_div1" class="comment_div" style="display:none;">
              		<img src="front/image/comment_header_img.png" id="comment_img">
                    <input type="text" id="comment_input"/><br>
                    <a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>
           			<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>
                    <input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>
                    <img src="front/image/comment_btn.png" id="comment_btn"/>
              </div>
                
        </div>
       
       <div id="center-part-content_01">
            	<a href="javascript:void(0)" id="center-part_img"><img src="front/image/userphoto004.png"/></a>
                <a href="javascript:void(0)" class="center-part_way" id="center-part_way2" onClick='showcenterhidediv("center-part_choose2")' onMouseOver="changecentercolor('center-part_way2')" onMouseOut="changecentercolors('center-part_way2')"><img src="front/image/conter-part_wayimg01.png"/></a>
                    <div style="display:none;" class="center-partchoose"  id="center-part_choose2" onMouseUp="hidecenterdiv('center-part_choose2')">
                        <ul>
                            <li class="center-partc1" id="center-partchoose1" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">帮上头条</a></li><br>
                           <li class="center-partc1" id="center-partchoose2" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">屏蔽</a></li><br>
                            <li class="center-partc1" id="center-partchoose3" style="height:20px;width:130px;"><a href="javascript:void(0)" id="center-parta1">取消关注</a></li>
                           <li class="center-partc1" id="center-partchoose4" style="height:20px;width:130px;"> <a href="javascript:void(0)" id="center-parta1">举报</a></li>
                        </ul>
                	</div>
   
                <ul id="center-part_ul" style="width:180px;position:relative;left:-140px;">
                	<li id="center-part_li" style="height:15px;position:relative;left:18px;">网易云音乐</li>
                    <li style="height:15px;width:150px;"><a href="javascript:void(0)">20</a>分钟前 来自 weibo.com</li>
                </ul>
                <p id="center-part_p" style="width:500px;position:relative;left:29px;">音乐一响起，好似曾经的追剧时光回来了！用一首歌的时间去感受中国电视剧20年！一起来看！</p>
               <div id="content_img01">
               		<img src="front/image/weibonewimg001.png"/>
               </div>
               
               <div id="center_footnum">
                   <a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv('center_footnum1_col')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>
                   <a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv('center_footnum2_transmit')"><img src="front/image/center-part_foot02.png" id="foot01_img"/>204</a>
                   <a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv2('comment_div2')"><img src="front/image/center-part_foot03.png"  id="foot01_img"/>45</a>
                   <a href="javascript:void(0)" id="center_footnum4"><img src="front/image/center-part_foot04.png" id="foot01_img"/>765</a>
               </div>
               
               <div id="center_footnum1_col" style="display:none;">
               		<div id="collection_div_unline">
               			<span id="collection_div_title">收藏</span>
                        <a href="javascript:void(0)" id="colle_closepng_a" onMouseOut="collectiondivcloseimg('colle_closepng_a')" onClick="changecollectionsearch('center_footnum1_col')" onMouseOver="collectiondivcloseimg2('colle_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="collection_div_tishi">
                    	<img src="front/image/collectionsuccess.png" id="collection_div_img"/>
                        <span id="collection_div_su">收藏成功!</span>
                    </div>
                    <div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>
                   
              		<div id="keyword" style="width:390px;height:32px;">
                    	<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>
                        
                        <div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png"/>
                        <input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv('center_footnum1_col')"/></div>
                    </div>
           	  </div>
              
          <div id="center_footnum2_transmit" style="display:none;">
              		<div id="transmit_div_unline">
                    	<span id="transmit_div_title">转发微博</span>
                        <a href="javascript:void(0)" id="transmit_closepng_a" onMouseOut="transmitdivcloseimg('transmit_closepng_a')" onClick="changetransmitsearch('center_footnum2_transmit')" onMouseOver="transmitdivcloseimg2('transmit_closepng_a')"><img src="front/image/superdivclose.png" id="colle_closepng"></a>
                    </div>
                    <div id="transmit_header">
                    	<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>
                    </div>
              		<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>
                <a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>
           		<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>
                <a href="javascript:void(0)" id="transmit_aa" onClick='showhidetransmitdiv("transmit_choose")'>公开<img src="front/image/limits_img5.png"/></a>
       			<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">
                    
                    <div id="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv('transmit_choose')">
                        <ul>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:8px;"/>公开</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:8px;right:5px;">好友圈</li></a><br>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:8px;">仅自己可见</li></a>
                            <a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:90px;height:2px;position:relative;top:4px;right:5px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;bottom:8px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:8px;">群可见</li></a>
                        </ul>
           			 </div>
              </div>
              
              <div id="comment_div2" class="comment_div" style="display:none;">
              		<img src="front/image/comment_header_img.png" id="comment_img">
                    <input type="text" id="comment_input"/><br>
                    <a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>
           			<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>
                    <input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>
                    <img src="front/image/comment_btn.png" id="comment_btn"/>
              </div>
            </div>
               
        </div>
       
    </div> 
    
    <div id="right-part">
    	<div id="right-part-content">
        	<a href="javascript:void(0)" id="user_img"><img src="front/image/userimg.jpg"/></a>
            <a href="javascript:void(0)" id="user_name">${ sessionScope.user.uname }</a>
            <a href="javascript:void(0)" id="vip_img"><img src="front/image/vip_logo.jpg"/></a>
            <div id="levelimg">
            	<a href="javascript:void(0)" id="level">Lv.10</a>
            </div>
            <div id="usernum">
                <a href="javascript:void(0)" id="usernumone"><font id="num">209</font>关注</a>
                <a href="javascript:void(0)" id="usernumone"><font id="num">29</font>粉丝</a>
                <a href="javascript:void(0)" id="usernumone"><font id="num">129</font>微博</a>
            </div>
        </div>
        
        <div class="hot_topic">
            <span class="hot_topic_head">热门话题<a href="javascript:void(0)" class="hot_topic_change">换一换</a></span>
            <div class="hot_topic_content">
                <a href="javascript:void(0)" class="hot_topic_detail">#胖子没人爱#</a><span class="hot_topic_detail_click">172.2万</span><br/>
                <a href="javascript:void(0)" class="hot_topic_detail">#胖子没#</a><span class="hot_topic_detail_click">172.2万</span><br/>
                <a href="javascript:void(0)" class="hot_topic_detail">#胖子没人爱#</a><span class="hot_topic_detail_click">172.2万</span><br/>
                <a href="javascript:void(0)" class="hot_topic_detail">#胖子没人爱#</a><span class="hot_topic_detail_click">172.2万</span><br/>
                <a href="javascript:void(0)" class="hot_topic_detail">#胖子没人爱#</a><span class="hot_topic_detail_click">172.2万</span><br/>
                <a href="javascript:void(0)" class="hot_topic_detail">#胖子爱#</a><span class="hot_topic_detail_click">172.2万</span><br/>
                <a href="javascript:void(0)" class="hot_topic_detail">#胖子没人爱#</a><span class="hot_topic_detail_click">172.2万</span><br/>
            </div>
         </div>


		<div class="goodfriend_trends">
			<div id="goodfriend_trends_head">
            	<span class="goodfriend_trends_head">好友关注动态</span>
            </div>
            <span class="goodfriend_trends_detail">你赞过他的微博</span><br/>
            <div class="goodfriend_trends_content">
              	 <img src="front/image/goodfriend_trens.png" id="goodfriend_img"/>
              	 <a href="javascript:void(0)"><span id="goodfriend_word1">文神原</span></a><br>
              	 <a href="javascript:void(0)"><span id="goodfriend_word2">新兰本《初》编...</span></a>
              	 <input type="image" src="front/image/attention_friend.png" id="goodfriend_attention"/>
            </div>
         </div>
		
		
        
    </div> 
    
    <!-- <div id="foot-part">
    	<img alt="呼呼" src="front/image/weibofoot.png"/>
    </div>
        -->
    <div id="buoys">
    	<img src="front/image/letterchat.png" id="buoysimg1"/><span id="buoyschat">私信聊天</span><img src="front/image/chatmes.png" id="buoysimg2"/>
    </div>
</div>
</body>
</html>

