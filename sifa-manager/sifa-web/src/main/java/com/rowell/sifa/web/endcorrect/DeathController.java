package com.rowell.sifa.web.endcorrect;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.endcorrect.Death;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.DeathService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: DeathController
 * @Description: TODO(死亡登记Controller)
 * @author fwy
 * @date 2017年3月20日
 */

@Controller
@RequestMapping(value = "/endcorrect/death")
public class DeathController extends BaseController {
	@Autowired
	private DeathService deathService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailService processDetailService;

	@ModelAttribute("death")
	public Death get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return deathService.findById(id);
		} else {
			return new Death();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Death death, 
			Model model, HttpServletRequest request) {
		return "modules/endcorrect/death/deathList";
	}

	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Death death,
			@RequestParam(value = "culpritId", required = false,defaultValue = "") String culpritId,
			@RequestParam(value = "groupId", required = false,defaultValue = "") String groupId,
			@RequestParam(value = "startTime", required = false,defaultValue = "") Date startTime,
			@RequestParam(value = "endTime", required = false,defaultValue = "") Date endTime,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(death.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(death.getOrderStr());
		}
		List<Death> list = new ArrayList<Death>();
		list = deathService.findAll(death);
		if(groupId!=null&&!groupId.equals("")){
			list = new ArrayList<Death>();
				List<Culprit> clist = culpritService.findCulpritBySysAccount(groupId);
				for(Culprit c :clist){
					Death dea = new Death();
					dea.setCulpritId(c.getId());
					List<Death> list1 = deathService.findAll(dea);
					if(list1!=null&&list1.size()>0){
						list.add(list1.get(0));
				}
			}
		}
		if(culpritId!=null&&!culpritId.trim().equals("")){
			death.setCulpritId(culpritId);
			 list = deathService.findAll(death);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		for (Death deathEntity : list) {
			if (deathEntity != null) {
				deathService.addCulpritToDeath2(deathEntity);
			}
			if (!StringUtils.isBlank(deathEntity.getProcessInstanceId())) {
				List<Task> tasks = taskService.createTaskQuery().processInstanceId(deathEntity.getProcessInstanceId())
						.active().list();
				if (tasks != null && tasks.size() > 0) {
					// 当前运行的结点
					deathEntity.setActivityName(tasks.get(0).getName());
					if (tasks.get(0).getAssignee().equals(sysAccount.getRoleId())) {
						ProcessUtils.fillProcessInfo(deathEntity);
					}

				}

			}

		}
		PageInfo<Death> pageInfo = new PageInfo<Death>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Death death, RedirectAttributes redirectAttributes) {
		 return "modules/endcorrect/death/deathAdd";
	}

	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Death death, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, death)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(death.getId())) {
				deathService.insert(death);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("新增死亡登记成功");
			} else {
				deathService.updateByIdSelective(death);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改死亡登记成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(death.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存死亡登记失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改死亡登记失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}

	@RequestMapping(value = "Delete")
	@ResponseBody
	public CommonJsonResult delete(Death death, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			deathService.deleteById(death.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除死亡登记成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除死亡登记失败！", true);
		}
		return commonJsonResult;
	}

	/**
	 * 根据id集合删除多个死亡登记
	 * 
	 * @param death
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Death death, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			System.out.println(death.getIds().get(0));
			deathService.deleteById(death.getIds().get(0));
			deathService.batchDelete(death.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除死亡登记成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除死亡登记失败！", true);
		}
		return commonJsonResult;
	}

	/*
	 * @RequestMapping(value = "submitDeath", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public CommonJsonResult submitDeath(Death death, Model
	 * model, HttpServletRequest request) { SysAccount sysAccount =
	 * (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
	 * deathService.submitDeath(sysAccount.getId(), death); return
	 * CommonJsonResult.ok(); }
	 */
	@RequestMapping("/queryActivityAskLeave")
	public String queryActivityOrder(Model model) throws Exception {
		model.addAttribute("list", deathService.findActivityList());
		return "modules/dailymgr/askLeave/queryActivityList";
	}

	@RequestMapping("/deathAudit")
	public String askLeaveAudit(@ModelAttribute("death") Death death, Model model, String taskId, String orderId,
			String auditType) {
		death = deathService.addCulpritToDeath2(death);
		model.addAttribute("death", death);
		return "modules/endcorrect/death/deathAudit";
	}

	@RequestMapping("/activityDeathList")
	public String activityAskLeaveList(Model model, HttpServletRequest request) throws Exception {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("list", deathService.findDeathTaskList(sysAccount.getRoleId()));
		return "modules/endcorrect/death/activityDeathList";
	}

	@RequestMapping("/submitDeathAudit")
	public String askLeaveAudit(@ModelAttribute("death") Death death, String decideType, String opinion, Model model,
			HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		ProcessDetail processDetail = new ProcessDetail();
		processDetail.setDicDecideType(decideType);
		processDetail.setOpinion(opinion);
		deathService.saveDeathAuditStatus(sysAccount.getRoleId(), death, processDetail);
		return "modules/endcorrect/death/deathList";
	}

	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("death") Death death, Model model) {
		model.addAttribute("death", death);
		if (!StringUtils.isBlank(death.getProcessInstanceId())) {
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(death.getProcessInstanceId()));
		}

		model.addAttribute("culprit", culpritService.findById(death.getCulpritId()));

		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
				.processInstanceId(death.getProcessInstanceId()).singleResult();
		if (processInstance != null) {
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}

		return "modules/endcorrect/death/deathDetail";
	}
}
