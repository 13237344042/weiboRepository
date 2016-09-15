//JavaScript Document
var range = 50;             //距下边界长度/单位px  
var elemt = 500;           //插入元素高度/单位px  
var maxnum = 15;            //设置加载最多次数  
var num = 1;  
var totalheight = 0; 

var clicklikenum = 1;

var commentdivnum = 1;
var transmitdivnum = 1;
var collectiondivnum = 1;

var dataStrArrcopy = '';

var userid = 0;  //当前登录的用户

window.onload=function(){
	
	uid = $("#user").val().trim();
	
	if(uid != ""){
		userid = parseInt(uid);
	}
	var pageSize = 15;
	var pageNum = 1;
	
	$.ajax({
		  url: "weibo/afterLoginDataPrarery",
		  cache: false,
		  data:{"pageSize":pageSize,"pageNum":pageNum,"userid":userid},
		  dataType:"json",
		  Type:"GET",
		  success: function(data,textStatus){
		    if(data){
		    	dataStrArrcopy = JSON.stringify(data.weiboList); //json对象转化为json字符串

		    	for(var zz = 0;zz < 6; zz ++){
		    		var dataMsg = data.weiboList[zz];
		    		if(dataMsg != undefined){
		    			
		    		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
		    		var wbuid = dataMsg.WBUID//发表微博的用户id
		    		var weiboid = dataMsg.WBID; //微博id
		    		var username = dataMsg.UNAME;  //用户名
		    		var userImgPaht = dataMsg.UIMGPATH; //用户图像路径
		    		var location = dataMsg.WBLOCATION; //地理位置/电脑用户名 
		    			
		    		
		    		var videoMap = ''; //视频路径
					var picsMap = ''; //图片路径 
					var musicMap = '';//音乐路径
					if(dataMsg.WBPIC != undefined){
						picsMap = dataMsg.WBPIC;
					}
					if(dataMsg.WBVIDEO != undefined){
						videoMap = dataMsg.WBVIDEO;
					}
					if(dataMsg.WBMUSIC != undefined){
						musicMap = dataMsg.WBMUSIC; 
					}
					var newDate = new Date();
					newDate.setTime(dataMsg.WBDATE);
					var date = newDate.toLocaleString().substring(newDate.toLocaleString().indexOf(" "));
					
					var newStr = '';
					
					newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'"/></a>';
					newStr += '<ul id="center-part_ul">';
					newStr += '<li id="center-part_li">'+username+'</li>';
	                newStr += '<li style="height:0px;width:150px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
	                newStr += '</ul>';
	                
					//表情处理
					var newContent ='';
					var newContent1 = '';
					faceArr = content.split("[");
					for(var k = 0; k < faceArr.length; k ++){
						if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
							faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
							newContent += faceArr[k];
						}
						if(faceArr[k].split("]]").length > 1){
							newContent = '[['+faceArr[k]+newContent;
						}
					}
					
					/*console.info(content);
					console.info(faceArr);
					console.info(newContent); */
					var faceRegx1 = new RegExp('\\n','gi');
					faceArr1 = newContent.split(faceRegx1);
					for(var j = 0; j < faceArr1.length; j ++){
						newContent1 += faceArr1[j]+'<br />';
					}
					newStr += '<p id="center-part_p" style="width:500px;position:relative;left:29px;">'+newContent1+'</p>';
				
					newStr += '<div id="content_img01">';
					
					//图片处理 
					if (picsMap != "") {
						var pics = picsMap.split(",");
						//console.info(pics);
						if(pics.length == 1){
							newStr += '<img width="500px;" height="250px;" src="/weibopics/'+pics[0]+'"/>';
						}else if(pics.length == 2){
							for(var l = 0; l < pics.length; l ++){
								newStr += '<img width="245px;" height="250px;" src="/weibopics/'+pics[l]+'"/>';
							}
						}else if(pics.length == 3){
							for(var m = 0; m < pics.length; m ++){
								newStr += '<img width="160px;" height="250px;" src="/weibopics/'+pics[m]+'"/>';
							}
						}else if(pics.length == 4){
							newStr += '<img style="width:500px;height:330px;" src="/weibopics/'+pics[0]+'"/>';
							for(var n = 1; n < pics.length; n ++){
								newStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+pics[n]+'"/>';
							}
						}else if(pics.length == 9){
							for(var r = 0; r <pics.length; r ++){
								newStr += '<img width="160px;" height="160px;" src="/weibopics/'+pics[r]+'"/>';
							}
						}else{
							//图片轮换
							
							
						}
					}
					
					
					//视频处理 
					if (videoMap != "") {
						var video = videoMap.split(",");
						for (var i = 0; i < video.length; i++) {
							newStr += '<video controls="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
						}
					}

					//音乐处理
					if (musicMap != "") {
						var music = musicMap.split(",");
						for(var i = 0; i < music.length; i ++){
							newStr += '<audio controls="true" src="/weibomusics/'+music[i]+'" style="width:500px;height:25px;"></video>';
						}
					}
					
					newStr += '</div>';
					newStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
					newStr += '<a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
					newStr += '<a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>'; //转发
					newStr += '<a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
					newStr += '<a href="javascript:void(0)" id="center_footnum4" onClick="clicklike(this,'+userid+','+weiboid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';   //点赞
					newStr += '</div>';
					
					
					newStr += '<div id="center_footnum_col_'+collectiondivnum+'" class="center_footnum_col" style="display:none;">';
					newStr += '<div id="collection_div_unline>';
					newStr += '<span id="collection_div_title">收藏</span>';
					newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum_col_'+collectiondivnum+'&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
					newStr += '</div>';
					newStr += '<div id="collection_div_tishi">';
					newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
					newStr += '<span id="collection_div_su">收藏成功!</span>';
					newStr += '</div>';
					newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
					
					newStr += '<div id="keyword" style="width:390px;height:32px;">';
					newStr += '<input type="text" id="keyword_tip_'+collectiondivnum+'" class="keyword_tip1" style="width:390px;height:32px;"/>';
					
					newStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"/>';
					newStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;)"/></div>';
					newStr += '</div>';
					newStr += '</div>';
					
					newStr += '<div id="center_footnum_transmit_'+transmitdivnum+'" class="center_footnum_transmit" style="display:none;">';
					newStr += '<div id="transmit_div_unline">';
					newStr += '<span id="transmit_div_title">转发微博</span>';
					newStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
					newStr += '</div>';
					newStr += '<div id="transmit_header">';
					newStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
					newStr += '</div>';
					newStr += '<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
					newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
					newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
					newStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
					newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">';
					
					newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
					newStr += '<ul>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;">公开</li></a><br>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
					newStr += '</ul>';
					newStr += '</div>';
					newStr += '</div>';
					
					newStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
					newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
					newStr += '<form id="form_'+commentdivnum+'">';
					newStr += '<input type="text" id="comment_input"/><br>';
					newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
					newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
					newStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
					newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo('+userid+','+weiboid+',&quot;form_'+commentdivnum+'&quot;)"/>';
					newStr += '</form>';
					newStr += '</div>';
					
					
					$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  
					
					num ++;
					clicklikenum ++;
					commentdivnum ++;
					transmitdivnum ++;
					collectiondivnum ++;
		    	}  
		      } //for()
		    } //if(data)
		  },  //success
		  error:function(textStatus,error){
			  alert("数据加载有误:"+error);
		  }
		
	}); //ajax
}


