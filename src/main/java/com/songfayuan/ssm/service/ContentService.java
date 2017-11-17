/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service
 * 创建时间：2017年6月25日下午5:03:59
 * 创建者：Administrator-宋发元
 * 创建地点：杭州钜元网络科技有限公司
 */
package com.songfayuan.ssm.service;

import com.songfayuan.ssm.entity.Content;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月25日下午5:03:59
 */
public interface ContentService {

	//分页查询content list
	PageInfomation<Content> getList(Content contentModel, Integer pageno, Integer pagesize);

}
