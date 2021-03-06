package com.hlzt.power.web;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hlzt.commons.helper.StringHelper;
import com.hlzt.power.model.Major;
import com.hlzt.power.model.Teacher;
import com.hlzt.power.model.User;
import com.hlzt.power.model.ZhiCheng;
import com.hlzt.power.service.PublicSer;
import com.hlzt.power.service.UserSer;

/**
 * 专业负责人账号信息管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/secretary")
public class SecretaryPersonInfo {
	@Resource
	private UserSer userSer;
	@Resource
	private PublicSer publicSer;
	
	/**
	  * 查询个人信息
	  * @param id
	  * @param model
	  * @param request
	  * @param response
	  * @return
	  */
	 @RequestMapping("/findInfo.shtm")
	 public String findTeacherInfo(Model model,
			 HttpServletRequest request, HttpServletResponse response){
		 User loginUser = (User) request.getSession().getAttribute("user");
		 Teacher tea = new Teacher();
		 
		 try {
			 tea = userSer.findTeacherInfo(loginUser.getId());
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "系统异常！");
		}
		List<Major> majorlist = new ArrayList<Major>();
		List<ZhiCheng> zhiChenglist = new ArrayList<ZhiCheng>();
		zhiChenglist = publicSer.findZhiCheng();
		model.addAttribute("zhiChengList", zhiChenglist);
		majorlist = publicSer.findMajor();	
		model.addAttribute("majorList", majorlist);	
		model.addAttribute("tea", tea);
		return "Secretary/secretaryPersonInfo.jsp";
	 }
	 
	 /**
	  * 更改教师
	  * @param userNum
	  * @param stuName
	  * @param sex
	  * @param password
	  * @param tel
	  * @param mail
	  * @param major
	  * @param stuClass
	  * @param model
	  * @param request
	  * @param response
	  * @return
	  */
	 @RequestMapping("/findInfo_updateInfo.shtm")
	 public String updateInfo(String teaName, String sex, String zhicheng,
			 String password, String tel, String mail, String major, String userId,
			 Model model,  HttpServletRequest request, HttpServletResponse response){
		 if(StringUtils.isBlank(teaName)){
			 model.addAttribute("errorMsg", "姓名不能为空！");
			 return findTeacherInfo(model, request, response);
		 }
		 User user = new User();
		 user.setId(userId);
		 if(StringUtils.isNotBlank(password)){
			 user.setPassword(StringHelper.getMD5(String.valueOf(password)));
		 }			 
		 user.setRealName(teaName);
		 user.setSex(sex);
		 
		 Teacher tea = new Teacher();
		 tea.setTeaName(teaName);
		 tea.setSex(sex);
		 tea.setZhicheng(zhicheng);
		 tea.setTel(tel);
		 tea.setMail(mail);
		 if(!"0".equals(major)){
			 tea.setMajor(major);			 
		 }
		 tea.setUserId(userId);
		 
		 int i = 0,j = 0;
		 try {
			 i = userSer.updateUserInfo(user);
			 if(i!=0){
				 j = userSer.updateTeaInfo(tea);				 
			 }
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "系统异常！");
			return "error/error.jsp";
		}
		if(i!=0&&j!=0){
			model.addAttribute("successMsg", "修改成功！");			
		}
		return findTeacherInfo(model, request, response);
	 }
}
