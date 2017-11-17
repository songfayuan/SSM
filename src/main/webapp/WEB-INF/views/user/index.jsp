<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	com.songfayuan.ssm.controller.CheckUserRight checkUserRight = new  com.songfayuan.ssm.controller.CheckUserRight(request);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function editInfo(){
	$("#editinfo").hide();
	$("#saveeditinfo").show();
	$("#probability").removeAttr("disabled");
	$("#probability").css("background-color","rgb(255, 255, 255)");
	$("#probability").focus();
}
function saveInfo(){
	$("#editinfo").show();
	$("#saveeditinfo").hide();
	$("#probability").attr("disabled","disabled");
	$("#probability").css("background-color","#ff6600");
	var probability = $("#probability").val();
	$.ajax(
			{
				url:'<%=basePath%>user/editinfo',
				type:'GET',
				data:'probability='+probability,
				success:function(data)
	            {
					if(data=="yes"){
						alert("平台收益率修改成功！");
					}
					if(data=="no"){
					}
	            }
	        });
}
</script>

<div class="index_main" style="width: 100%; height: 100%;">

<table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
	<tr>
		<td style="text-align: left;">当前系统参数：</td>
		<td style="text-align: left;">【游鱼圈】运营播报：</td>
	</tr>
	<tr>
		<td style="text-align: left;">
			<div style="float: left;"><img src="../images/computer.jpg" style="width: 339px;"/></div>
			<div style="float: left;">
				<div class="index_line">本机IP：${computer_id }</div>
				<div class="index_line">本机名称:${computer_hostName }</div>
				<div class="index_line">操作系统的名称：${computer_os_Name }</div>
				<div class="index_line">操作系统的版本：${computer_os_version }</div>
				<div class="index_line">系统物理内存总计：${totalphysicalmemorysize }</div>
				<div class="index_line">系统物理可用内存总计：${freephysicalmemorysize }</div>
				<div class="index_line">当前平台收益率：<input type="text" id="probability" name="probability" value="${incomedata.probability }" disabled="disabled" style="width: 80px; text-align: center; background-color: #ff6600; border-radius: 22px;"/>
					<%if(checkUserRight.check(100002)){ %>
						<span id="editinfo" style="font-size: 15px; margin-left: 10px; color: #ff6600;cursor: pointer;" onclick="editInfo();">修改</span>
						<span id="saveeditinfo" style="font-size: 15px; margin-left: 10px; color: #ff6600;cursor: pointer;display:none;" onclick="saveInfo();"">保存</span>
					<%}%>
				</div>
			</div>
			<div class="clear"></div>
		</td>
		<td style="text-align: left;">
			<div style="float: left;margin-top: 90px;"><img src="../images/ditu.png" style="width: 339px;padding-right: 8px;"/></div>
			<div style="float: left;">
				<div class="index_line"></div>
				<div class="index_line">截止到昨天23:59：</div>
				<div class="index_line"><span style="color: #ff6600; font-size: 30px;">平台收益：${incomedata.money }元</span></div>
				<div class="index_line">1、注册用户达<span style="color: #ff6600; font-size: 30px;">${fn:length(registuserlist)}</span>人，本月新增用户<span style="color: #ff6600; font-size: 30px;">${fn:length(monthAddList)}</span>人；</div>
				<div class="index_line">2、广告查看数量达<span style="color: #ff6600; font-size: 30px;">${totalcpm}</span>次；</div>
				<div class="index_line">3、广告点击数量达<span style="color: #ff6600; font-size: 30px;">${totalcpc}</span>次；</div>
				<div class="index_line">4、您当前【进行中】订单数为：<span style="color: #ff6600; font-size: 30px;">${ordernum }</span>；</div>
				<div class="index_line">5、您当前【已结束】订单数为：<span style="color: #ff6600; font-size: 30px;">${over_ordernum }</span>；</div>
				<div class="index_line">6、本日消费金额为：<span style="color: #ff6600; font-size: 30px;">${todaymoney }</span>元；</div>
				<div class="index_line">7、本周消费金额为：<span style="color: #ff6600; font-size: 30px;">${weekmoney }</span>元；</div>
				<div class="index_line">8、本月消费金额为：<span style="color: #ff6600; font-size: 30px;">${monthmoney }</span>元；</div>
				<div class="index_line">9、本年度消费金额为：<span style="color: #ff6600; font-size: 30px;">${yearmoney }</span>元；</div>
				<div class="index_line">我们共同的未来，源自你我的一份努力！</div>
			</div>
			<div class="clear"></div>
		</td>
	</tr>
</table>	


<!-- <table class="list" border="1" bordercolor="#ccc" cellspacing="10" cellpadding="10">
	<tr>
		<td>
			<div>©杭州数娱信息科技有限公司版权所有</div>
		</td>
	</tr>
</table> -->

</div>

