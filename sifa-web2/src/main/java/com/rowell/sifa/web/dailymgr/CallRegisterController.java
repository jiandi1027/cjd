package com.rowell.sifa.web.dailymgr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.CallRegister;
import com.rowell.sifa.service.dailymgr.CallRegisterService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: CallRegisterController  
    * @Description: 声纹注册Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/dailymgr/callRegister")
public class CallRegisterController extends BaseController{
	@Autowired
	private CallRegisterService callRegisterService;

	@ModelAttribute("callRegister")
	public CallRegister get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return callRegisterService.findById(id);
		}else{
			return new CallRegister();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CallRegister callRegister, Model model, HttpServletRequest request) {
		return "modules/dailymgr/callRegister/callRegisterList";
	}
	
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(CallRegister callRegister, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(callRegister.getGroupId())){
			callRegister.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(callRegister.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(callRegister.getOrderStr());
		}
		List<CallRegister> list = callRegisterService.findAll(callRegister);
		
		PageInfo<CallRegister> pageInfo = new PageInfo<CallRegister>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	//跳转到增加页面
	@RequestMapping(value = "form")
	public String form(String id, Model model, HttpServletRequest request) {
		return "modules/dailymgr/callRegister/callRegisterForm";
	}
	
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(CallRegister callRegister, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, callRegister)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			callRegisterService.insert(callRegister);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}

	//声纹注册
	@RequestMapping(value = "register")
	@ResponseBody
	public CommonJsonResult register(Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			String culpritId = request.getParameter("culpritId");
			String uuid = null;
			String extion = "0";
//			String flag = callRegisterService.startRegister(uuid, culpritId, extion);
			String flag = "true";
			commonJsonResult = CommonJsonResult.ok();
			if (flag.equals("true")) {
				commonJsonResult.setMsg("true");
			} else if (flag.equals("notelno")) {
				commonJsonResult.setMsg("notelno");
			} else if (flag.equals("false")) {
				commonJsonResult.setMsg("false");
			} 
			
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}
	

	//get请求跳转页
	@RequestMapping(value = "player")
	public String player(String url, Model model, HttpServletRequest request) {
		model.addAttribute("url", url);
		return "modules/dailymgr/callRegister/player";
	}
	
}
