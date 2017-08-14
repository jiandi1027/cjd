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
import com.rowell.sifa.pojo.dailymgr.CallCheck;
import com.rowell.sifa.service.dailymgr.CallCheckService;
import com.rowell.sifa.service.dailymgr.CallRegisterService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: CallCheckController  
    * @Description: 声纹认证Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/dailymgr/callCheck")
public class CallCheckController extends BaseController{
	@Autowired
	private CallCheckService callCheckService;
	@Autowired
	private CallRegisterService callRegisterService;

	@ModelAttribute("callCheck")
	public CallCheck get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return callCheckService.findById(id);
		}else{
			return new CallCheck();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CallCheck callCheck, Model model, HttpServletRequest request) {
		return "modules/dailymgr/callCheck/callCheckList";
	}
	
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(CallCheck callCheck, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(callCheck.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(callCheck.getOrderStr());
		}
		List<CallCheck> list = callCheckService.findAll(callCheck);
		
		PageInfo<CallCheck> pageInfo = new PageInfo<CallCheck>(list);
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
		return "modules/dailymgr/callCheck/callCheckForm";
	}
	
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(CallCheck callCheck, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, callCheck)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			callCheckService.insert(callCheck);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}
	
	//声纹认证
	@RequestMapping(value = "check")
	@ResponseBody
	public CommonJsonResult callCheck(Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			String culpritId = request.getParameter("culpritId");
			String uuid = null;
			String extion = "1";
			//String flag = callRegisterService.startRegister(uuid, culpritId, extion);
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
	
}
