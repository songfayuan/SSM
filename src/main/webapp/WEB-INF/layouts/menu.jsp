<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%   
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
com.songfayuan.ssm.controller.CheckUserRight checkUserRight = new  com.songfayuan.ssm.controller.CheckUserRight(request);
%>

<%-- <div class="menupanel">
	<div class="menutitle" style="font-size: 30px;"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img">健康自评系统</div>
</div> --%>

<%if(checkUserRight.check(100)){ %>
<div class="menupanel" name="click1" id="click1" onclick="changeColor(this,1)">
	<div class="menutitle" id="menutitle1" onclick="goIndex()"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/icon/shouye.png" class="icon">首页</div>
	<%-- <%if(checkUserRight.check(100001)){ %>
		<div class="menuitem" name="menuitem1" onclick="getColor(1)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq1" href="${ctx}/user/index?flag=sy">首页</a></div>
	<%}%> --%>
</div>
<%} %>

<%if(checkUserRight.check(200)){ %>
<div class="menupanel" name="click2" id="click2" onclick="changeColor(this,2)">
	<div class="menutitle" id="menutitle2"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/icon/kehu.png" class="icon">接单人管理</div>
	<%if(checkUserRight.check(200001)){ %>
		<div class="menuitem" name="menuitem2" onclick="getColor(2)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a  id="abq2" href="${ctx}/user/userlist">接单人列表</a></div>
	<%}%>
<%-- 	<div class="menuitem" name="menuitem2" onclick="getColor(3)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq3" href="${ctx}/investigationreport/healthrecordslist">健康档案</a></div> --%>
</div>
<%} %>

<%if(checkUserRight.check(300)){ %> 
<div class="menupanel" name="click3" id="click3" onclick="changeColor(this,3)">
	<div class="menutitle" id="menutitle3"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/icon/wenjuan.png" class="icon">订单管理</div>
	<%if(checkUserRight.check(300001)){ %>
		<div class="menuitem" name="menuitem3" onclick="getColor(5)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq5" href="${ctx}/content/add">发布订单</a></div>
	<%}%>
	<%if(checkUserRight.check(300002)){ %>
		<div class="menuitem" name="menuitem3" onclick="getColor(4)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq4" href="${ctx}/content/list">订单列表</a></div>
	<%}%>
	<%if(checkUserRight.check(300003)){ %>
		<div class="menuitem" name="menuitem3" onclick="getColor(6)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq6" href="${ctx}/content/admin_list">订单审核</a></div>
	<%}%>
	<%if(checkUserRight.check(300004)){ %>
		<div class="menuitem" name="menuitem3" onclick="getColor(7)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq7" href="${ctx}/content/detail_list">订单详情</a></div>
	<%}%>
</div>
<%} %>

<%if(checkUserRight.check(400)){ %>
<div class="menupanel" name="click4" id="click4" onclick="changeColor(this,4)">
	<div class="menutitle" id="menutitle4"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/chongzhi.png" class="icon">充值管理</div>
	<%if(checkUserRight.check(400001)){ %>
	<div class="menuitem" name="menuitem4" onclick="getColor(8)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq8" href="${ctx}/payrecord/list">充值记录</a></div>
    <%}%>
</div>
<%} %> 

<%if(checkUserRight.check(500)){ %>
<div class="menupanel" name="click5" id="click5" onclick="changeColor(this,5)">
	<div class="menutitle" id="menutitle5"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/baobiao.png" class="icon">财务报表</div>
	<%if(checkUserRight.check(500001)){ %>
	<div class="menuitem" name="menuitem5" onclick="getColor(11)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq11" href="${ctx}/payrecord/financial_statement">报表详情</a></div>
	<%}%>
	<%if(checkUserRight.check(500002)){ %>
	<div class="menuitem" name="menuitem5" onclick="getColor(19)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq19" href="${ctx}/payrecord/personal_financial_statement">个人报表详情</a></div>
	<%}%>
</div>
<%} %> 

