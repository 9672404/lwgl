package com.hlzt.power.filter;
 
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
 

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hlzt.commons.context.AppContext;
import com.hlzt.power.model.Student;
import com.hlzt.power.model.Teacher;
import com.hlzt.power.model.User;
import com.hlzt.power.model.UserRole;
import com.hlzt.power.service.UserRoleSer;
import com.hlzt.power.service.UserSer;


 
/**
 * 
 * @author <a href="mailto:ketayao@gmail.com">ketayao</a> 
 * Version 1.1.0
 * @since 2012-8-7 上午9:20:26
 */
 
public class LoginAuthenticationFilter extends FormAuthenticationFilter {
    Logger logger=LoggerFactory.getLogger(LoginAuthenticationFilter.class);

	@Resource
	private UserSer userSer;
	@Resource
	private UserRoleSer userRoleSer;
	
	@Override  
    /** 
     * 登录验证 
     */  
    protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {  
		AuthenticationToken token = createToken(request, response);  
        try {  
            /*图形验证码验证*/  
           /* doCaptchaValidate((HttpServletRequest) request, token);  */
        	//String code = (String) request.getAttribute("validateCode");
        	String code=(String) request.getParameter("validateCode");
        	String yCode=((HttpServletRequest) request).getSession().getAttribute("RANDOMVALIDATECODEKEY").toString();
        	if(yCode==null){
        		request.setAttribute("errorMsg", "验证码错误");
        		return onLoginFailure(token, new AuthenticationException(), request, response); 
        	}
        	if(yCode.toLowerCase().equals(code.toLowerCase()))
        	{
	            Subject subject = getSubject(request, response);  
	            subject.login(token);//正常验证  
	            //LOG.info(token.getUsername()+"登录成功");  
	            return onLoginSuccess(token, subject, request, response);  
        	}
        	else
        	{
        		request.setAttribute("errorMsg", "验证码错误");
        		return onLoginFailure(token, new AuthenticationException(), request, response);  
        	}
        		 
        		
        }catch (AuthenticationException e) {
            //LOG.info(token.getUsername()+"登录失败--"+e);  
        	request.setAttribute("errorMsg", "账号或密码错误");
            return onLoginFailure(token, e, request, response);  
        }  
    }  
	/**
	 * 创建token时回调
	 */
    @Override
    protected AuthenticationToken createToken(ServletRequest request,
            ServletResponse response) {
    	
    /*    String username = getUsername(request);
        String password = getPassword(request);

        boolean rememberMe = isRememberMe(request);
        String host = getHost(request);
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
	    token.setRememberMe(true);*/
        return super.createToken(request, response);
    }
    
    /**
     * 没有认证时，回调
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
 
        //执行父类里的登录逻辑，调用Subject.login登录  

    	if(StringUtils.isNotEmpty(getUsername(request))&&StringUtils.isNotEmpty(getPassword(request)))
    	  return executeLogin(request, response);
    
          return super.onAccessDenied(request, response); 
      //  
        
    }
 
    /**
     * 用来判断用户是否已经认证，
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
 
    	 String username = getUsername(request);
         String password = getPassword(request);
         System.out.println(username+"   "+password);
    	 return super.isAccessAllowed(request, response, mappedValue);
    }
    
    /**
     * 登陆成功时回调
     */
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject,
            ServletRequest request, ServletResponse response) throws Exception {
    	
    	String username = getUsername(request);
    	User user = userSer.findUserByUserNum(username);
    	((HttpServletRequest)request).getSession().setAttribute("user", user);
    	if("student".equals(user.getRoleName())){
    		Student student = new Student();
    		student = userSer.finStudentByUserNum(username);
    		((HttpServletRequest)request).getSession().setAttribute("student", student);		
    	}else{
    		Teacher teacher = new Teacher();
    		teacher = userSer.finTeacherByUserNum(username);
    		List<UserRole> roleList = new ArrayList<UserRole>();
    		try{
    			roleList = userRoleSer.findRoleByUserId(teacher.getUserId());	
    		}catch (Exception e) {
				e.printStackTrace();
			}
    		if(null!=roleList){			
    			teacher.setRoleList(roleList);
    		}
    		((HttpServletRequest)request).getSession().setAttribute("teacher", teacher);
    	}
    	
    	 return super.onLoginSuccess(token, subject, request, response);
    }
    
    /**
     * 登陆失败时回调
     */
    @Override
    protected boolean onLoginFailure(AuthenticationToken token,
    		AuthenticationException e, ServletRequest request,
    		ServletResponse response) {
    	
    	// TODO Auto-generated method stub

    		try {
				request.getRequestDispatcher("WEB-INF/page/login.jsp").forward(request,response);
			} catch (ServletException e1){
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1){
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			//WebUtils.issueRedirect(request, response, getLoginUrl());
		
    	return false;
    }
}