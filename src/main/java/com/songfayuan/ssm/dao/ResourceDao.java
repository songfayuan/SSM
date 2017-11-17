/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.dao
 * 创建时间：2017年6月21日上午11:04:36
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.dao;

import java.util.List;

import com.songfayuan.ssm.entity.Resource;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月21日上午11:04:36
 */
public interface ResourceDao {

	//根据父id得到资源列表
	public List<Resource> findByParentResourceId(Integer parentresourceid);

}
