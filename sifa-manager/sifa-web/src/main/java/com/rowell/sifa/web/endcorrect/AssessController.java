  
    /**    
    * @Title: AskLeaveController.java  
    * @Package com.rowell.sifa.web.dailymgr  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月1日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.web.endcorrect;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.web.base.BaseController;

/**  
    * @ClassName: AskLeaveController  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author xiaoguang  
    * @date 2017年3月1日  
    *    
    */
@Controller
@RequestMapping(value = "/endcorrect/assess")
public class AssessController extends BaseController {
	@Autowired
	private CulpritService culpritService;


	// @RequiresPermissions("dailymgr:dailymgrDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Culprit culprit, Model model, HttpServletRequest request) {
		return "modules/endcorrect/assess/assessList";
	}

	

	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		culprit.setGroupId(sysAccount.getGroupId());
		List<Culprit> list = culpritService.findAll(culprit);
		


		PageInfo<Culprit> pageInfo = new PageInfo<Culprit>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	
	

}
