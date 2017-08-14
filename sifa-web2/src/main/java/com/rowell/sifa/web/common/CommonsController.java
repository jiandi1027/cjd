package com.rowell.sifa.web.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.commons.shiro.captcha.DreamCaptcha;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysAccountStatistics;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.AskLeaveService;
import com.rowell.sifa.service.dailymgr.DailyReportLastService;
import com.rowell.sifa.service.sys.SysAccountStatisticsService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.sys.utils.SysDicUtils;

/**
 * 通用的控制器
 * @author L.cm
 *
 */
@Controller
public class CommonsController {
    @Autowired
    private DreamCaptcha dreamCaptcha;
    @Autowired
	private CulpritJudgmentService clpritJudgmentService;
    @Autowired
	private CulpritService culpritService;
    @Autowired
	private DailyReportLastService dailyReportLastService;
    @Autowired
   	private AskLeaveService askLeaveService;
    @Autowired
   	private SysAccountStatisticsService sysAccountStatisticsService;
    @Autowired
   	private SysDicService sysDicService;
    
    private final static ObjectMapper mapper = new ObjectMapper();
    
    /**
     * 图标页
     */
    @RequestMapping(value = "icons.html", method = RequestMethod.GET)
    public String icons() {
        return "icons";
    }
    
    /**
     * 图标页
     */
    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String home(Model model) {
    	try {
    		//model.addAttribute("finishCount", culpritService.getFinishCountBy30Day());
    		//model.addAttribute("reportCount", dailyReportLastService.getNextReporCounttBy7Day());
    		//model.addAttribute("xjCount", askLeaveService.getXjCountBy3Day());
    		SysAccountStatistics sysAccountStatistics=sysAccountStatisticsService.getStatistics();
    		model.addAttribute("sysAccountStatistics", sysAccountStatistics);

    		model.addAttribute("statisticsList", sysDicService.getStatisticsSysDicList());

    		
//	    	List<Culprit> culpritPenalTypeList=culpritService.statisticsPenalType();
//	    	String culpritPenalTypeJson= mapper.writeValueAsString(culpritPenalTypeList);
//			model.addAttribute("culpritPenalTypeJson", culpritPenalTypeJson);
//			List<Culprit> culpritCrimeTypeList=culpritService.statisticsCrimeType();
//			String culpritCrimeTypeJson= mapper.writeValueAsString(culpritCrimeTypeList);
//			model.addAttribute("culpritCrimeTypeJson", culpritCrimeTypeJson);
    		SysAccount sysAccount = SysAccountUtils.getSysAccount();
        	Culprit culprit=new Culprit();
        	culprit.setGroupId(sysAccount.getGroupId());
			List<Culprit> culpritByYearList=culpritService.statisticsCulpritByYear(culprit);
			String culpritByYearJson= mapper.writeValueAsString(culpritByYearList);
			model.addAttribute("culpritByYearJson", culpritByYearJson);
//			List<Culprit> culpritByMonthList=culpritService.statisticsCulpritByMonth(culprit);
//			String culpritByMonthJson= mapper.writeValueAsString(culpritByMonthList);
//			model.addAttribute("culpritByMonthJson", culpritByMonthJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
        return "home";
    }
    
    @RequestMapping("/getPieStatistics")
	@ResponseBody
	public List<Culprit> getPieStatistics(String statisticsType,String count){
    	sysAccountStatisticsService.updateStatistics(statisticsType, count);
    	SysAccount sysAccount = SysAccountUtils.getSysAccount();
    	Culprit culprit=new Culprit();
    	culprit.setGroupId(sysAccount.getGroupId());
    	if(Constants.STATISTICS_XFZXLB.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsPenalType(culprit);
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_FZLX.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsCrimeType(culprit);
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_MONTH_STATUS.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsFinishByLastMonth();
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_HJQK.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsCulpritByHjqk(culprit);
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_HYZK.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsCulpritByHyzk(culprit);
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_YZZMM.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsCulpritByYzzmm(culprit);
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_JSFS.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsCulpritByJsfs(culprit);
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_XB.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsCulpritBySex(culprit);
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_WHCD.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsCulpritByWhcd(culprit);
    		return culpritTypeList;
    	}else if(Constants.STATISTICS_AREA.equals(statisticsType)){
    		//Culprit culprit=new Culprit();
    		culprit.setAreaCode(Constants.SYS_AREA);
    		List<Culprit> culpritTypeList=culpritService.statisticsCulpritByArea(culprit);
    		return culpritTypeList;
    	}
    	else if(Constants.STATISTICS_JZJCQK.equals(statisticsType)){
    		List<Culprit> culpritTypeList=culpritService.statisticsCulpritByStatus(culprit);
    		return culpritTypeList;
    	}
    	return null;
	}
    
    /**
     * 图形验证码
     */
    @RequestMapping(value = "captcha.jpg", method = RequestMethod.GET)
    public void captcha(HttpServletRequest request, HttpServletResponse response) {
    	dreamCaptcha.generate(request, response);
    }
    
    
}
