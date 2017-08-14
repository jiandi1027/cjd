package com.rowell.sifa.web.monitoring;

import java.util.ArrayList;
import java.util.Date;
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
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.sys.utils.OffsetUtil;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: TerminalHistoryController
 * @Description: 历史轨迹Controller
 * @author fwy
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/terminalHistory")
public class TerminalHistoryController extends BaseController{
	@Autowired
	private TerminalHistoryService terminalHistoryService;
	
	@ModelAttribute("terminalHistory")
	public TerminalHistory get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return terminalHistoryService.findById(id);
		} else {
			return new TerminalHistory();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(TerminalActivity terminalActivity, Model model, HttpServletRequest request,
			@RequestParam(value = "mobileNumber", required = false,defaultValue = "") String mobileNumber) {
		model.addAttribute("mobileNumber", mobileNumber);
		return "modules/monitoring/termianlHisList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(TerminalHistory terminalHistory,
			@RequestParam(value = "mobileNumber", required = false,defaultValue = "") String mobileNumber,
			@RequestParam(value = "startTime", required = false,defaultValue = "") Date startTime,
			@RequestParam(value = "endTime", required = false,defaultValue = "") Date endTime,
			 HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(terminalHistory.getOrderStr())) {
			PageHelper.orderBy("gpstime asc");
		} else {
			PageHelper.orderBy(terminalHistory.getOrderStr());
		}
		List<TerminalHistory> list = new ArrayList<TerminalHistory>();
		if(startTime!=null&&endTime!=null){
			list = terminalHistoryService.findHisByTime(startTime,endTime,mobileNumber);
			if(!list.isEmpty()){
				for(int j = 0 ;j<list.size();j++){
					if(list.get(j).getLat()!=0){
						double[] offset = OffsetUtil.transformGPS2MapABC(list.get(j).getLat(), list.get(j).getLon());
						list.get(j).setLatReal(Float.parseFloat(offset[0]+""));
						list.get(j).setLonReal(Float.parseFloat(offset[1]+""));	
					}else{
						list.remove(j);
						j--;
					}
				}
			}
		}
	

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		return result;
	}
	
	

	@RequestMapping(value = "hislist", method = RequestMethod.GET)
	public String forHisList(TerminalHistory terminalHistory, Model model, HttpServletRequest request,
			@RequestParam(value = "mobileNumber", required = false,defaultValue = "") String mobileNumber) {
		model.addAttribute("mobileNumber", mobileNumber);
		return "modules/monitoring/locationhis/locationhisHisList";
	}

	@RequestMapping(value = { "hislist", "" })
	@ResponseBody
	public EUDataGridResult hislist(TerminalHistory terminalHistory,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			 HttpServletRequest request, HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(terminalHistory.getGroupId())) {
			terminalHistory.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(terminalHistory.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(terminalHistory.getOrderStr());
		}
		List<TerminalHistory> list = terminalHistoryService.findAll(terminalHistory);
		for (TerminalHistory record : list) {
			if (StringUtils.isBlank(record.getLocation())) {
				double[] offset = OffsetUtil.transformGPS2MapABC(record.getLat() , record.getLon());
				record.setLocation(OffsetUtil.getMapBarAddr(offset[1]+"", offset[0]+""));
				
				terminalHistoryService.updateByIdSelective(record);
			}
		}
		
		PageInfo<TerminalHistory> pageInfo = new PageInfo<TerminalHistory>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(@ModelAttribute("terminalHistory")TerminalHistory terminalHistory, Model model, HttpServletRequest request) {
		
		return "modules/monitoring/locationhis/locationhisHisDetail";
	}
	
	
	@RequestMapping(value = { "findTerminalHistory", " "})
	@ResponseBody
	public TerminalHistory findTerminalHistory(TerminalHistory terminalHistory,
			@RequestParam(value = "id", required = false,defaultValue = "") String id,
			 HttpServletRequest request,
			HttpServletResponse response, Model model) {
		TerminalHistory t= terminalHistoryService.findById(id);
		double[] offset = OffsetUtil.transformGPS2MapABC(t.getLat(), t.getLon());
		t.setLatReal(Float.parseFloat(offset[0]+""));
		t.setLonReal(Float.parseFloat(offset[1]+""));
		return t;
	}
	@RequestMapping(value = { "showlocation", " "})
	@ResponseBody
	public String showlocation(
			@RequestParam(value = "latReal", required = false,defaultValue = "") String latReal,
			@RequestParam(value = "lonReal", required = false,defaultValue = "") String lonReal,
			 HttpServletRequest request,
			HttpServletResponse response, Model model){
		//将传过来的mapABC格式转换成GPS格式
		double[] offset = OffsetUtil.transformMapABC2GPS(Double.valueOf(latReal), Double.valueOf(lonReal));
		
		String s = OffsetUtil.getMapBarAddr(offset[1]+"", offset[0]+"");
		return s;
	}
	
	
}