//热门微博
function findHotWeiBo(){
uid = $("#user").val().trim();
	
	if(uid != ""){
		userid = parseInt(uid);
	}
	var pageSize = 15;
	var pageNum = 1;
	$.ajax({
		  url: "weibo/findHotWeiBo",
		  cache: false,
		  data:{"pageSize":pageSize,"pageNum":pageNum},
		  dataType:"json",
		  Type:"GET",
		  success: function(data,textStatus){
		    if(data){
		    	alert("i am coming");
		    	dataStrArrcopy = JSON.stringify(data.weiboList); //json对象转化为json字符串

		    	for(var i=0;i<6;i++){
		    		
		    		var dataMsg = data.weiboList[i];
		    		if(dataMsg != undefined){
		    			
		    		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
		    									//用户id
		    		var weiboid = dataMsg.WBID; //微博id
		    		var username = dataMsg.UNAME;  //用户名
		    		var userImgPaht = dataMsg.UIMGPATH; //用户图像路径
		    		var location = dataMsg.WBLOCATION; //地理位置/电脑用户名 
		    			
		    		
		    		var videoMap = ''; //视频路径
					var picsMap = ''; //图片路径 
					var musicMap = '';//音乐路径
					if(dataMsg.WBPIC != undefined){
						picsMap = dataMsg.WBPIC;
					}
					if(dataMsg.WBVIDEO != undefined){
						videoMap = dataMsg.WBVIDEO;
					}
					if(dataMsg.WBMUSIC != undefined){
						musicMap = dataMsg.WBMUSIC; 
					}
					var newDate = new Date();
					newDate.setTime(dataMsg.WBDATE);
					var date = newDate.toLocaleString().substring(newDate.toLocaleString().indexOf(" "));
					
					var newStr = '';
					
					newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'"/></a>';
					newStr += '<ul id="center-part_ul">';
					newStr += '<li id="center-part_li">'+username+'</li>';
	                newStr += '<li style="height:0px;width:150px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
	                newStr += '</ul>';
	                
					//表情处理
					var newContent ='';
					var newContent1 = '';
					faceArr = content.split("[");
					for(var k = 0; k < faceArr.length; k ++){
						if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
							faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
							newContent += faceArr[k];
						}
						if(faceArr[k].split("]]").length > 1){
							newContent = '[['+faceArr[k]+newContent;
						}
					}
					
					/* console.info(content);
					console.info(faceArr);
					console.info(newContent); */
					var faceRegx1 = new RegExp('\\n','gi');
					faceArr1 = newContent.split(faceRegx1);
					for(var j = 0; j < faceArr1.length; j ++){
						newContent1 += faceArr1[j]+'<br />';
					}
					newStr += '<p id="center-part_p" style="width:500px;position:relative;left:29px;">'+newContent1+'</p>';
				
					newStr += '<div id="content_img01">';
					
					//图片处理 
					if (picsMap != "") {
						var pics = picsMap.split(",");
						//console.info(pics);
						if(pics.length == 1){
							newStr += '<img width="500px;" height="250px;" src="/weibopics/'+pics[0]+'"/>';
						}else if(pics.length == 2){
							for(var l = 0; l < pics.length; l ++){
								newStr += '<img width="245px;" height="250px;" src="/weibopics/'+pics[l]+'"/>';
							}
						}else if(pics.length == 3){
							for(var m = 0; m < pics.length; m ++){
								newStr += '<img width="160px;" height="250px;" src="/weibopics/'+pics[m]+'"/>';
							}
						}else if(pics.length == 4){
							newStr += '<img style="width:500px;height:330px;" src="/weibopics/'+pics[0]+'"/>';
							for(var n = 1; n < pics.length; n ++){
								newStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+pics[n]+'"/>';
							}
						}else if(pics.length == 9){
							for(var r = 0; r <pics.length; r ++){
								newStr += '<img width="160px;" height="160px;" src="/weibopics/'+pics[r]+'"/>';
							}
						}else{
							//图片轮换
							
							
						}
					}
					
					
					//视频处理 
					if (videoMap != "") {
						var video = videoMap.split(",");
						for (var i = 0; i < video.length; i++) {
							newStr += '<embed autoplay="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
						}
					}

					//音乐处理
					if (musicMap != "") {
						var music = musicMap.split(",");
						for(var i = 0; i < music.length; i ++){
							newStr += '<audio autoplay="true" style="width:100px;height:100px;display:block;" src="/weibomusics/'+music[i]+'"/>';
						}
					}
					
					newStr += '</div>';
					newStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
					newStr += '<a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;)"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';	//收藏
					newStr += '<a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>'; //转发
					newStr += '<a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';		//评论
					newStr += '<a href="javascript:void(0)" id="center_footnum4" onClick="clicklike(this,'+userid+','+weiboid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';   //点赞
					newStr += '</div>';
					
					
					newStr += '<div id="center_footnum_col_'+collectiondivnum+'" class="center_footnum_col" style="display:none;">';
					newStr += '<div id="collection_div_unline>';
					newStr += '<span id="collection_div_title">收藏</span>';
					newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum_col_'+collectiondivnum+'&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
					newStr += '</div>';
					newStr += '<div id="collection_div_tishi">';
					newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
					newStr += '<span id="collection_div_su">收藏成功!</span>';
					newStr += '</div>';
					newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
					
					newStr += '<div id="keyword" style="width:390px;height:32px;">';
					newStr += '<input type="text" id="keyword_tip1" style="width:390px;height:32px;"/>';
					
					newStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;keyword_tip1&quot;,&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"/>';
					newStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"/></div>';
					newStr += '</div>';
					newStr += '</div>';
					
					newStr += '<div id="center_footnum_transmit_'+transmitdivnum+'" class="center_footnum_transmit" style="display:none;">';
					newStr += '<div id="transmit_div_unline">';
					newStr += '<span id="transmit_div_title">转发微博</span>';
					newStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
					newStr += '</div>';
					newStr += '<div id="transmit_header">';
					newStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
					newStr += '</div>';
					newStr += '<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
					newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
					newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
					newStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
					newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">';
					
					newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
					newStr += '<ul>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:4px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;">公开</li></a><br>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:4px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:2px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:10px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:2px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
					newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:17px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:2px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
					newStr += '</ul>';
					newStr += '</div>';
					newStr += '</div>';
					
					newStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
					newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
					newStr += '<input type="text" id="comment_input"/><br>';
					newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
					newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
					newStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
					newStr += '<img src="front/image/comment_btn.png" id="comment_btn" onClick="commentsWeibo()"/>';
					newStr += '</div>';
					
					
					$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  
					
					num ++;
					clicklikenum ++;
					commentdivnum ++;
					transmitdivnum ++;
					collectiondivnum ++;
		    	}  
		      }
		    }
		  },
		  error:function(textStatus,error){
			  alert("数据加载有误:"+error);
		  }
		
	}); 
	
}



