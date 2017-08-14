package com.rowell.sifa.web.rewardspunishment;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rowell.sifa.pojo.rewardspunishment.Commend;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: MonthlyPerformanceController  
    * @Description: 月度考核评议
    * @author FWY
    * @date 2017年4月13日  
    *
 */
@Controller
@RequestMapping(value="/assess/MonthlyPerformance")
public class MonthlyPerformanceController  extends BaseController{
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Commend commend, Model model, HttpServletRequest request) {
		return "modules/assess/MonthlyPerformance/MonthlyPerformanceList";
	}
}