<%if(checkUserRight.check(600)){ %>
<div class="menupanel" name="click6" id="click6" onclick="changeColor(this,6)">
	<div class="menutitle" id="menutitle6"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/icon/quanxian.png" class="icon">权限管理</div>
	<%if(checkUserRight.check(600001)){ %>
		<div class="menuitem" name="menuitem6" onclick="getColor(12)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq12" href="${ctx}/resource/rolelist">权限管理</a></div>
	<%}if(checkUserRight.check(600002)){ %>
		<div class="menuitem" name="menuitem6" onclick="getColor(13)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq13" href="${ctx}/user/adminlist">管理员管理</a></div>
	<%}%>
</div>
<%} %>

<%if(checkUserRight.check(700)){ %>
<div class="menupanel" name="click7" id="click7" onclick="changeColor(this,7)">
	<div class="menutitle" id="menutitle7"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/icon/yunxingrizhi.png" class="icon">运行日志</div>
	<%if(checkUserRight.check(700001)){ %>
	<div class="menuitem" name="menuitem7" onclick="getColor(14)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq14" href="${ctx}/log/list">日志列表</a></div>
	<%}%>
</div>
<%} %>

<%if(checkUserRight.check(800)){ %>
<div class="menupanel" name="click8" id="click8" onclick="changeColor(this,8)">
	<div class="menutitle" id="menutitle8"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/kehu.png" class="icon">人群标志管理</div>
	<%if(checkUserRight.check(800001)){ %>
	<div class="menuitem" name="menuitem8" onclick="getColor(15)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq15" href="${ctx}/population/list">人群标志列表</a></div>
	<%}%>
</div>
<%} %>

<%if(checkUserRight.check(900)){ %>
<div class="menupanel" name="click9" id="click9" onclick="changeColor(this,9)">
	<div class="menutitle" id="menutitle9"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/tixian.png" class="icon">提现管理</div>
	<%if(checkUserRight.check(900001)){ %>
	<div class="menuitem" name="menuitem9" onclick="getColor(16)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq16" href="${ctx}/record/apply_list">申请中</a></div>
	<%}%>
	<%if(checkUserRight.check(900002)){ %>
	<div class="menuitem" name="menuitem9" onclick="getColor(17)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq17" href="${ctx}/record/handle_list">处理中</a></div>
	<%}%>
	<%if(checkUserRight.check(900003)){ %>
	<div class="menuitem" name="menuitem9" onclick="getColor(18)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq18" href="${ctx}/record/end_list">已完成</a></div>
	<%}%>
</div>
<%} %>

<%if(checkUserRight.check(1000)){ %>
<div class="menupanel" name="click10" id="click10" onclick="changeColor(this,10)">
	<div class="menutitle" id="menutitle10"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/icon/canshushezhi.png" class="icon">密码更改</div>
	<%if(checkUserRight.check(1000001)){ %>
	<div class="menuitem" name="menuitem10" onclick="getColor(19)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq19" href="${ctx}/user/toeidtadminpw">修改登录密码</a></div>
	<%}%>
</div>
<%} %>

<%-- <%if(checkUserRight.check(208)){ %>
<div class="menupanel" name="click9" id="click9" onclick="changeColor(this,9)">
	<div class="menutitle" id="menutitle9"><img alt="" src="${ctx }/images/icon/fuzhu.png" class="_img"><img src="${ctx }/images/icon/yunxingrizhi.png" class="icon">订单审核</div>
	<%if(checkUserRight.check(208001)){ %>
	<div class="menuitem" name="menuitem9" onclick="getColor(16)"><img alt="" src="${ctx }/images/icon/subimg.png" class="_subimg"><a id="abq16" href="${ctx}/content/admin_list">订单审核</a></div>
	<%}%>
</div>
<%} %> --%>



