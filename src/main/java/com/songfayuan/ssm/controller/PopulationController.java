/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.controller
 * 创建时间：2017年6月26日上午10:54:55
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.songfayuan.ssm.entity.Population;
import com.songfayuan.ssm.service.PopulationService;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月26日上午10:54:55
 */
@Controller
@RequestMapping("/population")
public class PopulationController extends BaseController {

	@Resource
	private PopulationService populationService;
	
	/**
	 * 描述：查询所有的一级人群标签列表
	 * @param request
	 * @param response
	 * @param popModel
	 * @param pageno
	 * @param pagesize
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月26日上午11:47:52
	 */
	@SystemControllerLog(description = "查询所有的一级人群标签列表")
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public String getList(HttpServletRequest request,HttpServletResponse response,Population popModel,
			@RequestParam(value = "pageno",defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize",defaultValue = "10") Integer pagesize,Model model)
	{
		PageInfomation<Population> populationlist = this.populationService.getList(popModel, pageno, pagesize);  //查询所有的列表
		
		model.addAttribute("list", populationlist);
		return "population/list";
	}
	
	/**
	 * 描述：查询所有的二级人群标签列表
	 * @param request
	 * @param response
	 * @param id
	 * @param pageno
	 * @param pagesize
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月26日上午11:48:12
	 */
	@SystemControllerLog(description = "查询所有的二级人群标签列表")
	@RequestMapping(value = "secondlist",method = RequestMethod.GET)
	public String getSecondList(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("id") Integer id,
			@RequestParam(value = "pageno",defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize",defaultValue = "10") Integer pagesize,Model model)
	{
		PageInfomation<Population> populationlist = this.populationService.getSecondList(id,pageno, pagesize);  
		
		model.addAttribute("list", populationlist);
		model.addAttribute("id", id);
		return "population/secondlist";
	}
	
	/**
	 * 描述：根据id删除二级人群标签数据
	 * @param id
	 * @param pid
	 * @return
	 * @author songfayuan
	 * 2017年6月26日上午11:58:46
	 */
	@SystemControllerLog(description="删除操作：根据id删除二级人群标签数据")
	@RequestMapping(value="/seconddelete",method = RequestMethod.GET)
	public String deleteByPid(@RequestParam("id") Integer id,@RequestParam("pid") Integer pid){
		this.populationService.deleteByPid(id,pid); 
		return "redirect:/population/secondlist?id="+pid;
	}
	
	/**
	 * 描述：根据id删除一级分类
	 * @param id
	 * @return
	 * @author songfayuan
	 * 2017年6月26日下午1:56:45
	 */
	@SystemControllerLog(description="删除操作：根据id删除二级人群标签数据")
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	public String delete(@RequestParam("id") Integer id){
		this.populationService.delete(id); 
		return "redirect:/population/list";
	}
	
	/**
	 * 描述：跳转到二级人群标签编辑页面
	 * @param id
	 * @param pid
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月26日下午1:59:39
	 */
	@SystemControllerLog(description="跳转操作：跳转到二级人群标签编辑页面")
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String gotoEditForm(@RequestParam("id") Integer id,@RequestParam("pid") Integer pid,Model model)
	{
		Population population = this.populationService.selectByPid(id,pid); //根据id和pid查询一条数据
		model.addAttribute("population", population);
		model.addAttribute("id", id);
		return "population/edit";
	}
	
	/**
	 * 描述：异步编辑二级人群标签
	 * @param id
	 * @param pid
	 * @param name
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @author songfayuan
	 * 2017年6月26日下午2:04:12
	 */
	@ResponseBody
	@RequestMapping(value = "editlabel", method = RequestMethod.POST)
	@SystemControllerLog(description="编辑操作：异步编辑二级人群标签")
	public String editLabel(@RequestParam("id") Integer id,@RequestParam("pid") Integer pid, @RequestParam("name") String name, Model model, HttpServletRequest request, HttpServletResponse response ){
		String returnMessage = "none";
		Population population = this.populationService.selectByPid(id,pid);
		population.setLabel(name);
		this.populationService.update(population);
		returnMessage="OK";
		return returnMessage;
	}
	
	/**
	 * 描述：保存添加的二级类别
	 * @param id
	 * @param label
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月26日下午2:43:12
	 */
	@SystemControllerLog(description="保存操作：保存添加的二级类别")
	@RequestMapping(value = "addsecond", method = RequestMethod.GET)
	public String addSecondTitle(@RequestParam("id") Integer id,@RequestParam("label") String label,Model model)
	{
		Population population = new Population();
		population.setPid(id);
		population.setLabel(label);
		this.populationService.saveSecondType(population);
		return "redirect:/population/secondlist?id="+id;
	}
	
	/**
	 * 描述：保存添加的一级类别
	 * @param id
	 * @param label
	 * @param model
	 * @return
	 * @author songfayuan
	 * 2017年6月26日下午3:06:24
	 */
	@SystemControllerLog(description="保存操作：保存添加的一级类别")
	@RequestMapping(value = "addfirst", method = RequestMethod.GET)
	public String addOneTitle(@RequestParam("id") Integer id,@RequestParam("label") String label,Model model)
	{
		Population population = new Population();
		population.setPid(id);
		population.setLabel(label);
		this.populationService.saveSecondType(population);
		return "redirect:/population/list";
	}
	
	/**
	 * 描述：异步查询一级分类下的二级分类
	 * @param id
	 * @param pageno
	 * @param pagesize
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @author songfayuan
	 * 2017年6月26日下午3:25:36
	 */
	@ResponseBody
	@RequestMapping( value = "selectlist" , method = RequestMethod.GET)
	public String selectlist(@RequestParam("id") Integer id,@RequestParam(value = "pageno", defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize", defaultValue = "15") Integer pagesize,Model model,HttpServletRequest request,HttpServletResponse response){
		PageInfomation<Population> list=this.populationService.getSecondList(id,pageno, pagesize);
		return setSuccessMessage(response,list.getContent());
		
	}
	
}
