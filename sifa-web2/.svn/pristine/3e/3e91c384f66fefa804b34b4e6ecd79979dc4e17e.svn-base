
package com.rowell.sifa.web.monitoring;

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
import com.rowell.sifa.pojo.monitoring.RemoveAlarm;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.monitoring.RemoveAlarmService;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.sys.utils.OffsetUtil;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: RemoveAlarmController
 * @Description: TODO(拆卸报警Controller)
 * @author pkx
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/removeAlarm")
public class RemoveAlarmController extends BaseController{
	private static Logger logger = Logger.getLogger(RemoveAlarmController.class); 
	@Autowired
	private RemoveAlarmService removeAlarmService;
	@Autowired
	private TerminalHistoryService terminalHistoryService;
	
	@ModelAttribute("removeAlarm")
	public RemoveAlarm get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return removeAlarmService.findById(id);
		} else {
			return new RemoveAlarm();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RemoveAlarm removeAlarm, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("account", sysAccount);
		
		return "modules/monitoring/removeAlarm/removeAlarmList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(RemoveAlarm removeAlarm, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(removeAlarm.getGroupId())) {
			removeAlarm.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(removeAlarm.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(removeAlarm.getOrderStr());
		}
//		List<RemoveAlarm> list = removeAlarmService.findAll(removeAlarm);
		List<RemoveAlarm> list = removeAlarmService.findAllByRowone(removeAlarm);
		for (RemoveAlarm record : list) {
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
		PageInfo<RemoveAlarm> pageInfo = new PageInfo<RemoveAlarm>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = "hislist", method = RequestMethod.GET)
	public String forHisList(RemoveAlarm removeAlarm, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("account", sysAccount);
		
		return "modules/monitoring/removeAlarm/removeAlarmHisList";
	}
	
	@RequestMapping(value = { "hislist", "" })
	@ResponseBody
	public EUDataGridResult hislist(RemoveAlarm removeAlarm, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(removeAlarm.getGroupId())) {
			removeAlarm.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(removeAlarm.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(removeAlarm.getOrderStr());
		}
		List<RemoveAlarm> list = removeAlarmService.findAll(removeAlarm);
		for (RemoveAlarm record : list) {
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
		PageInfo<RemoveAlarm> pageInfo = new PageInfo<RemoveAlarm>(list);
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
	    * @Description: 保存拆卸报警  
	    * @param @param removeAlarm
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(RemoveAlarm removeAlarm, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, removeAlarm)) {
				commonJsonResult = CommonJsonResult.build(505, "上报失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			
			if (StringUtils.isBlank(removeAlarm.getId())) {
				removeAlarmService.insert(removeAlarm);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("上报成功");
			} else {
				removeAlarmService.updateByIdSelective(removeAlarm);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("上报成功");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(removeAlarm.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "上报失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "上报失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}

	@RequestMapping("/dispose")
	public String dispose(@ModelAttribute("removeAlarm")RemoveAlarm removeAlarm, Model model) {
		removeAlarm = removeAlarmService.findById(removeAlarm.getId());
		if (StringUtils.isBlank(removeAlarm.getLocation())) {
			double[] offset = OffsetUtil.transformGPS2MapABC(Float.parseFloat(removeAlarm.getLat()), Float.parseFloat(removeAlarm.getLon()));
			if (offset != null) {
				removeAlarm.setLocation(OffsetUtil.getMapBarAddr(Float.parseFloat(offset[1]+"")+"", Float.parseFloat(offset[0]+"")+""));
			}
		}
		
		model.addAttribute("removeAlarm", removeAlarm);
		
		return "modules/monitoring/removeAlarm/removeAlarmdis";
	}
	
	@RequestMapping("/hisdispose")
	public String hisdispose(@ModelAttribute("removeAlarm")RemoveAlarm removeAlarm, Model model) {
		removeAlarm = removeAlarmService.findById(removeAlarm.getId());
		if (StringUtils.isBlank(removeAlarm.getLocation())) {
			double[] offset = OffsetUtil.transformGPS2MapABC(Float.parseFloat(removeAlarm.getLat()), Float.parseFloat(removeAlarm.getLon()));
			if (offset != null) {
				removeAlarm.setLocation(OffsetUtil.getMapBarAddr(Float.parseFloat(offset[1]+"")+"", Float.parseFloat(offset[0]+"")+""));
			}
		}
		
		model.addAttribute("removeAlarm", removeAlarm);
		
		return "modules/monitoring/removeAlarm/removeAlarmhisdis";
	}

}