<script type="text/javascript">

    var UA = navigator.userAgent.toLowerCase().toString(); 
    
    var usertype = ${user.usertype };//用户类型
    
    function goIndex()
    {
    	if(usertype==202){
    		window.location.href="<%=basePath%>user/userindex";
    	}else{
	    	window.location.href="<%=basePath%>user/index?flag=sy";
    	}
    }
    // 兼容IE FF的ByName方法  
    var getElementsByName = function(tag, name){  
    	
        var returns = document.getElementsByName(name);  
        if(returns.length > 0) return returns;  
        returns = new Array();  
        var e = document.getElementsByTagName(tag);  
        for(var i = 0; i < e.length; i++){  
            if(e[i].getAttribute("name") == name){  
                returns[returns.length] = e[i];  
            }  
        }  
        return returns;  
    };
    
	$(document).ready(function(){
		
		var id=window.sessionStorage.getItem("isClick");
		var iscolor=window.sessionStorage.getItem("isColor");
		
	 	$("div.menuitem").each(function(index){
			
			$(this).css("display","none");
		}); 
		
		if(/(msie\s|trident.*rv:)([\w.]+)/.test(UA)){
			
			if(id!=""&&id!=null&&id!='undefined'){	
				
				var objs=getElementsByName("div","menuitem"+id);
				document.getElementById("menutitle"+id).style.backgroundColor="#31a3ff";
				for ( var i = 0; i < objs.length; i++) {
					
					objs[i].style.display="block";  
					document.getElementById("abq"+iscolor).style.color="#31a3ff";
				}
			}
			
		}else{
			
			if(id!=""&&id!=null&&id!='undefined'){	
				
				var objs=document.getElementsByName("menuitem"+id);
				document.getElementById("menutitle"+id).style.backgroundColor="#31a3ff";
				for ( var i = 0; i < objs.length; i++) {
					
					objs[i].style.display="block";  
					document.getElementById("abq"+iscolor).style.color="#31a3ff";
				}
			}
		}
	});
	
	function changeColor(obj,id){
		
	//	alert("changeColor"+id);
		window.sessionStorage.setItem("isClick",id);
	
	} 
	
	function getColor(id){
		
	//	alert("getColor"+id);
		window.sessionStorage.setItem("isColor",id);
	} 
	
	//针对360极速游览器和360安全游览器 
	if(/(msie\s|trident.*rv:)([\w.]+)/.test(UA)){	
		
		var click1=document.getElementById("click1");
		click1.onclick = function(){
			
			window.sessionStorage.setItem("isClick",1);
			if($(this).children('div.menuitem').length > 0 ){
				
				var clickid=window.sessionStorage.getItem("isClick");
				var dis = $(this).children('div.menuitem')[0].style.display;
				if(dis == "" || dis == "block"){
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#34485b";
					$(this).children('div.menuitem').css("display","none");
				}else{
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","block");
				}
				
			}else{
				$(this).css("background-color","#31a3ff");
			}
	    };
	    var click2=document.getElementById("click2");
	    click2.onclick = function(){
			
	    	window.sessionStorage.setItem("isClick",2);
			if($(this).children('div.menuitem').length > 0 ){
				
				var clickid=window.sessionStorage.getItem("isClick");
				var dis = $(this).children('div.menuitem')[0].style.display;
				if(dis == "" || dis == "block"){
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","none");
				}else{
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","block");
				}
				
			}else{
				$(this).css("background-color","#31a3ff");
			}
	    }; 
	    
	    var click3=document.getElementById("click3");
	    click3.onclick = function(){
			
	    	window.sessionStorage.setItem("isClick",3);
			if($(this).children('div.menuitem').length > 0 ){
				
				var clickid=window.sessionStorage.getItem("isClick");
				var dis = $(this).children('div.menuitem')[0].style.display;
				if(dis == "" || dis == "block"){
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","none");
				}else{
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","block");
				}
				
			}else{
				$(this).css("background-color","#31a3ff");
			}
	    }; 
	    
	    var click4=document.getElementById("click4");
	    click4.onclick = function(){
			
	    	window.sessionStorage.setItem("isClick",4);
			if($(this).children('div.menuitem').length > 0 ){
				
				var clickid=window.sessionStorage.getItem("isClick");
				var dis = $(this).children('div.menuitem')[0].style.display;
				if(dis == "" || dis == "block"){
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","none");
				}else{
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","block");
				}
				
			}else{
				$(this).css("background-color","#31a3ff");
			}
	    }; 
	    
	    var click5=document.getElementById("click5");
	    click5.onclick = function(){
			
	    	window.sessionStorage.setItem("isClick",5);
			if($(this).children('div.menuitem').length > 0 ){
				
				var clickid=window.sessionStorage.getItem("isClick");
				var dis = $(this).children('div.menuitem')[0].style.display;
				if(dis == "" || dis == "block"){
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","none");
				}else{
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","block");
				}
				
			}else{
				$(this).css("background-color","#31a3ff");
			}
	    }; 
	    var click6=document.getElementById("click6");
	    click6.onclick = function(){
			
	    	window.sessionStorage.setItem("isClick",6);
			if($(this).children('div.menuitem').length > 0 ){
				
				var clickid=window.sessionStorage.getItem("isClick");
				var dis = $(this).children('div.menuitem')[0].style.display;
				if(dis == "" || dis == "block"){
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","none");
				}else{
					
					document.getElementById("men3title"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","block");
				}
				
			}else{
				$(this).css("background-color","#31a3ff");
			}
	    }; 
	    
	    var click7=document.getElementById("click7");
	    click7.onclick = function(){
			
	    	window.sessionStorage.setItem("isClick",7);
			if($(this).children('div.menuitem').length > 0 ){
				
				var clickid=window.sessionStorage.getItem("isClick");
				var dis = $(this).children('div.menuitem')[0].style.display;
				if(dis == "" || dis == "block"){
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","none");
				}else{
					
					document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
					$(this).children('div.menuitem').css("display","block");
				}
				
			}else{
				
				$(this).css("background-color","#31a3ff");
			}
	    }; 
	}else{
		
		 $('.menupanel').on('click',function(){
				if($(this).children().length > 1 ){
					//$(this).css("background-color","#31a3ff");
					console.log($(this).children('div.menuitem')[0]);
					var clickid=window.sessionStorage.getItem("isClick");
					var dis = $(this).children('div.menuitem')[0].style.display;
					if(dis == "" || dis == "block"){
						
					//	$(this).css("background-color","#34485b");
						document.getElementById("menutitle"+clickid).style.backgroundColor="#34485b";
						$(this).children('div.menuitem').css("display","none");
					}else{
						
						document.getElementById("menutitle"+clickid).style.backgroundColor="#31a3ff";
						$(this).children('div.menuitem').css("display","block");
					}
				}
		}); 
	}
    
    /* $(document).ready(function(){
		
		$("div.menupanel").each(function(index){
			
			$(this).css("background-color","#34485b");
		});
		
		$("div.menuitem").each(function(index){
			$(this).css("display","none");
			console.log($(this)[0].style.display);
		});
		
		$('.menupanel').on('click',function(){
			if($(this).children().length > 1 ){
				$(this).css("background-color","#31a3ff");
				console.log($(this).children('div.menuitem')[0]);
				
				var dis = $(this).children('div.menuitem')[0].style.display;
				if(dis == "" || dis == "block"){
					
					$(this).children('div.menuitem').css("display","none");
					$(this).css("background-color","#34485b");
				}else{
					$(this).children('div.menuitem').css("display","block");
				}
			}
		}); 
		
		$('.menupanel').on('mouseover',function(){
			if($(this).children().length > 1 ){
				
				$(this).css("background-color","#31a3ff");
				$(this).children('div.menuitem').css("display","block");
			}
		});
		
		$('.menupanel').on('mouseout',function(){
			if($(this).children().length > 1 ){
				$(this).css("background-color","#31a3ff");
				$(this).css("background-color","#34485b");
				$(this).children('div.menuitem').css("display","none");
			}
		});
		
		$('.menupanel').on('mouseover',function() {
			if($(this).children().length > 1 ){
	       		 $(this).css("background-color","#31a3ff");
			}
	   });
		
		$('.menupanel').on('mouseout',function() {
			
			if($(this).children().length > 1 ){
			    var dis = $(this).children('div.menuitem')[0].style.display;
			    if(dis == "" || dis == "block"){
					$(this).css("background-color","#31a3ff");
				}else{
				    $(this).css("background-color","#34485b");
				}
			}
	   });
	}) */
</script>