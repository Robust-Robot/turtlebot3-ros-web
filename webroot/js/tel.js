
/************************************************************************/

/** 首页加载 *************************************************************/

$(document).ready(function(){
	checkLogin();
});







/** span 链接加载 *************************************************************/
/*
var newPage = "";
var oldPage = "";

$("span").live("click",function(event){
	
	checkLogin();
	
	newPage = $(this).attr("data-pageNew");
	oldPage = $(this).attr("data-pageOld");
	var action = $(this).attr("data-act");
	if(action=="new"){
		var pageBody = "";
		$.ajax({
			type: "GET",
			dataType: "html",
			url: $(this).attr("data-url"),
			beforeSend: function(){showLoader();},
			success : function(data){
				pageBody = data;
				pageBody = pageBody.replace("{PageNew}",newPage);
				pageBody = pageBody.replace("{PageOld}",oldPage);
				//alert(pageBody);
				$("body").append(pageBody);
				//$(document.getElementById(outPage)).addClass("out");
				$(document.getElementById(oldPage)).css("z-index","-10");
				hideLoader();
			}
		});
	}else if(action=="close"){
		//$("#content").html("inPage="+inPage+"/outPage="+outPage+"/fromPage="+fromPage);
		//$(document.getElementById(outPage)).addClass("out");
		//$(document.getElementById(fromPage)).removeClass("out");
		
		$(document.getElementById(newPage)).css("z-index","-10");
		$(document.getElementById(oldPage)).css("z-index","10");
		//hideLoader();
	}else if(action=="out"){
		$.ajax({
		  	   type: "POST",
		  	   dataType: "text",
		  	   url: "netHandle.php?doFor=logoutUser",
		  	   success : function(data){
		  		  window.location.reload();
		  	   }
		 });
	}
});
*/
/************************************************************************/

/*显示加载效果*/
function showLoader(){
	$.mobile.loading('show', {
        text: '加载中...', //加载器中显示的文字  
        textVisible: true, //是否显示文字  
        theme: 'e',        //加载器主题样式a-e  
        textonly: false,   //是否只显示文字  
        html: ""           //要显示的html内容，如图片等  
    });
}

/*隐藏加载效果*/
function hideLoader(){
    $.mobile.loading('hide');
}


/************************************************************************/
/* 登录验证 */
function checkLogin(){
	$.ajax({
	  	   type: "POST",
	  	   dataType: "json",
	  	   url: "/netHandle.php?doFor=checkUser",
	  	   beforeSend: function(){},
	  	   success : function(data){
	  		   if(data.login != "Y"){
	  			 if(location.href.indexOf("user.php")<1)
	  				 location.href = "/user.php";
	  		   }else{
	  			   $("#showUser").html("<a href='/password.php'>"+data.uname+"</a>【"+data.uDept+"】"+data.uRname);
	  		   }
	  	   }
	});
	
}

$("#loginForm").live("submit", function(){
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "/netHandle.php?doFor=loginUser",
		data: {loginUser:$("#loginUser").val(),loginPwd:$("#loginPwd").val()},
		success : function(data){
			$("#loginUser").val("");
			$("#loginPwd").val("");
			if(data.login == "Y"){
				location.href = "/";
			}else{
				$("#msgForm").html("登录失败，请确认账号密码是否匹配！");
			}
		}
	});
	return false;
});


$("#pwdForm").live("submit", function(){

	if($("#telUser").val()=="" || $("#newPwd").val()=="" || $("#newPwd").val()!=$("#rePwd").val()){
	    $("#msgForm").html("修改密码信息填写不完整！");
		return false;
	}
	
	$.ajax({
		type: "POST",
		dataType: "text",
		url: "/netHandle.php?doFor=editpwd",
		data: {telUser:$("#telUser").val(),newPwd:$("#newPwd").val()},
		success : function(data){
			$("#telUser").val("");
			$("#newPwd").val("");
			$("#rePwd").val("");
			if(data > 0){
				$("#msgForm").html("密码修改成功，3秒后重新登录！");
				setTimeout(function(){location.href = "/user.php";}, 3000);
			}else{
				$("#msgForm").html("修改失败，请重改密码！");
			}
		}
	});
	
	return false;
});



/************************************************************************/
/*
 * 工序状态过程:回退等
 */
function o_gongxu(id,dfor,dforMsg){
	var c = confirm(id+"：确定要"+dforMsg+"吗？");
	if(c){
		$.ajax({
		  	   type: "POST",
		  	   async:false,
		  	   dataType: "text",
		  	   url: "/netHandle.php?doFor=GongxuOper&op="+dfor+"&id="+id,
		  	   beforeSend: function(){},
		  	   success : function(data){
		  		   if(data > 0){
					 $("#msgForm").html(dforMsg+"成功，请点击该工单名称刷新工序列表！");
		  		   }else{
		  			 $("#msgForm").html(dforMsg+"失败");
		  		   }
		  	   }
		});
	}
	
}


/************************************************************************/

	/*
	

$(function(){
	$.ajax({
			type: "POST",async:true,cache: false,dataType: "html",
			url: "find.html",
			success : function(data){
				alert(data.responseText)
				//content.innerHTML = data;
				$(".content").empty();
				$(".content").append(data);
			}
	});

	document.addEventListener('touchstart',touch, false);
	document.addEventListener('touchmove',touch, false);
	document.addEventListener('touchend',touch, false);
	
	function touch (event){
		var event = event || window.event;
		var oPage = document.getElementById("xxx");
		switch(event.type){
            case "touchstart":
                oPage.innerHTML = "Touch started (" + event.touches[0].clientX + "," + event.touches[0].clientY + ")";
                break;
            case "touchend":
                oPage.innerHTML = "<br>Touch end (" + event.changedTouches[0].clientX + "," + event.changedTouches[0].clientY + ")";
                break;
            case "touchmove":
                event.preventDefault();
                oPage.innerHTML = "<br>Touch moved (" + event.touches[0].clientX + "," + event.touches[0].clientY + ")";
                break;
        }
	}
	
	//绑定touchstart
	$("#mban").bind('touchstart', function(event){//点击蒙版时，下拉菜单与蒙版消失，分别移除样式并隐藏菜单
        $("#mban").removeClass("mban");
        $("#show").removeClass("show");
        $("#show").css("display","none");
    });
	
	*/
	
	/*
	 AJAX在手机中不能正常应用的一种解决方法
	 http://lidaqin750201.blog.163.com/blog/static/62081058200931494730282/
	 * */
	
	//loadPage(".content","POST", "find.html", "text", true);
	
	/*
	var xxx = document.querySelector(".content");
	xxx.addEventListener("touchstart", function(e){
       xxx.style.background = "#0F0";
       xxx.innerHTML = loadPage(".content","POST", "findx.html", "text/html", true);
	})
	
	xxx.addEventListener("touchend", function(e){
		xxx.style.background = "#FFF";
	});
	*/
	
	
	
	
/************************************************************************/
/*
<a href='javascrip:void()'> 颜色设置
A:link { color: #0000ff;}
A:active { COLOR: #ff7f24; }
A:visited { COLOR: #ff7f24;}
A:hover { COLOR: #ff7f24;}

$(".voidHref").live("mouseover",function(){
	 $(this).css('color','#0000ff');
});

$(".voidHref").live("mouseout",function(){
	 $(this).css('color','#ff7f24');
});

$(".voidHref").live("click",function(){
	 $(this).css('color','#ff7f24');
});

*/