$(window).scroll(function(){  
	var srollPos = $(window).scrollTop();    //滚动条距顶部距离(页面超出窗口的高度)  
	
	//console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop());  
	//console.log("页面的文档高度 ："+$(document).height());  
	//console.log('浏览器的高度：'+$(window).height());  
	
	totalheight = parseFloat($(window).height()) + parseFloat(srollPos);  
	
	if(($(document).height()-range) <= totalheight  && num<=maxnum) { 

		var newDataArr = dataStrArrcopy.split('},{');

		var dataMsgPre = '{'+newDataArr[num-1]+'}';
		
		if(num == newDataArr.length && dataMsgPre != undefined && dataMsgPre != ""){
			dataMsgPre = '{'+newDataArr[num-1].substring(0,newDataArr[num-1].length-1);
		}
		if(dataMsgPre == '{}' || dataMsgPre == '{undefined}' || dataMsgPre =='{'|| dataMsgPre =='}'){
			return;
		}
		
		var dataMsg = JSON.parse(dataMsgPre);
		
		//var dataStrJson =  JSON.parse(dataStrArr)   //将json字符串转换为JSON对象
		
		//console.info(dataStrJson);

		//var dataMsg = data.weiboList[i];
		var content = dataMsg.WBTXT; //首先已经确定他的内容不为空了！
		var wbuid = dataMsg.WBUID;  //发表微博的用户id
		var username = dataMsg.UNAME;  //用户名
		var weiboid = dataMsg.WBID;  //微博id
		var userImgPaht = dataMsg.UIMGPATH; //用户图像路径
		var location = dataMsg.WBLOCATION; //地理位置/电脑用户名 
		
		var videoMap = ''; //视频路径
		var picsMap = ''; //图片路径 
		var musicMap = '';//音乐路径
		if(dataMsg.WBPIC != undefined){
			picsMap = dataMsg.WBPIC;
		}
		if(dataMsg.WBVIDEO != undefined){
			videoMap = dataMsg.WBVIDEO;
		}
		if(dataMsg.WBMUSIC != undefined){
			musicMap = dataMsg.WBMUSIC; 
		}
		var newDate = new Date();
		newDate.setTime(dataMsg.WBDATE);
		var date = newDate.toLocaleString().substring(newDate.toLocaleString().indexOf(" "));
		
		var newStr = '';
		
		newStr += '<a href="javascript:void(0)" id="center-part_img" class="center-part_img"><img title="'+username+'" src="/weibouserimages/'+userImgPaht+'"/></a>';
		newStr += '<ul id="center-part_ul">';
		newStr += '<li id="center-part_li">'+username+'</li>';
        newStr += '<li style="height:0px;width:150px;"><a href="javascript:void(0)">'+date+'</a> 来自 '+location+'</li>';
        newStr += '</ul>';
        
		//表情处理
		var newContent ='';
		var newContent1 = '';
		faceArr = content.split("[");
		for(var k = 0; k < faceArr.length; k ++){
			if(faceArr[k] != "" && faceArr[k].split("]]").length == 1 && faceArr[k].split("]").length > 1){ //说明是表情 
				faceArr[k] = '<img src="front/image/face_image/'+faceArr[k].split("]")[0]+'.png" />'+faceArr[k].split("]")[1];
				newContent += faceArr[k];
			}
			if(faceArr[k].split("]]").length > 1){
				newContent = '[['+faceArr[k]+newContent;
			}
		}
		
	
		var faceRegx1 = new RegExp('\\n','gi');
		faceArr1 = newContent.split(faceRegx1);
		for(var j = 0; j < faceArr1.length; j ++){
			newContent1 += faceArr1[j]+'<br />';
		}
		newStr += '<p id="center-part_p" style="width:500px;position:relative;left:29px;">'+newContent1+'</p>';
	
		newStr += '<div id="content_img01">';
		
		//图片处理 
		if (picsMap != "") {
			var pics = picsMap.split(",");
			//console.info(pics);
			if(pics.length == 1){
				newStr += '<img width="500px;" height="250px;" src="/weibopics/'+pics[0]+'"/>';
			}else if(pics.length == 2){
				for(var l = 0; l < pics.length; l ++){
					newStr += '<img width="245px;" height="250px;" src="/weibopics/'+pics[l]+'"/>';
				}
			}else if(pics.length == 3){
				for(var m = 0; m < pics.length; m ++){
					newStr += '<img width="160px;" height="250px;" src="/weibopics/'+pics[m]+'"/>';
				}
			}else if(pics.length == 4){
				newStr += '<img style="width:500px;height:330px;" src="/weibopics/'+pics[0]+'"/>';
				for(var n = 1; n < pics.length; n ++){
					newStr += '<img style="width:160px;height:80px;padding-right:3px;padding-left:3px;padding-top:3px;" src="/weibopics/'+pics[n]+'"/>';
				}
			}else if(pics.length == 9){
				for(var r = 0; r <pics.length; r ++){
					newStr += '<img width="160px;" height="160px;" src="/weibopics/'+pics[r]+'"/>';
				}
			}else{
				//图片轮换
				
				
			}
		}
		
		
		//视频处理 
		if (videoMap != "") {
			var video = videoMap.split(",");
			for (var i = 0; i < video.length; i++) {
				newStr += '<video controls="true" src="/weibovideoes/'+video[i]+'" style="width:500px;height:300px;"/>';
			}
		}

		//音乐处理
		if (musicMap != "") {
			var music = musicMap.split(",");
			for(var i = 0; i < music.length; i ++){
				newStr += '<audio controls="true" src="/weibomusics/'+music[i]+'" style="width:500px;height:25px;"></video>';
			}
		}
		
		newStr += '</div>';
		newStr += '<div id="center_footnum_'+collectiondivnum+'" class="center_footnum">';
		newStr += '<a href="javascript:void(0)" id="center_footnum1" onClick="addcollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"><img src="front/image/center-part_foot01.png" id="foot01_imgs"/>收藏</a>';
		newStr += '<a href="javascript:void(0)" id="center_footnum2" onClick="addtransmitdiv(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)"><img src="front/image/center-part_foot02.png" id="foot01_img"/>'+dataMsg.WHREPRINTACCOUNT+'</a>';
		newStr += '<a href="javascript:void(0)" id="center_footnum3" onClick="addcommentdiv(&quot;comment_div_'+commentdivnum+'&quot;)"><img src="front/image/center-part_foot03.png" id="foot01_img"/>'+dataMsg.WHCOMMENTACCOUNT+'</a>';
		newStr += '<a href="javascript:void(0)" id="center_footnum4" onClick="clicklike(this,'+userid+','+weiboid+')"><img src="front/image/center-part_foot04.png" id="foot01_img"/>'+dataMsg.WHGREATEACCOUNT+'</a>';  //点赞在这里处理
		newStr += '</div>';																	//用户id					//微博id				
		
		
		newStr += '<div id="center_footnum_col_'+collectiondivnum+'" class="center_footnum_col" style="display:none;">';
		newStr += '<div id="collection_div_unline>';
		newStr += '<span id="collection_div_title">收藏</span>';
		newStr += '<a href="javascript:void(0)" id="colle_closepng_a" class="colle_closepng_a" onMouseOut="collectiondivcloseimg(&quot;colle_closepng_a&quot;)" onClick="changecollectionsearch(&quot;center_footnum_col_'+collectiondivnum+'&quot;)" onMouseOver="collectiondivcloseimg2(&quot;colle_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
		newStr += '</div>';
		newStr += '<div id="collection_div_tishi">';
		newStr += '<img src="front/image/collectionsuccess.png" id="collection_div_img"/>';
		newStr += '<span id="collection_div_su">收藏成功!</span>';
		newStr += '</div>';
		newStr += '<div id="collection_div_word"><img src="front/image/tishi.png" id="tishi_img"/><font id="tishi_word">添加标签来管理你的收藏</font></div>';
		
		newStr += '<div id="keyword" style="width:390px;height:32px;">';
		newStr += '<input type="text" id="keyword_tip_'+collectiondivnum+'" class="keyword_tip1" style="width:390px;height:32px;"/>';
		
		newStr += '<div style="height:45px;background:#F0F0F0;width:430px;position:relative;top:16px;right:20px;"><input type="image" id="keyword_tip2" src="front/image/keyword_add.png" onClick="collectiontag(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;,'+userid+','+weiboid+')"/>';
		newStr += '<input type="image" id="keyword_tip2" src="front/image/keyword_cancel.png" onClick="closecollectiondiv(&quot;center_footnum_col_'+collectiondivnum+'&quot;,&quot;keyword_tip_'+collectiondivnum+'&quot;)"/></div>';
		newStr += '</div>';
		newStr += '</div>';
		
		newStr += '<div id="center_footnum_transmit_'+transmitdivnum+'" class="center_footnum_transmit" style="display:none;">';
		newStr += '<div id="transmit_div_unline">';
		newStr += '<span id="transmit_div_title">转发微博</span>';
		newStr += '<a href="javascript:void(0)" id="transmit_closepng_a" class="transmit_closepng_a" onMouseOut="transmitdivcloseimg(&quot;transmit_closepng_a&quot;)" onClick="changetransmitsearch(&quot;center_footnum_transmit_'+transmitdivnum+'&quot;)" onMouseOver="transmitdivcloseimg2(&quot;transmit_closepng_a&quot;)"><img src="front/image/superdivclose.png" id="colle_closepng"></a>';
		newStr += '</div>';
		newStr += '<div id="transmit_header">';
		newStr += '<span id="transmit_header_word">转发到：</span><a href="javascript:void(0)" id="transmit_where">我的微博</a>';
		newStr += '</div>';
		newStr += '<textarea class="transmit_input" id="transmit_txt" title="微博输入框" node-type="textE1" placeholder="请输入转发理由"></textarea>';
		newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img1.png" id="transmit_pace_png"/></a>';
		newStr += '<a href="javascript:void(0)" id="transmit_pace"><img src="front/image/write_img2.png" id="transmit_pace_png"/></a>';
		newStr += '<a href="javascript:void(0)" id="transmit_aa" onClick="showhidetransmitdiv(&quot;transmit_choose&quot;)">公开<img src="front/image/limits_img5.png"/></a>';
		newStr += '<input name="imgbtn" type="image" src="front/image/transmit_sure.png" id="transmit">';
		
		newStr += '<div id="transmit_choose" class="transmit_choose" style="display:none;" onMouseUp="hidetransmitdiv(&quot;transmit_choose&quot;)">';
		newStr += '<ul>';
		newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img1.png" id="limits_img" style="position:relative;top:2px;left:6px"/><li class="c1" id="choose1" onClick="changewords()" style="height:12px;position:relative;bottom:4px;top:3px;"/>公开</li></a><br>';
		newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img2.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose2" onClick="changewords1()" style="height:12px;position:relative;bottom:-1px;top:3px;">好友圈</li></a><br>';
		newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img3.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose3" onClick="changewords2()" style="height:12px;position:relative;bottom:-1px;top:3px;">仅自己可见</li></a>';
		newStr += '<a href="javascript:void(0)" id="choosea1" style="display:inline-block;width:105px;height:3px;position:relative;top:2px;right:-3px;"><img src="front/image/limits_img4.png" id="limits_img" style="position:relative;top:8px;left:6px;"/><li class="c1" id="choose4" onClick="changewords3()" style="height:12px;position:relative;bottom:-2px;top:3px;">群可见</li></a>';
		newStr += '</ul>';
		newStr += '</div>';
		newStr += '</div>';
		
		newStr += '<div id="comment_div_'+commentdivnum+'" class="comment_div" style="display:none;">';
		newStr += '<img src="front/image/comment_header_img.png" id="comment_img">';
		newStr += '<input type="text" id="comment_input"/><br>';
		newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img1.png" id="comment_pace_png"/></a>';
		newStr += '<a href="javascript:void(0)" id="comment_pace"><img src="front/image/write_img2.png" id="comment_pace_png"/></a>';
		newStr += '<input type="checkbox" id="comment_check"><span id="comment_check_word">同时转发到我的微博</span>';
		newStr += '<img src="front/image/comment_btn.png" id="comment_btn"/>';
		newStr += '</div>';
		
		
		$("#xixi").append('<div id="center-part-content_01" class="divid_'+clicklikenum+'">'+newStr+'</div>');  
			
 		num ++;  //用于刷新点赞后的点赞数
 		clicklikenum ++;
 		commentdivnum ++;
		transmitdivnum ++;
		collectiondivnum ++;
	}  
}); 

