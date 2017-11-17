<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>『游鱼圈』推广系统管理后台</title>
		<script src="${ctx}/js/jquery-1.10.2.min.js"></script>
		<script src="${ctx}/js/validateForm.js"></script>
		<script src="${ctx}/js/jquery.dialog.js"></script>
		<script src="${ctx}/ueditor/ueditor.config.js"></script>
		<script src="${ctx}/ueditor/ueditor.all.js"></script>
		<script src="${ctx}/js/MD5.js"></script>
		<link rel="stylesheet" href="${ctx}/css/default.css" />
		<link rel="stylesheet" href="${ctx}/css/jquery.dialog.css" />
		<link rel="stylesheet" href="${ctx}/ueditor/themes/default/css/ueditor.css"/>
		<script>
			function gotopage(url, pageno)
			{
				window.location.href = url + '?pageno=' + pageno;
			}
	   </script>
	</head>
	<body>
	   <div class="page">
			<%if(request.getRequestURI().indexOf("/user/login") > -1 || request.getRequestURI().indexOf("/wechatpay/topay") > -1 || request.getRequestURI().indexOf("/wechatpay/payurl") > -1 || request.getRequestURI().indexOf("/wechatpay/notify") > -1 || request.getRequestURI().indexOf("/wechatpay/re_notify") > -1){%>
				<div><sitemesh:body /></div>
			<%}else{%>
			<div class="center">
			    <div class="header" name="headerdivdivdiv" id="headerdivdivdiv"><%@ include file="/WEB-INF/layouts/header.jsp"%></div>
			 	<div class="floatleft menu" id="menudivdiv" name="menudivdiv">
				 	<!-- <iframe id="commoditylist" name="commoditylist" src="/WEB-INF/layouts/menu.jsp" style="width: 100%;height:100%" scrolling="no" frameborder ="0"  >
					</iframe> -->
			     	<%@ include file="/WEB-INF/layouts/menu.jsp"%>
			 	</div>
				<div class="floatleft content" id="contentdivdiv" name="contentdivdiv">
					<sitemesh:body />
				</div>
				<div class="clear"></div>
			</div>
			<div class="footer"><%@ include file="/WEB-INF/layouts/footer.jsp"%></div>
			<%} %>
		</div>
	</body>
	<script type="text/javascript">
	 var contentdivdiv = window.document.getElementById('contentdivdiv');
	 var height=contentdivdiv.offsetHeight;
	 var menudivdiv = document.getElementById('menudivdiv');
	 menudivdiv.style.height = height+ 'px'; //这个就是直接给DIV的高度赋值。
	/* var uaie = navigator.userAgent.toLowerCase().toString(); 
	if(/(msie\s|trident.*rv:)([\w.]+)/.test(uaie))
	{
		var bodywidth=document.body.clientWidth; //BODY对象宽度 
		var bodyheight=document.body.clientHeight;//BODY对象高度 
		var xianwidth=document.documentElement.clientWidth;//可见区域宽度 
		var xianheight=document.documentElement.clientHeight;//可见区域高度 
		alert(bodyheight);
		alert(xianheight); 
	}else{
		
		var bodywidth=document.documentElement.clientWidth; 
		var bodyheight=document.documentElement.clientHeight;
		var divwidth=bodywidth*0.7925;
		var divheight=bodyheight;
		alert(divwidth);
		alert(divheight);
		var div1=document.getElementById("contentdivdiv");
		div1.style.width=divwidth+'px';
		div1.style.height=divheight+'px';
	} */
	</script>
</html>
