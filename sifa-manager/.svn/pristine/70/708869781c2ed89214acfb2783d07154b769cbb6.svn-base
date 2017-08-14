package com.rowell.sifa.web.sys;

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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysCallBackmsg;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.SysCallBackmsgService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: SysCallBackmsgController  
    * @Description: 声纹回调信息Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/sys/sysCallBackmsg")
public class SysCallBackmsgController extends BaseController{
	@Autowired
	private SysCallBackmsgService sysCallBackmsgService;
	@Autowired
	private CulpritService culpritService;

	@ModelAttribute("sysCallBackmsg")
	public SysCallBackmsg get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return sysCallBackmsgService.findById(id);
		}else{
			return new SysCallBackmsg();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysCallBackmsg sysCallBackmsg, Model model, HttpServletRequest request) {
		return "modules/sys/sysCallBackmsg/sysCallBackmsgList";
	}
	
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(SysCallBackmsg sysCallBackmsg, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(sysCallBackmsg.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(sysCallBackmsg.getOrderStr());
		}
		List<SysCallBackmsg> list = sysCallBackmsgService.findAll(sysCallBackmsg);
		
		PageInfo<SysCallBackmsg> pageInfo = new PageInfo<SysCallBackmsg>(list);
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
		return "modules/sys/sysCallBackmsg/sysCallBackmsgForm";
	}
	
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SysCallBackmsg sysCallBackmsg, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, sysCallBackmsg)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			sysCallBackmsgService.insert(sysCallBackmsg);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}
	
	
	@RequestMapping(value = "callBackmsg")
	@ResponseBody
	public CommonJsonResult callBackmsg(Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			String culpritId = request.getParameter("culpritId");
			Culprit culprit = culpritService.findById(culpritId);
			List<SysCallBackmsg> list = sysCallBackmsgService.findMaxByTelno(culprit.getMobileNumber());
			String state = "";
			if (list.size() > 0) {
				state = list.get(0).getState();
			}
			commonJsonResult = CommonJsonResult.ok();
			if (state.equals("-5")) {
				commonJsonResult.setMsg("false");
			}
			else if (state == "") {
				commonJsonResult.setMsg("nostate");
			}
			else {
				commonJsonResult.setMsg("true");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}
	
}
