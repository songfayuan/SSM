/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service.impl
 * 创建时间：2017年6月17日上午11:22:46
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.songfayuan.ssm.dao.LogDao;
import com.songfayuan.ssm.entity.Log;
import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.service.LogService;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月17日上午11:22:46
 */
@Service
public class LogServiceImpl implements LogService{

	Logger logger = LoggerFactory.getLogger(LogServiceImpl.class);
	
	@Resource
	private LogDao logDao;

	//保存日志记录
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void save(Log log) {
		this.logDao.save(log);
	}

	public PageInfomation<Log> getList(Log logModel, Integer pageno, Integer pagesize) {
		Integer offset = (pageno-1) * pagesize;
		List<Log> list = this.logDao.getList(logModel, offset,pagesize);  //查询从offset+1开始，取pagesize条数据
		Integer rows = this.logDao.findRows(logModel); //查询数据有多少条
		PageInfomation<Log> result = new PageInfomation<Log>();
		result.setContent(list);
		result.setPageno(pageno);
		result.setPagesize(pagesize);
		result.setTotalpages(rows / pagesize + (rows % pagesize > 0 ? 1 : 0));
		logger.info("共{}页，每页{}条，当前是第{}页",rows / pagesize + (rows % pagesize > 0 ? 1 : 0),pagesize,pageno);
		return result;
	}

	//根据ID查询一条数据
	public Log getOne(Integer id) {
		return this.logDao.getOne(id);
	}
	
}
