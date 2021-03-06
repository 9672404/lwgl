package com.hlzt.power.model;
/**
 * 用于查询学生各阶段提交文件的实体
 * @author user
 *
 */
public class StuStageFile {
	private String id;
	private String stuName;//姓名
	private String teaName;//导师姓名
	private String sex;//性别
	private String stuNum;//学号
	private String title;//题目
	private String nianji;//年级
	private String tel;//电话
	private String mail;//邮箱
	private String status;//审核状态
	private String taskBook;//任务书
	private String openingReport;//开题报告
	private String midCheck;//中期检查表
	private String firstPaper;//初稿
	private String finalPaper;//终稿
	private String replyNote;//答辩记录
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStuNum() {
		return stuNum;
	}
	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNianji() {
		return nianji;
	}
	public void setNianji(String nianji) {
		this.nianji = nianji;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTaskBook() {
		return taskBook;
	}
	public void setTaskBook(String taskBook) {
		this.taskBook = taskBook;
	}
	public String getOpeningReport() {
		return openingReport;
	}
	public void setOpeningReport(String openingReport) {
		this.openingReport = openingReport;
	}
	public String getMidCheck() {
		return midCheck;
	}
	public void setMidCheck(String midCheck) {
		this.midCheck = midCheck;
	}
	public String getFirstPaper() {
		return firstPaper;
	}
	public void setFirstPaper(String firstPaper) {
		this.firstPaper = firstPaper;
	}
	public String getFinalPaper() {
		return finalPaper;
	}
	public void setFinalPaper(String finalPaper) {
		this.finalPaper = finalPaper;
	}
	public String getReplyNote() {
		return replyNote;
	}
	public void setReplyNote(String replyNote) {
		this.replyNote = replyNote;
	}
	public String getTeaName() {
		return teaName;
	}
	public void setTeaName(String teaName) {
		this.teaName = teaName;
	}
	
	
	
}
