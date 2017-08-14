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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: TerminalHistoryController
 * @Description: TODO(历史轨迹Controller)
 * @author fwy
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/terminalHistory")
public class TerminalHistoryController extends BaseController{
	@Autowired
	private TerminalHistoryService terminalHistoryService;
	@Autowired
	private CulpritService culpritService;
	@ModelAttribute("terminalHistory")
	public TerminalHistory get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return terminalHistoryService.findById(id);
		} else {
			return new TerminalHistory();
		}
	}
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(TerminalHistory terminalHistory,
			@RequestParam(value = "mobileNumber", required = false,defaultValue = "") String mobileNumber,
			@RequestParam(value = "startTime", required = false,defaultValue = "") Date startTime,
			@RequestParam(value = "endTime", required = false,defaultValue = "") Date endTime,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(terminalHistory.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(terminalHistory.getOrderStr());
		}
		List<TerminalHistory> list = new ArrayList<TerminalHistory>();
		if(startTime!=null&&endTime!=null){
			list = terminalHistoryService.findHisByTime(startTime,endTime,mobileNumber);
			if(!list.isEmpty()){
				for(TerminalHistory t:list){
					Culprit	culprit = new Culprit();
					culprit.setMobileNumber(t.getMobileNumber());
					culpritService.findAll(culprit);
					t.setCulpritName(culpritService.findAll(culprit).get(0).getName());
		    	}
				for(int j = 0 ;j<list.size();j++){
					for(int i = 0 ;i<list.size()-1;i++){
						TerminalHistory t1 = list.get(i);
						TerminalHistory t2 = list.get(i+1);
						Date d1 = t1.getGpsTime();
						Date d2 = t2.getGpsTime();
						if(d1.before(d2)){
							list.set(i, t2);
							list.set(i+1, t1);
						}
						
					}
				}
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
	@RequestMapping(value = { "findTerminalHistory", " "})
	@ResponseBody
	public TerminalHistory findTerminalHistory(TerminalHistory terminalHistory,
			@RequestParam(value = "id", required = false,defaultValue = "") String id,
			 HttpServletRequest request,
			HttpServletResponse response, Model model) {
		TerminalHistory t= terminalHistoryService.findById(id);
		Culprit	culprit = new Culprit();
		culprit.setMobileNumber(t.getMobileNumber());
		culpritService.findAll(culprit);
		t.setCulpritName(culpritService.findAll(culprit).get(0).getName());
		return t;
	}
}