//点赞功能                      			//用户id   //微博id
function clicklike(obj,userid,wbid){
	$.ajax({
		url: "weibo/addclicklike",
		  cache: false,
		  data:{'userid':userid,'wbid':wbid},
		  dataType:"json",
		  type:"get",
		  success: function(data,textStatus){
			  if(data.success){
				  obj.innerHTML = '<img src="front/image/center-part_foot04.png" id="foot01_img"/>'+data.greateAccount;
			  }
		  },
		  error:function(error,textStatus){
			  alert("点赞是发生错误："+error);
		  }
	});
};

//收藏功能
function collectiontag(collectionobj,inputobj,uid,weiboid){
	var input = document.getElementById(inputobj);
	var txt = input.value;   //得到text的值
	alert(txt);
	$.ajax({
		  url: "weibo/addcollection",
		  cache: false,
		  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		  data:{'uid':uid,'wbid':weiboid,'txt':txt},
		  dataType:"json",
		  type:"post",
		  success: function(data,textStatus){
			  if(data.success){
				  $("#"+inputobj).val('');
				  $("#"+collectionobj).hide();
			  }
		  },
		  error:function(error,textStatus){
			  alert("收藏时发生错误："+error);
		  }
	});
}

//评论回复功能
/*<script>
  $('input[type=checkbox]').change(function(){
    $('#Jszzdm').val($('input[type=checkbox]:checked').map(function(){return this.value}).get().join(','))
  })
</script>*/
function commentsWeibo(userid,weiboid,formid){
	var txtContent = $('#'+formid).$('input[type=text]')[0];
	var booleanCk = $('#'+formid).$('input[type=checkbox]')[0].checked;
	
};


