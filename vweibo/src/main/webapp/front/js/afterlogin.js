// JavaScript Document
$(document).ready(function(){  
var range = 50;             //距下边界长度/单位px  
var elemt = 500;           //插入元素高度/单位px  
var maxnum = 50;            //设置加载最多次数  
var num = 1;  
var totalheight = 0; 
for(var i=0;i<4;i++){
	$("#center-part").append('<div id="center-part-content"></div>');  
}  
$(window).scroll(function(){  
	var srollPos = $(window).scrollTop();    //滚动条距顶部距离(页面超出窗口的高度)  
	  
	//console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop());  
	//console.log("页面的文档高度 ："+$(document).height());  
	//console.log('浏览器的高度：'+$(window).height());  
	  
	totalheight = parseFloat($(window).height()) + parseFloat(srollPos);  
	
	if(($(document).height()-range) <= totalheight  && num<=maxnum) { 
		
		$("#center-part").append('<div id="center-part-content"></div>');  
 		num++;  
	}  
});  
});  


$(document).ready(function(){   
var txt=document.getElementById("txt");
var str;

//键盘监听事件
txt.addEventListener("keypress",function(){
	str=txt.value;
	if(str.length>139){
		document.getElementById("s2").innerHTML="已经超出了"+(str.length-139)+"个字";	
	}else{
		document.getElementById("s2").innerHTML="您还可以输入"+(139-str.length)+"个字";	
	}
});

//获得焦点事件
txt.addEventListener("focus",function(){
	str=txt.value;
	if(str.length<=140){
		document.getElementById("s2").innerHTML="您还可以输入"+(140-str.length)+"个字";	
	}else{
		document.getElementById("s2").innerHTML="您还可以输入0个字";	
	}
});
});

//改变颜色 换图片
function changecolor(){
	document.getElementById("nav-icon").innerHTML='<img src="image/navigation-iconin.png"/>';
}
function changecolors(){
	document.getElementById("nav-icon").innerHTML='<img src="image/navigation_icon.png"/>';
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


function changeword(){
	document.getElementById("aa").innerHTML=document.getElementById("choose1").innerHTML;		
}
function changeword1(){
	document.getElementById("aa").innerHTML=document.getElementById("choose2").innerHTML;	
}

function changeword2(){
	document.getElementById("aa").innerHTML=document.getElementById("choose3").innerHTML;	
}
function changeword3(){
	document.getElementById("aa").innerHTML=document.getElementById("choose4").innerHTML;	
}
//换完权限后隐藏div
function hidediv(){
	document.getElementById("choose").style.display='none';
	}


function changecentercolor(id){
	document.getElementById(id).innerHTML='<img src="image/conter-part_wayimg02.png"/>';
}

function changecentercolors(id){
	document.getElementById(id).innerHTML='<img src="image/conter-part_wayimg01.png"/>';
}

function showcenterhidediv(id){
var sbtitle=document.getElementById(id);
//alert(sbtitle.style.display);
if(sbtitle){
   if(sbtitle.style.display=='block'){
   sbtitle.style.display='none';
   }else{
   sbtitle.style.display='block';
   }
}
}

function hidecenterdiv(id){
	document.getElementById(id).style.display='none';
	}
