<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
com.youyu.admin.web.CheckUserRight checkUserRight = new  com.youyu.admin.web.CheckUserRight(request);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>

<style>
<!--
table {
	width: 100%;
	text-align: left;
	border-collapse: collapse;
	border-spacing: 1;
	border-spacing: 0;
}

table td {
	word-break: break-all;
	word-wrap: break-word;
	border-right: 1px solid #E7E5E5;
	border-bottom: 1px solid #E7E5E5;
/* 	font: 500 14px Arial; */
	color: #666666;
	font-size: 16px;
  /*   font-family: 微软雅黑; */
}
-->
</style>
<div class="navigation">当前位置：接单人管理&nbsp;>&nbsp;接单人列表</div>
<form name="findForm" id="findForm" action="<%=basePath %>user/searchuserlist" method="get" style="margin-top: 20px; margin-left: 29px; color: #666666;">
			用 户 名:<input id="username" type="text" name="username" style="width: 180px;" value="${username}" placeholder="请输入用户名">
<!-- 		<tr> -->
			<!-- <td class="td_2" colspan="2" style="padding: 2px 2px 2px 12px;">
				注册时间:
				<input type="text" id="starttime" name="starttime" maxlength="20" style="width: 180px;" onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"   placeholder="请点击选择时间"/>
				至
				<input type="text" id="endtime" name="endtime" maxlength="20" style="width: 180px;" onFocus="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"    placeholder="请点击选择时间"/>
				
			</td> -->
<!-- 		</tr> -->
		<input type="button" class="greenbutton" onclick="javasrcipt:submitForm()" value="搜&nbsp;&nbsp;&nbsp;索" style="margin-left: 80px;width: 85px; height: 36px;">
<%-- 		<input type="hidden" id="pageno" name="pageno" value="${pageno}"/> --%>
<%-- 		<input type="hidden" id="pagesize" name="pagesize" value="${pagesize}"/> --%>
</form><br/>
<form id="infoForm" name="inputForm" action="" method="post" class="form-horizontal" >
<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
	<tr>
		<th><input type='checkbox' name="" id="controlAll"  onclick='if(this.checked==true) { selectAll(); } else { selectAll(); }' >全选</th>
		<th>用户名</th>
		<th>手机号</th>
		<th>注册时间</th>
		<th>操作</th>
	</tr>
	
	<c:forEach items="${userList.content}" var="list" varStatus="status">
		<tr> 
			<td><input type='checkbox' name='selected' value="${list.id}" onclick="choose()">${(userList.pageno-1)*10+status.index+1}</td>
			<td>${list.username}</td>
			<td>${list.phone}</td>
			<td>${list.createDate}</td>
			<td>
				<a style="color:#54bc2d;" href="<%=basePath%>user/userdetail?id=${list.id}">查看</a>
			</td>
		</tr>	
		</c:forEach>
</table>
</form>

<br/>
<div style="margin-left: 29px;">
	<input type="hidden" name="idlist" id="idlist"/>
	<input id="daochu" style="width: 80px;" class="greenbutton" type="button" value="导出" onclick="goToUrl()"/>
	<input id="shanchu" style="width: 80px;" class="greenbutton" type="button" value="删除" onclick="goToUrl2()"/>
</div>

<div class="pagestart">
	<div class="pagebar" style="margin-right: 10px; height: 20px; line-height: 20px;">
		共<span>${userList.totalpages}</span>页，每页<span>${userList.pagesize}</span>条，当前是第<span>${userList.pageno}</span>页
	</div>
	<div class="pageinfo">
		<button
			onclick="gotopage('<%=basePath%>user/adminlist', '1')"
			<c:if test="${userList.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${userList.pageno > 1}"> class="button2"</c:if>>首页</button>
		<button
			onclick="gotopage('<%=basePath%>user/adminlist', '${userList.pageno-1 }')"
			<c:if test="${userList.pageno == 1}"> class="button3"  disabled</c:if>
			<c:if test="${userList.pageno > 1}"> class="button2"</c:if>>上页</button>
		<button
			onclick="gotopage('<%=basePath%>user/adminlist', '${userList.pageno+1 }')"
			<c:if test="${userList.pageno == userList.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${userList.pageno < userList.totalpages}"> class="button2"</c:if>>下页</button>
		<button
			onclick="gotopage('<%=basePath%>user/adminlist', '${userList.totalpages }')"
			<c:if test="${userList.pageno == userList.totalpages}"> class="button3"  disabled</c:if>
			<c:if test="${userList.pageno < userList.totalpages}"> class="button2"</c:if>>末页</button>
	</div>
	<div class="clear"></div>
