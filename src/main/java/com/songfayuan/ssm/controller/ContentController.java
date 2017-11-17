/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.controller
 * 创建时间：2017年6月25日下午5:02:45
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.songfayuan.ssm.entity.Content;
import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.service.ContentService;
import com.songfayuan.ssm.service.UserService;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月25日下午5:02:45
 */
@Controller
@RequestMapping("/content")
public class ContentController {

	Logger logger = LoggerFactory.getLogger(ContentController.class);
	
	@Resource
	private ContentService contentService;
	
	@Resource
	private UserService userService;
	
	/**
	 * 描述：（订单详情）管理员查询订单列表...
	 * @param contentModel
	 * @param pageno
	 * @param pagesize
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月25日下午5:24:47
	 */
	@SystemControllerLog(description="操作：（订单详情）管理员查询订单列表...")
	@RequestMapping(value = "detail_list",method = RequestMethod.GET)
	public String list(Content contentModel,@RequestParam(value = "pageno",defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize",defaultValue = "10") Integer pagesize,Model model){
		PageInfomation<Content> list = this.contentService.getList(contentModel, pageno, pagesize);
		//处理时间格式问题
		for(Integer i =0;i<list.getContent().size();i++){
			Content content = list.getContent().get(i);
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			if(content.getStarttime()!=null){
				String starttime=formatter.format( content.getStarttime());
				content.setStartdate(starttime);
			}
		    if(content.getEndtime()!=null){
		    	String endtime=formatter.format( content.getEndtime());
		    	content.setEnddate(endtime);
			}
		    
		    if(content.getUserid()>0){
		    	User user = this.userService.findById(content.getUserid());  //根据userid查询发布者信息
		    	content.setUsername(user.getUsername());   //发布者username
		    }
		}
		model.addAttribute("list", list);
		logger.info("（订单详情）管理员查询订单列表...");
		return "content/detail_list";
	}
	
	
}
