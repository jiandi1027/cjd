package com.rowell.sifa.web.monitoring;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.TaskService;
import org.flowable.engine.task.Task;
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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.monitoring.TerminalActivityService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: TerminalActivityController
 * @Description: TODO(实时定位Controller)
 * @author fwy
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/terminalActivity")
public class TerminalActivityController extends BaseController{
	@Autowired
	private TerminalActivityService terminalActivityService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private TerminalService terminalService;
	
	
	@ModelAttribute("culprit")
	public Culprit get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritService.findById(id);
		} else {
			return new Culprit();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(TerminalActivity terminalActivity, Model model, HttpServletRequest request) {
		return "modules/monitoring/terminalList";
	}
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test(TerminalActivity terminalActivity, Model model, HttpServletRequest request) {
		return "modules/monitoring/test";
	}
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Terminal terminal,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(terminal.getGroupId())) {
			terminal.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(terminal.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(terminal.getOrderStr());
		}
		
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		/*List<Culprit> list = culpritService.findCulpritBySysAccount(sysAccount.getGroupId()+"");*/
		List<Terminal> list = terminalService.findAll(terminal);
		PageInfo<Terminal> pageInfo = new PageInfo<Terminal>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	@RequestMapping(value = { "findTerminalActivity", "" })
	@ResponseBody
	public TerminalActivity findTerminalActivity(TerminalActivity terminalActivity,
			@RequestParam(value = "mobileNumber", required = false) String mobileNumber,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(mobileNumber!=null&&mobileNumber!=""){
			terminalActivity.setMobileNumber(mobileNumber);
			List<TerminalActivity> list = terminalActivityService.findAll(terminalActivity);
			terminalActivity=list.get(0);
			return terminalActivity;
		}else{
			return null;
		}
		
	}

	
}