</div>
<script>

// alert('${user.id}');
addOption();

var biaozhi = '${biaozhi}';

if(biaozhi==2){
	getValue();
}

function addOption(){
	var yuserLists = '${yuserLists}';
	var yuserList=eval('(' + yuserLists + ')');
	if('${user.usertype}'==203){
		var htm = '<option value="0">全部</option>';
	}
	if(yuserList != null){
		 for(var i=0;i<yuserList.data.length;i++){
			 if(yuserList.data[i].id=='${user.id}'){
				 htm +='<option selected value="'+yuserList.data[i].id+'">'+yuserList.data[i].username+'</option>';
			 }else{
				 htm +='<option value="'+yuserList.data[i].id+'">'+yuserList.data[i].username+'</option>';
			 }
		 }
	}
	$("#dietitianid").html(htm);
}

//提交查询表单
function submitForm(){
	
/* 	if($("#startage").val()==0){
		$("#startage").val("");
	}
	if($("#endage").val()==0){
		$("#endage").val("");
	}
	
	var startdate=0;
	var enddate=0;
	if($("#starttime").val()!=null&&$("#starttime").val()!=""&&$("#starttime").val()!=undefined){
		startdate = new Date($("#starttime").val());
		$("#starttime1").val(startdate.getTime());
	}else{
		$("#starttime1").val(0);
	}
	if($("#endtime").val()!=null&&$("#endtime").val()!=""&&$("#endtime").val()!=undefined){
		enddate = new Date($("#endtime").val());
		$("#endtime1").val(enddate.getTime());
	}else{
		$("#endtime1").val(0);
	}
	
	if($("#startage").val() == null || $("#startage").val() == "" || $("#startage").val() == undefined){
		$("#startage").val(0);
	}
	if($("#endage").val() == null || $("#endage").val() == "" || $("#endage").val() == undefined){
		$("#endage").val(0);
	}
	
	document.getElementById("pageno").value=1; */
	
	/* var username = $("#username").val();//用户名
	var sex = $("#sex").val();//性别
	var medicalhistory = $("#medicalhistory").val();//慢病
	var population = $("#population").val();//群体
	var dietitianid = $("#dietitianid").val();//营养师id
	var startage = $("#startage").val();//开始年龄
	var endage = $("#endage").val();//结束年龄
	var starttime1 = $("#starttime1").val();//开始时间
	var endtime1 = $("#endtime1").val();//结束时间 */
	
	/* alert("用户名="+username+"--性别="+sex+"--慢病="+medicalhistory+"--群体="+population+"--营养师id="+dietitianid+"--开始年龄="+startage
			+"--结束年龄="+endage+"--开始时间="+starttime1+"--结束时间="+endtime1); */
	
	$('#findForm').submit();
}

function getValue(){
	var sexvalue = '${sex}';
	$("#sex").val(sexvalue);
	var medicalhistoryvalue = '${medicalhistory}';
	$("#medicalhistory").val(medicalhistoryvalue);
	var dietitianidvalue = '${dietitianid}';
	$("#dietitianid").val(dietitianidvalue);
	var populationvalue = '${population}';
	$("#population").val(populationvalue);
	var startagevalue = '${startage}';
	$("#startage").val(startagevalue);
	var endagevalue = '${endage}';
	$("#endage").val(endagevalue);
	//alert(startagevalue+"---"+endagevalue);
	var starttimevalue = '${starttime}';
	$("#starttime").val(starttimevalue);
	var endtimevalue = '${endtime}';
	$("#endtime").val(endtimevalue);
	//alert(starttimevalue+"---"+endtimevalue);
}

