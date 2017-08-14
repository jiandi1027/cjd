package com.rowell.sifa.web.monitoring;

import java.util.ArrayList;
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
import com.rowell.sifa.pojo.endcorrect.Death;
import com.rowell.sifa.pojo.monitoring.OverAlarm;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.monitoring.OverAlarmService;
import com.rowell.sifa.service.monitoring.TerminalActivityService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: OverAlarmController
 * @Description: TODO(越界警告Controller)
 * @author fwy
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/overAlarm")
public class OverAlarmController extends BaseController{
	@Autowired
	private TerminalActivityService terminalActivityService;
	@Autowired
	private SysGroupService  sysGroupService;
	@Autowired
	private OverAlarmService overAlarmService;
	@Autowired
	CulpritService culpritService;
	
	@ModelAttribute("OverAlarm")
	public OverAlarm get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return overAlarmService.findById(id);
		} else {
			return new OverAlarm();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(TerminalActivity terminalActivity, Model model, HttpServletRequest request) {
		return "modules/monitoring/overAlarm/overAlarmList";
	}
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test(TerminalActivity terminalActivity, Model model, HttpServletRequest request) {
		return "modules/monitoring/test";
	}
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(OverAlarm overAlarm,
			@RequestParam(value = "culpritId", required = false, defaultValue = "") String culpritId,
			@RequestParam(value = "groupId", required = false, defaultValue = "") String groupId,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(overAlarm.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(overAlarm.getOrderStr());
		}
		List<OverAlarm> list = overAlarmService.findAll(overAlarm);
		if(groupId!=null&&!groupId.equals("")){
			list = new ArrayList<OverAlarm>();
				List<Culprit> clist = culpritService.findCulpritBySysAccount(groupId);
				for(Culprit c :clist){
					OverAlarm ove = new OverAlarm();
					ove.setCulpritId(c.getId());
					List<OverAlarm> list1 = overAlarmService.findAll(ove);
					if(list1!=null&&list1.size()>0){
						list.add(list1.get(0));
				}
			}
		}
		if(culpritId!=null&&!culpritId.trim().equals("")){
			overAlarm.setCulpritId(culpritId);
			 list = overAlarmService.findAll(overAlarm);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		
		for(OverAlarm a :list){
			a = overAlarmService.addCulpritToOverAlarm(a);
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

}
