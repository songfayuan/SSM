/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.controller
 * 创建时间：2017年6月20日下午9:51:45
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

import com.songfayuan.ssm.entity.Log;
import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.service.LogService;
import com.songfayuan.ssm.service.UserService;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月20日下午9:51:45
 */
@Controller
@RequestMapping("/log")
public class LogController {
	
	Logger logger = LoggerFactory.getLogger(LogController.class);
	
	@Resource
	private LogService logService;
	
	@Resource
	private UserService userService;
	
	/**
	 * 描述：首页-运行日志-查看日志列表...
	 * @param logModel
	 * @param pageno
	 * @param pagesize
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月20日下午10:47:38
	 */
	@SystemControllerLog(description="日志列表查看操作：首页-运行日志-查看日志列表...")
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public String list(Log logModel,
			@RequestParam(value = "pageno",defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize",defaultValue = "10") Integer pagesize,Model model){
		PageInfomation<Log> list = this.logService.getList(logModel, pageno, pagesize);
		//处理时间格式问题
		for(Integer i =0;i<list.getContent().size();i++){
			Log log = list.getContent().get(i);
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String createtime=formatter.format( log.getTime() );
		    if(log.getUserid()!=null){
		    	User user = this.userService.findUserNameByUserId(log.getUserid());   //查询操作人名称
		    	log.setUsername(user.getUsername());
		    }
		    log.setTimedate(createtime);
		}
		model.addAttribute("list", list);
		logger.info("首页-运行日志-查看日志列表...");
		return "log/list";
	}
	
	/**
	 * 描述：查看详情
	 * @param id
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月20日下午10:48:03
	 */
	@SystemControllerLog(description="日志详情查看操作：根据日志id进行日志具体详情查看...")
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String update(@RequestParam("id") Integer id,Model model) {
		Log log = this.logService.getOne(id);   //根据ID查询一条数据
		model.addAttribute("log", log);
		model.addAttribute("id", id);
		return "log/edit";
	}
	
}
