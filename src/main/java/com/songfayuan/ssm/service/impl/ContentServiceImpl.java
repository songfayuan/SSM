/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service.impl
 * 创建时间：2017年6月25日下午5:04:13
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.songfayuan.ssm.controller.ContentController;
import com.songfayuan.ssm.dao.ContentDao;
import com.songfayuan.ssm.entity.Content;
import com.songfayuan.ssm.service.ContentService;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月25日下午5:04:13
 */
@Service
public class ContentServiceImpl implements ContentService {
	
	Logger logger = LoggerFactory.getLogger(ContentServiceImpl.class);
	
	@Resource
	private ContentDao contentDao;

	//分页查询content list
	public PageInfomation<Content> getList(Content contentModel, Integer pageno, Integer pagesize) {
		Integer offset = (pageno-1) * pagesize;
		List<Content> list = this.contentDao.getList(contentModel, offset,pagesize);  //查询从offset+1开始，取pagesize条数据
		Integer rows = this.contentDao.findRows(contentModel); //查询数据有多少条
		PageInfomation<Content> result = new PageInfomation<Content>();
		result.setContent(list);
		result.setPageno(pageno);
		result.setPagesize(pagesize);
		result.setTotalpages(rows / pagesize + (rows % pagesize > 0 ? 1 : 0));
		logger.info("共{}页，每页{}条，当前是第{}页",rows / pagesize + (rows % pagesize > 0 ? 1 : 0),pagesize,pageno);
		return result;
	}
	
}
