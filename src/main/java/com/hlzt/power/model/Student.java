package com.hlzt.power.model;

import com.hlzt.commons.model.BaseBean;

/**
 * 学生表
 * @author user
 *
 */
public class Student extends BaseBean{
	
	private String stuName;//姓名
	private String userNum;//学号
	private String sex;//性别
	private String department;//院系
	private String major;//专业
	private String stuClass;//班级
	private String title;//题目
	private String grade;//成绩
	private String tel;//电话号码
	private String mail;//邮箱
	private String zdTeacher;//指导老师
	private String zdTeaName;
	private String zdTeaZhiCheng;//指导老师职称
	private String pyTeacher;//评阅老师
	private String pyTeaName;
	private String pyTeaZhiCheng;//评阅老师职称
	private String userId;//对应User中的Id
	private String dbGroup;//所属答辩小组
	
	private String titleSourse;//课题来源
	private String titleName;//课题名称
	private String teaStatus;//审核状态
	private String applyTitleId;//课题Id
	
	private TaskBook taskBook;
	private OpeningReport openingReport;
	private MidCheck midCheck;
	
	
	private String finalPaperPath;
	
	public String getTitleSourse() {
		return titleSourse;
	}
	public void setTitleSourse(String titleSourse) {
		this.titleSourse = titleSourse;
	}
	public String getTitleName() {
		return titleName;
	}
	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}
	public String getTeaStatus() {
		return teaStatus;
	}
	public void setTeaStatus(String teaStatus) {
		this.teaStatus = teaStatus;
	}
	
	
	private Grade jdgrade;//从Grade表中得到各个阶段的成绩；
	
	public TaskBook getTaskBook() {
		return taskBook;
	}
	public void setTaskBook(TaskBook taskBook) {
		this.taskBook = taskBook;
	}
	public OpeningReport getOpeningReport() {
		return openingReport;
	}
	public void setOpeningReport(OpeningReport openingReport) {
		this.openingReport = openingReport;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getStuClass() {
		return stuClass;
	}
	public void setStuClass(String stuClass) {
		this.stuClass = stuClass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getZdTeacher() {
		return zdTeacher;
	}
	public void setZdTeacher(String zdTeacher) {
		this.zdTeacher = zdTeacher;
	}
	public String getZdTeaName() {
		return zdTeaName;
	}
	public void setZdTeaName(String zdTeaName) {
		this.zdTeaName = zdTeaName;
	}
	public String getPyTeacher() {
		return pyTeacher;
	}
	public void setPyTeacher(String pyTeacher) {
		this.pyTeacher = pyTeacher;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPyTeaName() {
		return pyTeaName;
	}
	public void setPyTeaName(String pyTeaName) {
		this.pyTeaName = pyTeaName;
	}
	public String getDbGroup() {
		return dbGroup;
	}
	public void setDbGroup(String dbGroup) {
		this.dbGroup = dbGroup;
	}
	public MidCheck getMidCheck() {
		return midCheck;
	}
	public void setMidCheck(MidCheck midCheck) {
		this.midCheck = midCheck;
	}
	public Grade getJdgrade() {
		return jdgrade;
	}
	public void setJdgrade(Grade jdgrade) {
		this.jdgrade = jdgrade;
	}
	public String getApplyTitleId() {
		return applyTitleId;
	}
	public void setApplyTitleId(String applyTitleId) {
		this.applyTitleId = applyTitleId;
	}
	public String getFinalPaperPath() {
		return finalPaperPath;
	}
	public void setFinalPaperPath(String finalPaperPath) {
		this.finalPaperPath = finalPaperPath;
	}
	public String getZdTeaZhiCheng() {
		return zdTeaZhiCheng;
	}
	public void setZdTeaZhiCheng(String zdTeaZhiCheng) {
		this.zdTeaZhiCheng = zdTeaZhiCheng;
	}
	public String getPyTeaZhiCheng() {
		return pyTeaZhiCheng;
	}
	public void setPyTeaZhiCheng(String pyTeaZhiCheng) {
		this.pyTeaZhiCheng = pyTeaZhiCheng;
	}
	
	
}