function letRandom(){
	$.ajax({
		url:'theme/random',
		dataType:'JSON',
		type:'POST',
		success:function(data){
			//console.info(data);
			$("#hot_topic_content").html("");
			var str="";
			for(var i=0;i<data.length;i++){//data就是一个theme的List（java中） ，用json传过来以后，在js中，就是数组
				var item=data[i];//这里就是数组的元素了  就是一个theme
				//alert(item.tname);
				str+='<li style="margin-bottom:0px;"><a href="javascript:showthemedetails('+item.tid+')" class="hot_topic_detail">'+item.tname+'</a><span class="hot_topic_detail_click">'+item.tview+'</span></li>';
				$("#hot_topic_content").html(str);
			}//要想到，之后如果要在这个上面做点击事件的话，所以先预留一下，只要有id传过来了，这个事件就好做了，
			
			
			/*后端用session，，request，等来保存参数，而且最后还跳了页面，那肯定是到页面上用el表达式取值
			后端用json传值，前端一般用ajax请求，这个时候不会跳页面，而且，json字符串直接作为ajax的success的回调的data
			直接返回了，那就直接用这个json字符串，进行json对象的处理，*/
			
			
			
			
			$("#hot_topic_content").html(str);
			//html(str+$("#hot_topic_content").html(str));
			//在最前面就是： str+原本的内容        在最后面： 原本  +str
		}
	});
}

  
//计算中文字符
function byteLength(str) {
	var byteLen = 0, len = str.length;
	if (!str)
		return 0;
	for (var i = 0; i < len; i++)
		byteLen += str.charCodeAt(i) > 255 ? 1 : 1;

	return byteLen;
}

