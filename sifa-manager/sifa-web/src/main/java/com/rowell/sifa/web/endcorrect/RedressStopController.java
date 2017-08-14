package com.rowell.sifa.web.endcorrect;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.ProcessInstance;
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
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.RedressStop;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.RedressStopService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.web.base.BaseController;

@Controller
@RequestMapping(value = "/endcorrect/redressStop")
public class RedressStopController extends BaseController{
	
	@Autowired
	private RedressStopService redressStopService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private CulpritService culpritService;
	@ModelAttribute("redressStop")
	public RedressStop get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return redressStopService.findById(id);
		} else {
			return new RedressStop();
		}
	}
	
	/**
	 * 跳转到主页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RedressStop redressStop, 
			Model model, HttpServletRequest request) {
		return "modules/endcorrect/redressStop/redressStoplist";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(RedressStop redressStop,
			@RequestParam(value = "culpritId", required = false,defaultValue = "") String culpritId,
			@RequestParam(value = "groupId", required = false,defaultValue = "") String groupId,
			@RequestParam(value = "startTime", required = false,defaultValue = "") Date startTime,
			@RequestParam(value = "endTime", required = false,defaultValue = "") Date endTime,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(redressStop.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(redressStop.getOrderStr());
		}
		List<RedressStop> list = new ArrayList<RedressStop>();
		list = redressStopService.findAll(redressStop);
		if(groupId!=null&&!groupId.equals("")){
			list = new ArrayList<RedressStop>();
				List<Culprit> clist = culpritService.findCulpritBySysAccount(groupId);
				for(Culprit c :clist){
					RedressStop redress = new RedressStop();
					redress.setCulpritId(c.getId());
					List<RedressStop> list1 = redressStopService.findAll(redress);
					if(list1!=null&&list1.size()>0){
						list.add(list1.get(0));
				}
			}
		}
		if(culpritId!=null&&!culpritId.trim().equals("")){
			redressStop.setCulpritId(culpritId);
			 list = redressStopService.findAll(redressStop);
		}
		for (RedressStop red : list) {
			if (red != null) {
				//添加姓名和组织名用于显示
				red = redressStopService.addCulpritToDeath2(red);
			}
			if (!StringUtils.isBlank(red.getProcessInstanceId())) {
						ProcessUtils.fillProcessInfo(red);
			}

		}
		PageInfo<RedressStop> pageInfo = new PageInfo<RedressStop>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	
	/**
	 * 跳转到增加页面
	 * @param RedressStop
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "add")
	public String add(RedressStop redressStop, Model model, HttpServletRequest request) {
		return "modules/endcorrect/redressStop/redressStopAdd";
	}
	/**
	 * 新增记录
	 * @param RedressStop
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(RedressStop redressStop, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, redressStop)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(redressStop.getId())) {
				redressStopService.insert(redressStop);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("新增特殊原因终止矫正成功 ");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(redressStop.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "新增特殊原因终止矫正失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	
//	/**
//	 * 根据id删除特殊情况矫正终止
//	 * 
//	 * @param redressStop
//	 * @param redirectAttributes
//	 * @return
//	 */
//	@RequestMapping(value = "batchDelete")
//	@ResponseBody
//	public CommonJsonResult batchDelete(RedressStop redressStop, RedirectAttributes redirectAttributes) {
//		CommonJsonResult commonJsonResult = null;
//		try {
//			redressStopService.deleteById(redressStop.getIds().get(0));
//			commonJsonResult = CommonJsonResult.build(200, "删除特殊情况矫正终止成功！", false);
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			commonJsonResult = CommonJsonResult.build(505, "删除特殊情况矫正终止失败！", true);
//		}
//		return commonJsonResult;
//	}
	
	/**
	 * 根据id批量删除特殊情况矫正终止
	 * 
	 * @param redressStop
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(RedressStop redressStop, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			redressStopService.batchDelete(redressStop.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除特殊情况矫正终止成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除特殊情况矫正终止失败！", true);
		}
		return commonJsonResult;
	}
	
	/**
	 * 终止流程
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("redressStop")RedressStop redressStop,Model model){
		try {
			ProcessUtils.endProcess("endevent1", redressStop.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	
	
	/**
	 * 跳转到特殊情况矫正终止详情页面
	 * @param redressStop
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("redressStop") RedressStop redressStop, Model model) {
		model.addAttribute("redressStop", redressStop);
		if (!StringUtils.isBlank(redressStop.getProcessInstanceId())) {
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(redressStop.getProcessInstanceId()));
		}

		model.addAttribute("culprit", culpritService.findById(redressStop.getCulpritId()));

		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
				.processInstanceId(redressStop.getProcessInstanceId()).singleResult();
		if (processInstance != null) {
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		return "modules/endcorrect/redressStop/redressStopDetail";
	}
	@RequestMapping("/redressStopAudit")
	public String askLeaveAudit(@ModelAttribute("redressStop") RedressStop redressStop, Model model, String taskId, String orderId,
			String auditType) {
		redressStop = redressStopService.addCulpritToDeath2(redressStop);
		model.addAttribute("redressStop", redressStop);
		return "modules/endcorrect/redressStop/redressStopAudit";
	}
	@RequestMapping("/submitRedressStopAudit")
	public CommonJsonResult askLeaveAudit(@ModelAttribute("redressStop") RedressStop redressStop, String decideType, String opinion, Model model,
			HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			redressStopService.saveredressStopAuditStatus(sysAccount.getRoleId(), redressStop, processDetail);
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("操作成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "操作失败！");
		}
		
		return commonJsonResult;
	}
}
