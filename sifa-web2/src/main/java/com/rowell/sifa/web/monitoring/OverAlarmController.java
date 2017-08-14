
package com.rowell.sifa.web.monitoring;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.monitoring.OverAlarm;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.monitoring.OverAlarmService;
import com.rowell.sifa.service.monitoring.SfAreaService;
import com.rowell.sifa.service.monitoring.TerminalAreaService;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.sys.utils.OffsetUtil;
import com.rowell.sifa.web.base.BaseController;
import com.rowell.sifa.web.terminal.LocationAlarmUtil;

/**
 * @ClassName: OverAlarmController
 * @Description: TODO(越界警告Controller)
 * @author fwy
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/overAlarm")
public class OverAlarmController extends BaseController{
	private static Logger logger = Logger.getLogger(OverAlarmController.class); 
	@Autowired
	private OverAlarmService overAlarmService;
	@Autowired
	private TerminalService terminalService;
	@Autowired
	private TerminalAreaService terminalAreaService;
	@Autowired
	private SfAreaService sfAreaService;
	@Autowired
	CulpritService culpritService;
	@Autowired
	private TerminalHistoryService terminalHistoryService;
	
	@ModelAttribute("overAlarm")
	public OverAlarm get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return overAlarmService.findById(id);
		} else {
			return new OverAlarm();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(OverAlarm overAlarm, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("account", sysAccount);
		
		return "modules/monitoring/overAlarm/overAlarmList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(OverAlarm overAlarm, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(overAlarm.getGroupId())) {
			overAlarm.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(overAlarm.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(overAlarm.getOrderStr());
		}
//		List<OverAlarm> list = overAlarmService.findAll(overAlarm);
		List<OverAlarm> list = overAlarmService.findAllByRowone(overAlarm);
		for (OverAlarm record : list) {
			if (StringUtils.isBlank(record.getLocation()) && record.getTerminalHisId() != null) {
				double[] offset = OffsetUtil.transformGPS2MapABC(Double.parseDouble(record.getLat()) , Double.parseDouble(record.getLon()));
				record.setLocation(OffsetUtil.getMapBarAddr(offset[1]+"", offset[0]+""));
				
				TerminalHistory terminalHistory = new TerminalHistory();
				terminalHistory.setId(record.getTerminalHisId());
				terminalHistory.setLocation(record.getLocation());
				terminalHistory.setLat(Float.parseFloat(record.getLat()));
				terminalHistory.setLon(Float.parseFloat(record.getLon()));
				terminalHistoryService.updateByIdSelective(terminalHistory);
			}
		}
		PageInfo<OverAlarm> pageInfo = new PageInfo<OverAlarm>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = "hislist", method = RequestMethod.GET)
	public String forHisList(OverAlarm overAlarm, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("account", sysAccount);
		
		return "modules/monitoring/overAlarm/overAlarmHisList";
	}
	
	@RequestMapping(value = { "hislist", "" })
	@ResponseBody
	public EUDataGridResult hislist(OverAlarm overAlarm, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(overAlarm.getGroupId())) {
			overAlarm.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(overAlarm.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(overAlarm.getOrderStr());
		}
		List<OverAlarm> list = overAlarmService.findAll(overAlarm);
		for (OverAlarm record : list) {
			if (StringUtils.isBlank(record.getLocation()) && record.getTerminalHisId() != null) {
				double[] offset = OffsetUtil.transformGPS2MapABC(Double.parseDouble(record.getLat()) , Double.parseDouble(record.getLon()));
				record.setLocation(OffsetUtil.getMapBarAddr(offset[1]+"", offset[0]+""));
				
				TerminalHistory terminalHistory = new TerminalHistory();
				terminalHistory.setId(record.getTerminalHisId());
				terminalHistory.setLocation(record.getLocation());
				terminalHistory.setLat(Float.parseFloat(record.getLat()));
				terminalHistory.setLon(Float.parseFloat(record.getLon()));
				terminalHistoryService.updateByIdSelective(terminalHistory);
			}
		}
		PageInfo<OverAlarm> pageInfo = new PageInfo<OverAlarm>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	/***
	 * 
	    * @Title: save  
	    * @Description: 保存越界警告  
	    * @param @param overAlarm
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(OverAlarm overAlarm, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, overAlarm)) {
				commonJsonResult = CommonJsonResult.build(505, "上报失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			return overAlarmService.saveOverAlarm(overAlarm);
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(overAlarm.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "上报失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "上报失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}

	@RequestMapping(value = "setOverAlarmLocation")
	@ResponseBody
	public CommonJsonResult setOverAlarmLocation(String x, String y, String mobile, String id, Model model, HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;
		try {
			logger.info("1:"+new Date());
			String msg = LocationAlarmUtil.isPointInPolygon(x, y, mobile, terminalService, terminalAreaService, sfAreaService);
			logger.info("msg:"+msg);
			logger.info("2:"+new Date());
			overAlarmService.judgeOverAlarm(x, y, mobile, id, msg);
			logger.info("3:"+new Date());

			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("success");
			return commonJsonResult;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(505, "error");
			commonJsonResult.setIsError(true);
			
			return commonJsonResult;
		}
	}
	
	@RequestMapping(value = "setOverAlarmLocation2")
	@ResponseBody
	public void setOverAlarmLocation2(String x, String y, String mobile, String id, Model model, HttpServletRequest request) {
		try {
			logger.info("1:"+new Date());
			String msg = LocationAlarmUtil.isPointInPolygon(x, y, mobile, terminalService, terminalAreaService, sfAreaService);
			logger.info("msg:"+msg);
			logger.info("2:"+new Date());
			overAlarmService.judgeOverAlarm(x, y, mobile, id, msg);
			logger.info("3:"+new Date());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/dispose")
	public String dispose(@ModelAttribute("overAlarm")OverAlarm overAlarm, Model model) {
		overAlarm = overAlarmService.findById(overAlarm.getId());
		if (StringUtils.isBlank(overAlarm.getLocation())) {
			double[] offset = OffsetUtil.transformGPS2MapABC(Float.parseFloat(overAlarm.getLat()), Float.parseFloat(overAlarm.getLon()));
			if (offset != null) {
				overAlarm.setLocation(OffsetUtil.getMapBarAddr(Float.parseFloat(offset[1]+"")+"", Float.parseFloat(offset[0]+"")+""));
			}
		}
		
		model.addAttribute("overAlarm", overAlarm);
		
		return "modules/monitoring/overAlarm/overAlarmdis";
	}
	
	@RequestMapping("/hisdispose")
	public String hisdispose(@ModelAttribute("overAlarm")OverAlarm overAlarm, Model model) {
		overAlarm = overAlarmService.findById(overAlarm.getId());
		if (StringUtils.isBlank(overAlarm.getLocation())) {
			double[] offset = OffsetUtil.transformGPS2MapABC(Float.parseFloat(overAlarm.getLat()), Float.parseFloat(overAlarm.getLon()));
			if (offset != null) {
				overAlarm.setLocation(OffsetUtil.getMapBarAddr(Float.parseFloat(offset[1]+"")+"", Float.parseFloat(offset[0]+"")+""));
			}
		}
		
		model.addAttribute("overAlarm", overAlarm);
		
		return "modules/monitoring/overAlarm/overAlarmhisdis";
	}

}
