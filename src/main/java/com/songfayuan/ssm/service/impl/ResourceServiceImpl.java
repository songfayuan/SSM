/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service.impl
 * 创建时间：2017年6月21日上午11:01:44
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service.impl;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.songfayuan.ssm.dao.ResourceDao;
import com.songfayuan.ssm.entity.Resource;
import com.songfayuan.ssm.service.LogService;
import com.songfayuan.ssm.service.ResourceService;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月21日上午11:01:44
 */
@Service
public class ResourceServiceImpl implements ResourceService {
	
	Logger logger = LoggerFactory.getLogger(ResourceServiceImpl.class);
	
	@Autowired
	private ResourceDao resourceDao;

	public List<Resource> findByParentResourceId(Integer parentresourceid) {
		return this.resourceDao.findByParentResourceId(parentresourceid);
	}
	
}