//微博输入框
$(document).ready(function(){   
	var txt=document.getElementById("txt");
	var str;

	//键盘监听事件
	txt.addEventListener("keyup",function(){
		str=byteLength(txt.value);
		if(str>140){
			document.getElementById("s2").innerHTML='<span style="color:#666">已经超出了'+(str-140)+'个字</span>';	
		}else{
			document.getElementById("s2").innerHTML='<span style="color:#666">您还可以输入'+(140-str)+'个字</span>';	
		}
	});

	//获得焦点事件
	txt.addEventListener("focus",function(){
		str=txt.value;
		if(str.length<=140){
			document.getElementById("s2").innerHTML='<span style="color:#666">您还可以输入'+(140-str.length)+'个字</span>';	
		}else{
			document.getElementById("s2").innerHTML='<span style="color:#666">您还可以输入0个字</span>';	
		}
	});

	//失焦事件
	txt.addEventListener("blur",function(){
		document.getElementById("s2").innerHTML="王宝强，马蓉离婚案";	
	});
});


//改变导航栏的颜色
function searchClick(){
	$('.searchTextBorder').css('border-color','red');	
	$('.searchTextBorder').css('background','#fff');
	$('.searchText').css('background','#fff');
}
function searchBlur(){
	$('.searchTextBorder').css('border-color','#999');	
	$('.searchTextBorder').css('background','#f2f2f2');
	$('.searchText').css('background','#f2f2f2     ');
}

