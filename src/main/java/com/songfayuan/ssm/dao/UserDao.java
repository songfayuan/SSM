/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.dao
 * 创建时间：2017年6月14日上午11:22:50
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.songfayuan.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.Pageable;

import com.songfayuan.ssm.entity.User;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月14日上午11:22:50
 */
public interface UserDao {

	//根据用户名，用户密码，用户类型查询用户
	public User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password, @Param("usertype") Integer usertype);

	//注册用户列表
	public List<User> getRegistUserslist();

	//当天新增用户
	public List<User> userDayaddList();

	//本周新增用户
	public List<User> userWeekaddList();

	//当月新增用户
	public List<User> userMonthaddList();

	//本年度新增用户
	public List<User> userYearaddList();

	//查询所有的用户列表（查询从offset+1开始，取pagesize条数据）
	public List<User> getUserList(@Param("model") User userModel, @Param("offset") Integer offset, @Param("pagesize") Integer pagesize);

	//查询数据有多少条
	public Integer findRows(@Param("model") User userModel);

	//获取所以的用户数据列表
	public List<User> getExportExcelUserList();

	//根据ID获取用户详情
	public User findDetailById(@Param("id") Integer id);

	//根据id删除接用户列表信息
	public void delete(Integer id);

	//查询操作人名称
	public User findUserNameByUserId(@Param("id") Integer userid);

	//查询管理员列表
	public List<User> getAdminList(@Param("model") User userModel, @Param("offset") Integer offset, @Param("pagesize") Integer pagesize);

	//查询管理员列表条数
	public Integer findAdminListRows(@Param("model") User userModel);

	public void save(User user);

	//根据username查询数据库是否存在数据
	public List<User> findUserByUsername(@Param("username") String username);

	public User findById(@Param("id") Integer id);

	//更新编辑数据
	public void update(User user);

}
