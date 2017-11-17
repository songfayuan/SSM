/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service
 * 创建时间：2017年6月14日上午11:06:44
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.songfayuan.ssm.service;

import java.util.List;

import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月14日上午11:06:44
 */
public interface UserService {

	//根据用户名，用户密码，用户类型查询用户
	public User findByUsernameAndPassword(String username, String password, Integer usertype);

	//注册用户列表
	public List<User> getRegistUserslist();

	//当月注册用户列表
	public List<User> getUserAddList(String string);

	//查询所有的用户列表
	public PageInfomation<User> getUserList(User userModel, Integer pageno, Integer pagesize);

	//获取所以的用户数据列表
	public List<User> getExportExcelUserList();

	//根据ID获取用户详情
	public User findDetailById(Integer id);

	//根据id删除接用户列表信息
	public void delete(Integer id);

	//查询操作人名称
	public User findUserNameByUserId(Integer userid);

	//查询管理员列表
	public PageInfomation<User> getAdminList(User userModel, Integer pageno, Integer pagesize);

	public void save(User user);

	//根据username查询数据库是否存在数据
	public List<User> findUserByUsername(String username);

	public User findById(Integer id);

	//更新编辑数据
	public void update(User user);

}
