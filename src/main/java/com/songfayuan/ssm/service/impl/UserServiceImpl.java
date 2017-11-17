/**
 * 项目名称：ssm
 * 项目包名：com.songfayuan.ssm.service.impl
 * 创建时间：2017年6月14日上午11:12:03
 * 创建者：Administrator-宋发元
 * 创建地点：北京清科科技股份有限公司
 */
package com.songfayuan.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.data.domain.Sort;

import com.songfayuan.ssm.dao.UserDao;
import com.songfayuan.ssm.entity.User;
import com.songfayuan.ssm.service.UserService;
import com.songfayuan.ssm.util.PageInfomation;

/**
 * 描述：
 * @author songfayuan
 * 2017年6月14日上午11:12:03
 */
@Service
public class UserServiceImpl implements UserService{
	
	Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Resource
	private UserDao userDao;

	//根据用户名，用户密码，用户类型查询用户
	public User findByUsernameAndPassword(String username, String password, Integer usertype) {
		return this.userDao.findByUsernameAndPassword(username, password,usertype);
	}

	//注册用户列表
	public List<User> getRegistUserslist() {
		return this.userDao.getRegistUserslist();
	}

	//周期阶段增加的用户列表
	public List<User> getUserAddList(String cycle) {
		
		if(cycle == "day"){
			return this.userDao.userDayaddList();
		}else if(cycle == "week"){
			return this.userDao.userWeekaddList();
		}else if(cycle == "month"){
			return this.userDao.userMonthaddList();
		}else if(cycle == "year"){
			return this.userDao.userYearaddList();
		}
		
		return null;
	}

	//查询所有的用户列表
	public PageInfomation<User> getUserList(User userModel, Integer pageno, Integer pagesize) {
		Integer offset = (pageno-1) * pagesize;
		List<User> list = this.userDao.getUserList(userModel,offset,pagesize);  //查询从offset+1开始，取pagesize条数据
		Integer rows = this.userDao.findRows(userModel); //查询数据有多少条
		PageInfomation<User> result = new PageInfomation<User>();
		result.setContent(list);
		result.setPageno(pageno);
		result.setPagesize(pagesize);
		result.setTotalpages(rows / pagesize + (rows % pagesize > 0 ? 1 : 0));
		logger.info("共{}页，每页{}条，当前是第{}页",rows / pagesize + (rows % pagesize > 0 ? 1 : 0),pagesize,pageno);
		return result;
	}

	//获取所以的用户数据列表
	public List<User> getExportExcelUserList() {
		return this.userDao.getExportExcelUserList();
	}

	//根据ID获取用户详情
	public User findDetailById(Integer id) {
		return this.userDao.findDetailById(id);
	}

	//根据id删除接用户列表信息
	public void delete(Integer id) {
		this.userDao.delete(id);
	}

	//查询操作人名称
	public User findUserNameByUserId(Integer userid) {
		return this.userDao.findUserNameByUserId(userid);
	}

	//查询管理员列表
	public PageInfomation<User> getAdminList(User userModel, Integer pageno, Integer pagesize) {
		Integer offset = (pageno-1) * pagesize;
		List<User> list = this.userDao.getAdminList(userModel,offset,pagesize);  //查询从offset+1开始，取pagesize条数据
		Integer rows = this.userDao.findAdminListRows(userModel); //查询数据有多少条
		PageInfomation<User> result = new PageInfomation<User>();
		result.setContent(list);
		result.setPageno(pageno);
		result.setPagesize(pagesize);
		result.setTotalpages(rows / pagesize + (rows % pagesize > 0 ? 1 : 0));
		logger.info("共{}页，每页{}条，当前是第{}页",rows / pagesize + (rows % pagesize > 0 ? 1 : 0),pagesize,pageno);
		return result;
	}

	public void save(User user) {
		this.userDao.save(user);
	}

	//根据username查询数据库是否存在数据
	public List<User> findUserByUsername(String username) {
		return this.userDao.findUserByUsername(username);
	}

	public User findById(Integer id) {
		return this.userDao.findById(id);
	}

	//更新编辑数据
	public void update(User user) {
		this.userDao.update(user);
	}
	

}
