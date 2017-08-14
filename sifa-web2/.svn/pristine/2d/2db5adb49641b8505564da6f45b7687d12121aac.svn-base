  
    /**    
    * @Title: FingerController.java  
    * @Package com.rowell.sifa.web.dailymgr  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月1日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.web.dailymgr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.sys.IfaceMachine;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.FingerService;
import com.rowell.sifa.service.sys.IfaceMachineService;
import com.rowell.sifa.web.base.BaseController;

/**  
    * @ClassName: FingerController  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author xiaoguang  
    * @date 2017年3月1日  
    *    
    */
@Controller
@RequestMapping(value = "/finger")
public class FingerController extends BaseController {
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private FingerService fingerService;
	@Autowired
	private IfaceMachineService ifaceMachineService;
	
	@RequestMapping(value = "regIface")
	@ResponseBody
	public CommonJsonResult regIface(HttpServletRequest request, String culpritId, Model model, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			String info = fingerService.newIface(culpritId, SysAccountUtils.getSysAccount());
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg(info);

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return commonJsonResult;
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(IfaceMachine ifaceMachine, String culpritId, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		model.addAttribute("culpritId", culpritId);
		List<IfaceMachine> list = ifaceMachineService.findAll(ifaceMachine);
		model.addAttribute("list", list);

		return "/modules/dailymgr/fileManagement/ifaceMachineCheck";
	}
	
	@RequestMapping(value = "regIfaceToCp")
	@ResponseBody
	public CommonJsonResult regIfaceToCp(HttpServletRequest request, String culpritId, String checkId, Model model, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		
		try {
			String info = fingerService.newIfaceToCp(culpritId, checkId, SysAccountUtils.getSysAccount());
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg(info);

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return commonJsonResult;
		}
	}
	
	
}
