package com.rowell.sifa.web.monitoring;

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
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.monitoring.TerminalActivityService;
import com.rowell.sifa.sys.utils.OffsetUtil;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: LocationhisController
 * @Description: TODO(实时定位Controller)
 * @author pkx
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/locationhis")
public class LocationhisController extends BaseController{
	@Autowired
	private TerminalActivityService terminalActivityService;
	
	@ModelAttribute("terminalActivity")
	public TerminalActivity get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return terminalActivityService.findById(id);
		} else {
			return new TerminalActivity();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(TerminalActivity terminalActivity, Model model, HttpServletRequest request) {
		return "modules/monitoring/locationhis/locationhisList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(TerminalActivity terminalActivity,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(terminalActivity.getGroupId())) {
			terminalActivity.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(terminalActivity.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(terminalActivity.getOrderStr());
		}
		
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		List<TerminalActivity> list = terminalActivityService.findAll(terminalActivity);
		for (TerminalActivity record : list) {
			if (StringUtils.isBlank(record.getLocation())) {
				double[] offset = OffsetUtil.transformGPS2MapABC(record.getLat() , record.getLon());
				record.setLocation(OffsetUtil.getMapBarAddr(offset[1]+"", offset[0]+""));
				
				terminalActivityService.updateByIdSelective(record);
			}
		}
		
		PageInfo<TerminalActivity> pageInfo = new PageInfo<TerminalActivity>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}


	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(@ModelAttribute("terminalActivity")TerminalActivity terminalActivity, Model model, HttpServletRequest request) {

		return "modules/monitoring/locationhis/locationhisDetail";
	}
}
