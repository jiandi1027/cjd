package com.rowell.sifa.web.base;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import javax.validation.Validator;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EasyUiCommonResult;
import com.rowell.common.util.validate.BeanValidators;
import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.Reflections;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.config.Global;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.sys.utils.IntegerEditor;
/**
 * 控制器支持类
 * @author marcle
 * @version 2015-07-8
 */
public abstract class BaseController {

	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 管理基础路径
	 */
	@Value("${adminPath}")
	protected String adminPath;
	
	/**
	 * 前端基础路径
	 */
	@Value("${frontPath}")
	protected String frontPath;
	
	/**
	 * 前端URL后缀
	 */
	@Value("${urlSuffix}")
	protected String urlSuffix;
	
	/**
	 * 验证Bean实例对象
	 */
	@Autowired
	protected Validator validator;
	
	
	protected final static String ERROR = "/error_page";
	
	
	  protected HttpServletRequest request; 
	    protected HttpServletResponse response; 

	    @ModelAttribute   
	    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response) { 
	        this.request = request;   
	        this.response = response;  
	    } 

	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组
	 * @return 验证成功：返回true；严重失败：将错误信息添加到 message 中
	 */
	protected boolean beanValidator(Model model, Object object, Class<?>... groups) {
		try{
			BeanValidators.validateWithException(validator, object, groups);
		}catch(ConstraintViolationException ex){
			List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
			list.add(0, "数据验证失败：");
			addMessage(model, list.toArray(new String[]{}));
			return false;
		}
		return true;
	}
	
	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组
	 * @return 验证成功：返回true；严重失败：将错误信息添加到 flash message 中
	 */
	protected boolean beanValidator(RedirectAttributes redirectAttributes, Object object, Class<?>... groups) {
		try{
			BeanValidators.validateWithException(validator, object, groups);
		}catch(ConstraintViolationException ex){
			List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
			list.add(0, "数据验证失败：");
			addMessage(redirectAttributes, list.toArray(new String[]{}));
			return false;
		}
		return true;
	}
	
	/**
	 * 服务端参数有效性验证
	 * @param object 验证的实体对象
	 * @param groups 验证组，不传入此参数时，同@Valid注解验证
	 * @return 验证成功：继续执行；验证失败：抛出异常跳转400页面。
	 */
	protected void beanValidator(Object object, Class<?>... groups) {
		BeanValidators.validateWithException(validator, object, groups);
	}
	
	/**
	 * 添加Model消息
	 * @param message
	 */
	protected void addMessage(Model model, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		model.addAttribute("message", sb.toString());
	}
	
	/**
	 * 添加Flash消息
	 * @param message
	 */
	protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		redirectAttributes.addFlashAttribute("message", sb.toString());
	}
	
	public HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
	
	
	/**
	 * 客户端返回字符串
	 * @param response
	 * @param string
	 * @return
	 */
	protected String renderString(HttpServletResponse response, String string, String type) {
		try {
			response.reset();
	        response.setContentType(type);
	        response.setCharacterEncoding("utf-8");
			response.getWriter().print(string);
			return null;
		} catch (IOException e) {
			return null;
		}
	}

	/**
	 * 参数绑定异常
	 */
	@ExceptionHandler({BindException.class, ConstraintViolationException.class, ValidationException.class})
    public String bindException() {  
        return "error/400";
    }
	
	/**
	 * 授权登录异常
	 */
	@ExceptionHandler({AuthenticationException.class})
    public String authenticationException() {  
        return "error/403";
    }
	
	/**
	 * 初始化数据绑定
	 * 1. 将所有传递进来的String进行HTML编码，防止XSS攻击
	 * 2. 将字段中Date类型转换为String类型
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Integer.class, new IntegerEditor());

		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}
			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}
//			@Override
//			public String getAsText() {
//				Object value = getValue();
//				return value != null ? DateUtils.formatDateTime((Date)value) : "";
//			}
		});
	}
	
	public Integer getPageSize(){
		return StringUtils.isBlank(getRequest().getParameter("rows"))?Integer.parseInt(Global.getConfig("page.pageSize")):Integer.parseInt(getRequest().getParameter("rows"));
		
	}
	
	/**
	 * 将对象转换成JSON字符串，并响应回前台
	 * 
	 * @param object
	 * @throws IOException
	 */
	public void writeJson(Object object) {
		try {
			// SerializeConfig serializeConfig = new SerializeConfig();
			// serializeConfig.setAsmEnable(false);
			// String json = JSON.toJSONString(object);
			// String json = JSON.toJSONString(object, serializeConfig, SerializerFeature.PrettyFormat);
			String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
			// String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss", SerializerFeature.PrettyFormat);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(json);
			response.getWriter().flush();
		} catch (IOException e) {
			logger.debug(com.rowell.common.utils.ExceptionUtil.getExceptionMessage(e));
		}
	}
	
	public EasyUiCommonResult getCommonJsonResult(Object object,EasyUiCommonResult easyUiCommonResult,String identify,String title){
		if(!StringUtils.isBlank(identify)){
			identify = "id";
		}
		Object obj = Reflections.getFieldValue(object, identify);
		if(obj==null){
			easyUiCommonResult = EasyUiCommonResult.build("保存"+title+"成功！");
		}else{
			easyUiCommonResult = EasyUiCommonResult.build("修改"+title+"成功！");
		}
		return easyUiCommonResult;
	}
	public EasyUiCommonResult getCommonJsonResult(Object object,EasyUiCommonResult easyUiCommonResult,String title){
		return getCommonJsonResult(object,easyUiCommonResult,null,title);
	}
	
	 /**
     * ajax失败
     * @param msg 失败的消息
     * @return {Object}
     */
    public CommonJsonResult renderError(String msg) {
    	CommonJsonResult result = new CommonJsonResult();
    	result.setStatus(500);
    	result.setSuccess(false);
        result.setMsg(msg);
        return result;
    }

    /**
     * ajax成功
     * @return {Object}
     */
    public Object renderSuccess() {
    	CommonJsonResult result = new CommonJsonResult();
    	result.setStatus(200);
        result.setSuccess(true);
        return result;
    }

    /**
     * ajax成功
     * @param msg 消息
     * @return {Object}
     */
    public Object renderSuccess(String msg) {
    	CommonJsonResult result = new CommonJsonResult();
    	result.setStatus(200);
        result.setMsg(msg);
        result.setSuccess(true);
        return result;
    }

    /**
     * ajax成功
     * @param obj 成功时的对象
     * @return {Object}
     */
    public Object renderSuccess(Object data) {
    	CommonJsonResult result = new CommonJsonResult();
    	result.setStatus(200);
        result.setSuccess(true);
        result.setData(data);
        return result;
    }
    /***
     * 
        * @Title: getSysFiles  
        * @Description:获取附件信息
        * @param @return    参数  
        * @return List<SysFile>    返回类型  
        * @throws
     */
    public List<SysFile> getSysFiles(){
    	//原始名称
    	String originNames[] = request.getParameterValues("originName");
    	//地址
    	String urls[] = request.getParameterValues("url");
    	//文件名称
    	String fileNames[] = request.getParameterValues("fileName");
    	
    	List<SysFile> sysFiles = new ArrayList<SysFile>();
    	if(fileNames!=null && fileNames.length>0){
    		SysFile sysFile;
    		for(int i=0;i<fileNames.length;i++){
    			sysFile = new SysFile();
    			sysFile.setOriginName(originNames[i]);
    			sysFile.setPath(urls[i]);
    			sysFile.setName(fileNames[i]);
    			sysFiles.add(sysFile);
    		}
    	}
    	
    	return sysFiles;
    	
    }
    
    /***
     * 
        * @Title: getSysFiles  
        * @Description:获取附件信息
        * @param @return    参数  
        * @return List<SysFile>    返回类型  
        * @throws
     */
    public List<SysFile> getSysFiles(String uploadName){
    	String a=request.getParameter(uploadName + "UploadPathName");
    	if(a==null){
    		return null;
    	}
    	//原始名称
    	String originNames[] = a.split(",");
    	//地址
    	String urls[] = request.getParameter(uploadName + "UploadUrl").split(",");
    	//文件名称
    	String fileNames[] = request.getParameter(uploadName + "UploadPath").split(",");
    	
    	List<SysFile> sysFiles = new ArrayList<SysFile>();
    	if(fileNames!=null && fileNames.length>0){
    		SysFile sysFile;
    		for(int i=0;i<fileNames.length;i++){
    			if (!StringUtils.isBlank(fileNames[i])) {
    				sysFile =new SysFile();
    				sysFile.setOriginName(originNames[i]);
    				sysFile.setPath(urls[i]);
    				sysFile.setName(fileNames[i]);
    				sysFiles.add(sysFile);
				}
    		}
    	}
    	
    	return sysFiles;
    }
	
}
