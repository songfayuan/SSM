/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service
 * 创建时间：2017年6月26日上午10:55:42
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service;

import com.songfayuan.ssm.entity.Population;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月26日上午10:55:42
 */
public interface PopulationService {

	//分页查询-查询所有的一级人群标签列表
	PageInfomation<Population> getList(Population popModel, Integer pageno, Integer pagesize);

	//查询所有的二级人群标签列表
	PageInfomation<Population> getSecondList(Integer id, Integer pageno, Integer pagesize);

	//根据id删除二级人群标签数据
	void deleteByPid(Integer id, Integer pid);

	//根据id删除一级分类
	void delete(Integer id);

	//根据id和pid查询一条数据
	Population selectByPid(Integer id, Integer pid);

	//保存更新
	void update(Population population);

	//保存添加的二级类别
	void saveSecondType(Population population);

}
