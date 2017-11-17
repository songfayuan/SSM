/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service.impl
 * 创建时间：2017年6月26日上午10:56:49
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.songfayuan.ssm.dao.PopulationDao;
import com.songfayuan.ssm.entity.Population;
import com.songfayuan.ssm.service.PopulationService;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月26日上午10:56:49
 */
@Service
public class PopulationServiceImpl implements PopulationService {

	Logger logger = LoggerFactory.getLogger(PopulationServiceImpl.class);
	
	@Resource
	private PopulationDao populationDao;

	//查询所有的一级人群标签列表
	public PageInfomation<Population> getList(Population popModel, Integer pageno, Integer pagesize) {
		Integer offset = (pageno-1) * pagesize;
		List<Population> list = this.populationDao.getList(popModel,offset,pagesize);  //查询从offset+1开始，取pagesize条数据
		Integer rows = this.populationDao.findRows(popModel); //查询数据有多少条
		PageInfomation<Population> result = new PageInfomation<Population>();
		result.setContent(list);
		result.setPageno(pageno);
		result.setPagesize(pagesize);
		result.setTotalpages(rows / pagesize + (rows % pagesize > 0 ? 1 : 0));
		logger.info("共{}页，每页{}条，当前是第{}页",rows / pagesize + (rows % pagesize > 0 ? 1 : 0),pagesize,pageno);
		return result;
	}

	//查询所有的二级人群标签列表
	public PageInfomation<Population> getSecondList(Integer id, Integer pageno, Integer pagesize) {
		Integer offset = (pageno-1) * pagesize;
		List<Population> list = this.populationDao.getSecondList(id, offset, pagesize);
		Integer rows = this.populationDao.findSecondRows(id);
		PageInfomation<Population> result = new PageInfomation<Population>();
		result.setContent(list);
		result.setPageno(pageno);
		result.setPagesize(pagesize);
		result.setTotalpages(rows / pagesize + (rows % pagesize > 0 ? 1 : 0));
		logger.info("共{}页，每页{}条，当前是第{}页",rows / pagesize + (rows % pagesize > 0 ? 1 : 0),pagesize,pageno);
		return result;
	}

	//根据id删除二级人群标签数据
	public void deleteByPid(Integer id, Integer pid) {
		this.populationDao.deleteByPid(id, pid);
	}

	//根据id删除一级分类
	public void delete(Integer id) {
		this.populationDao.delete(id);
	}

	//根据id和pid查询一条数据
	public Population selectByPid(Integer id, Integer pid) {
		return this.populationDao.selectByPid(id, pid);
	}

	//保存更新
	public void update(Population population) {
		this.populationDao.update(population);
	}

	//保存添加的二级类别
	public void saveSecondType(Population population) {
		this.populationDao.saveSecondType(population);
	}	
	
}