//改变微博输入框下小图标的颜色
function changemoreimg(){
	document.getElementById("moreimg").innerHTML='<img src="front/image/write_img6_1.png"/>'
	}
function changemoreimgs(){
	document.getElementById("moreimg").innerHTML='<img src="front/image/write_img6.png"/>'
	}

//改变颜色 换图片
function changecolor(){
	document.getElementById("nav-icon").innerHTML='<img src="front/image/navigation-iconin.png"/>';
}
function changecolors(){
	document.getElementById("nav-icon").innerHTML='<img src="front/image/navigation_icon.png"/>';
}

//开始隐藏div
function showhidediv(id){
	var sbtitle=document.getElementById(id);
	if(sbtitle){
		if(sbtitle.style.display=='block'){
			sbtitle.style.display='none';
		}else{
			sbtitle.style.display='block';
		}
	}
}


function changeword(obj){
	var oo=$(obj);
	$("#aa").text(oo.html());	//到此是操作屏幕上的内容，    
	//TODO:现在开始操作隐藏域的内容，  隐藏域中   op的值
	//alert(oo.attr("data"));
	$("#form_push_op").attr("value",oo.attr("data"));
}

//换完权限后隐藏div
function hidediv(){
	document.getElementById("choose").style.display='none';
}


function changecentercolor(id){
	document.getElementById(id).innerHTML='<img src="front/image/conter-part_wayimg02.png"/>';
}

function changecentercolors(id){
	document.getElementById(id).innerHTML='<img src="front/image/conter-part_wayimg01.png"/>';
}

function showcenterhidediv(id){
	var sbtitles=document.getElementById(id);
	if(sbtitles){
		if(sbtitles.style.display=='block'){
			sbtitles.style.display='none';
		}else{
			sbtitles.style.display='block';
		}
	}
}

function hidecenterdiv(id){
	document.getElementById(id).style.display='none';
}

function changesupersearch(num){
	var supersearchdiv=$("#supersearch");
	//console.info(supersearchdiv);
//	var navigation=document.getElementById("navigation");
	var navigation=$("#navigation");
	//console.info(navigation);
	if(num==1){
//		alert("ddd");
		//点击展开的事件
		//关闭小框， 显示 大框
		supersearchdiv.show();
		navigation.hide();
	}else{
		//点击缩小的事件
		//关闭大框   显示小框  
		supersearchdiv.hide();
		navigation.show();
	}
}

//高级搜索关闭图片变颜色
function superdivcloseimg2(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose2.png" id="closepng">';
}
function superdivcloseimg(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose.png" id="closepng">';
}

//取消键关闭收藏标签
function closecollectiondiv(id,inputid){
	var cancelbtn2=document.getElementById(id);
	$("#"+inputid).val('');
	if(cancelbtn2){
		if(cancelbtn2.style.display=='block'){
			cancelbtn2.style.display='none';
		}else{
			cancelbtn2.style.display='block';
		}
	}
}

//取消键关闭添加标签(jquery)
/*function closecollectiondiv(id){
	var cancelbtn2=$('.'+id);
	if(cancelbtn2.is(":visible")){
		if(cancelbtn2.is(":visible")){
			cancelbtn2.hide();
			}else{
				cancelbtn2.show();
			}
	}
}*/


//控制收藏标签栏的可见
function addcollectiondiv(id,uid,weiboid){
	var tips2=document.getElementById(id);
	
	$.ajax({
		url: "weibo/collectionDiv",
		cache: false,
		data:{"uid":uid,"wbid":weiboid},
		dataType:"json",
		Type:"GET",
		success: function(data,textStatus){
			if(data.ishave){
				alert("您已收藏该微博.");
				// 消息将显示在顶部中间
				/*$.messager.show({
					title:'收藏提示',
					msg:'您已收藏该微博。',
					showType:'show',
					style:{
						right:'',
						top:document.body.scrollTop+document.documentElement.scrollTop,
						bottom:''
					}
				});
*/
			}else if(tips2){
				if(tips2.style.display=='block'){
					tips2.style.display='none';
				}else{
					tips2.style.display='block';
				}
			}
			
		},
		error:function(){
			
		}
		
	});
	
}

//close图标改变颜色
function collectiondivcloseimg2(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose2.png" id="colle_closepng">';
}
function collectiondivcloseimg(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose.png" id="colle_closepng">';
}
//colse图标关闭div
function changecollectionsearch(id){
	var cancelbtn3=document.getElementById(id);
	if(cancelbtn3){
		if(cancelbtn3.style.display=='block'){
			cancelbtn3.style.display='none';
		}else{
			cancelbtn3.style.display='block';
		}
	}
}

