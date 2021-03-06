package com.hlzt.power.model;


import com.hlzt.commons.model.BaseBean;
/**
 * 用户表
 * @author wangpengfei
 *
 */
public class User extends BaseBean{
 
    private String realName;//姓名
    
    private String sex;//性别
   
    private Boolean superAdmin;//是否超级管理员
    
    private String userNum;//账号
    
    private String password;//密码
    
    private String roleName;//角色名

    private Boolean locked;	//是否激活
    
    
    private String userRole;
    private String userRoleName;
    private String userHasRole;
    
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Boolean getSuperAdmin() {
		return superAdmin;
	}

	public void setSuperAdmin(Boolean superAdmin) {
		this.superAdmin = superAdmin;
	}

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getLocked() {
		return locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getUserRoleName() {
		return userRoleName;
	}

	public void setUserRoleName(String userRoleName) {
		this.userRoleName = userRoleName;
	}

	public String getUserHasRole() {
		return userHasRole;
	}

	public void setUserHasRole(String userHasRole) {
		this.userHasRole = userHasRole;
	}


	
	

	
    
    

	
}