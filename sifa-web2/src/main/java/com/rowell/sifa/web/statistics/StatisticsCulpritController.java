package com.rowell.sifa.web.statistics;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rowell.common.pojo.echarts.EchartsJsonResult;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.web.base.BaseController;
//import com.sun.tools.extcheck.Main;

@Controller
@RequestMapping(value = "/statistics/culprit")
public class StatisticsCulpritController extends BaseController{
	@Autowired
	CulpritService culpritService;
	
	/***
	 * 
	    * @Title: statisticsCulpritByMonth  
	    * @Description: 最近六个月社区矫正人员变化统计 
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return EchartsJsonResult<Integer>    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "statisticsCulpritByMonth")
	@ResponseBody
	public EchartsJsonResult<Integer> statisticsCulpritByMonth(Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
    	Culprit culprit=new Culprit();
    	culprit.setGroupId(sysAccount.getGroupId());
    	return culpritService.statisticsCulpritByMonth(culprit);
	}
}