//close图标改变颜色
function transmitdivcloseimg2(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose2.png" id="colle_closepng">';
}
function transmitdivcloseimg(id){
	document.getElementById(id).innerHTML='<img src="front/image/superdivclose.png" id="colle_closepng">';
}
//colse图标关闭div
function changetransmitsearch(id){
	var cancelbtn4=document.getElementById(id);
	if(cancelbtn4){
		if(cancelbtn4.style.display=='block'){
			cancelbtn4.style.display='none';
		}else{
			cancelbtn4.style.display='block';
		}
	}
}

//转发  换权限（公开，朋友圈。。。）
function changewords(){
	document.getElementById("transmit_aa").innerHTML=document.getElementById("choose1").innerHTML;		
}
function changewords1(){
	document.getElementById("transmit_aa").innerHTML=document.getElementById("choose2").innerHTML;	
}

function changewords2(){
	document.getElementById("transmit_aa").innerHTML=document.getElementById("choose3").innerHTML;	
}
function changewords3(){
	document.getElementById("transmit_aa").innerHTML=document.getElementById("choose4").innerHTML;	
}


//转发  选择完权限后隐藏div 
function hidetransmitdiv(id){
	document.getElementById(id).style.display='none';
}
//转发   点击公开出现隐藏的div
function showhidetransmitdiv(id){
	var sbtitle2=document.getElementById(id);
	if(sbtitle2){
		if(sbtitle2.style.display=='block'){
			sbtitle2.style.display='none';
		}else{
			sbtitle2.style.display='block';
		}
	}
}
//控制转发栏的可见
function addtransmitdiv(id){
	var tips2=document.getElementById(id);
	if(tips2){
		if(tips2.style.display=='block'){
			tips2.style.display='none';
		}else{
			tips2.style.display='block';
		}
	}
}
	
	//控制评论标签栏的可见   没有问题了√
	function addcommentdiv(id){
		var tips3=document.getElementById(id);
		
		if(tips3){
			if(tips3.style.display=='block'){
				tips3.style.display='none';
			}else{
				tips3.style.display='block';
			}
		}
	};


/*function addcommentdiv1(id){
	var tips4=document.getElementById(id);
	if(tips4){
		if(tips4.style.display=='block'){
			tips4.style.display='none';
		}else{
			tips4.style.display='block';
		}
	}
}
function addcommentdiv2(id){
	var tips5=document.getElementById(id);
	if(tips5){
		if(tips5.style.display=='block'){
			tips5.style.display='none';
		}else{
			tips5.style.display='block';
		}
	}
}*/

//视频 图片文件的div的可见与隐藏
function showNone(id1,id2){//先隐藏两个元素，然后显示第一个，
	var obj1=$("#"+id1);
	var obj2=$("#"+id2);//传过来的是字符串
	
	if(obj1!=undefined&&obj2!=undefined){
		if(obj2.css("display")=="block"){
			obj2.hide();
		}
		if(obj1.css("display")=="none"){
			obj1.css("display","block");
		}else{
			obj1.css("display","none");
		}
	}
	
	//createInput(id1);
	
}

var countpic = 0;
var countvideo = 0;
/*
* 生成多附件上传框 
*/ 
function createInput(picsdiv){
		countpic++;  
	    var str = '<div name="div">'+  
	    '   '+ '<input type="file" contentEditable="false" id="uploads' + countpic + '' +  
	    '" name="uploads'+ countpic +'" value="" style="width:250px"/><a href="javascript:void(0)" onclick="removeInput(event,'+picsdiv+')" style="font-size:12px;height:25px;line-height:25px;width:25px;margin-left:5px;padding-right:5px;float:right;">删除</a>'+'</div>';  
	    $("#"+picsdiv).append(str);
	    
	    media[countpic] = "uploads"+countpic;
}
/*
* 删除多附件删除框 
*/  
function removeInput(evt, parentId){  
   var el = evt.target == null ? evt.srcElement : evt.target;  
   var div = el.parentNode;  
   //var cont = document.getElementById(parentId);         
   if(parentId.removeChild(div) == null){  
    return false;  
   }  
   return true;  
} 
//表情的div的控制
function showfaceimage(id){
	var tips8=document.getElementById(id);
	if(tips8){
		if(tips8.style.display=='block'){
			tips8.style.display='none';
		}else{
			tips8.style.display='block';
		}
	}
}


//话题的div的控制
function showtopicinput(id){
	var tips9=document.getElementById(id);
	if(tips9){
		if(tips9.style.display=='block'){
			tips9.style.display='none';
		}else{
			tips9.style.display='block';
		}
	}
}
//点击表情以后       
function clickFace(obj){
	$("#face_image").hide();
	//alert($(obj).attr("data"));
	var face=$(obj).attr("data");
	
	var txt=$("#txt");
	txt.val(txt.val()+face);    
}

//点击话题以后   
function clicktopic(obj){
	$("#topic_input").hide();
	//alert($(obj).attr("data"));
	var topic=$(obj).attr("data");
	
	var txt=$("#txt");
	txt.val(txt.val()+topic);    
}



//图片放大镜