//分页
function gotopage1(basepath,pageno)
{
	var startdate=0;
	var enddate=0;
	if($("#starttime").val()!=null&&$("#starttime").val()!=""&&$("#starttime").val()!=undefined){
		startdate = new Date($("#starttime").val());
		$("#starttime1").val(startdate.getTime());
	}else{
		$("#starttime1").val(0);
	}
	if($("#endtime").val()!=null&&$("#endtime").val()!=""&&$("#endtime").val()!=undefined){
		enddate = new Date($("#endtime").val());
		$("#endtime1").val(enddate.getTime());
	}else{
		$("#endtime1").val(0);
	}
	
	var startage =  $("#startage").val();
	if(startage == null || startage == "" || startage == undefined){
		$("#startage").val(0);
	}
	var endage =  $("#endage").val();
	if(endage == null || endage == "" || endage == undefined){
		$("#endage").val(0);
	}
	
	document.getElementById("pageno").value=pageno;
	$('#findForm').submit();
	/* window.location.href=basepath+"?pageno="+pageno; */
}

//=====================全选/反选操作=======================
function selectAll(){
	 var checklist = document.getElementsByName ("selected");
	 if(document.getElementById("controlAll").checked)
	 {
	    for(var i=0;i<checklist.length;i++)
	 	{
	      checklist[i].checked = 1;
	 	} 
	 }else
	 {
	     for(var j=0;j<checklist.length;j++)
		 {
		     checklist[j].checked = 0;
		 }
	 }
}

function choose(){
	var selectType = $("input[name=selected]");
	var selectTypeC = $("input[name='selected']:checked");
	if(selectType.length==selectTypeC.length){
		document.getElementById("controlAll").checked=true;
	}else{
		document.getElementById("controlAll").checked=false;
	}
}

//==================获取选中的值==================
function getInfo(){
	document.getElementById("idlist").value="";
	var selectType = $("input[name=selected]");
// 	alert(selectType.length);
	for(var j=0;j<selectType.length;j++){
		if( selectType[j].checked==true ){
			var chk_value = [];
			//js获取复选框值    
			var obj = document.getElementsByName("selected");//选择所有name="selected"的对象，返回数组    
			var s='';//如果这样定义var s;变量s中会默认被赋个null值
			for(var i=0;i<obj.length;i++){
				 if(obj[i].checked) //取到对象数组后，我们来循环检测它是不是被选中
				 s+=obj[i].value+',';   //如果选中，将value添加到变量s中    
			}
			//jquery获取复选框值    
			$('input[name="selected"]:checked').each(function(){//遍历每一个名字为selected的复选框，其中选中的执行函数    
				chk_value.push($(this).val());//将选中的值添加到数组chk_value中    
			});    
			idlist = chk_value.toString();
// 	 		alert(idlist);
	 		if(idlist != null && idlist != "" && idlist != undefined){
				document.getElementById("idlist").value=idlist;
	 		}else{
	 			document.getElementById("idlist").value="";
	 		}
		}
	}
}

//==================判断是否做了选择==================
function checkForm(){
	var idlist=document.getElementById("idlist").value;
	if(idlist==''||idlist==null||idlist==undefined){
		alert("你还没有选择，请选择后再操作！");
		return false;
	}
	return true;
}

//======================删除数据===========================
function goToUrl2() {
	getInfo();
	if (!checkForm()) {
		return;
	}
	var result=checkForm(infoForm);
    if(result==false){
    	return;
    }else{
    	var panduan=confirm("确认删除吗?");
    	if (panduan==true){
// 	    	alert('请求成功！');
	    	var idlist=document.getElementById("idlist").value;
    		infoForm.action='<%=basePath%>user/deleteUserById?idlist='+idlist;
	    	infoForm.submit();
    	}else{
    		//alert('请求失败！');
    		var obj = document.getElementsByName("selected");
			for(var i=0;i<obj.length;i++){
				obj[i].checked=false;
			}
    	}
    }
}

//=====================导出数据======================
function goToUrl() {
	getInfo();
	var idlist=document.getElementById("idlist").value;
	//alert(idlist);
   	var panduan=confirm("确认导出数据?");
   	if (panduan==true){
//     	alert('请求成功！');
   		infoForm.action='<%=basePath%>user/exuserlist';
    	infoForm.submit();
   	}
}

</script>
