package com.rowell.sifa.web.endcorrect;

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
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.endcorrect.Death;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.SecurityPunishment;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.DeathService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.service.sys.SysGroupService;
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
	private SysFileService sysFileService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private SysGroupService sysGroupService;
	
	@ModelAttribute("death")
	public Death get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return deathService.findById(id);
		} else {
			return new Death();
		}
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Death death, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("account", sysAccount);
		return "modules/endcorrect/death/deathList";
	}

	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(@ModelAttribute("death")Death death,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(death.getGroupId())) {
			death.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(death.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(death.getOrderStr());
		}
		List<Death> list = deathService.findAll(death);
		for (Death deathEntity : list) {
			if (!StringUtils.isBlank(deathEntity.getProcessInstanceId())) {
				ProcessUtils.fillProcessInfo(deathEntity);
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
				deathService.insertMore(death, getSysFiles());
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				deathService.updateByIdSelective(death);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			}
			
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "保存失败！");
			commonJsonResult.setIsError(true);

			return commonJsonResult;
		}
	}

	@RequestMapping(value = "Delete")
	@ResponseBody
	public CommonJsonResult delete(Death death, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			deathService.deleteById(death.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
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
//			deathService.deleteById(death.getIds().get(0));
			deathService.batchDelete(death.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}

	@RequestMapping("/queryActivityAskLeave")
	public String queryActivityOrder(Model model) throws Exception {
		model.addAttribute("list", deathService.findActivityList());
		return "modules/dailymgr/askLeave/queryActivityList";
	}

	@RequestMapping("/deathAudit")
	public String deathAudit(@ModelAttribute("death") Death death, Model model, String taskId, String orderId,
			String auditType) {
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(death.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
			
		model.addAttribute("death", death);
		return "modules/endcorrect/death/deathAudit";
	}

	@RequestMapping("/activityDeathList")
	public String activityDeathList(Model model, HttpServletRequest request) throws Exception {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("list", deathService.findDeathTaskList(sysAccount.getRoleId()));
		return "modules/endcorrect/death/activityDeathList";
	}

	@RequestMapping("/submitDeathAudit")
	@ResponseBody
	public CommonJsonResult submitDeathAudit(@ModelAttribute("death") Death death, String decideType, String opinion,
			Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		ProcessDetail processDetail = new ProcessDetail();
		processDetail.setDicDecideType(decideType);
		processDetail.setOpinion(opinion);

		deathService.saveDeathAuditStatus(sysAccount.getRoleId(), death, processDetail, true, getSysFiles());
		return CommonJsonResult.build(200, "审批成功！", false);
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
		
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(death.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);

		return "modules/endcorrect/death/deathDetail";
	}
	
	
	/***
	 * 
	    * @Title: forProcessDetail  
	    * @Description: 调整流程详情页面
	    * @param @param askLeave
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "forProcessDetail")
	public String forProcessDetail(@ModelAttribute("death") Death death, Model model){
		model.addAttribute("death", death);
		return "modules/endcorrect/death/deathProcessDetail";
	}

	
	/**
	 * 死亡登记打印界面
	 * @param askLeave
	 * @param model
	 * @return
	 */
	@RequestMapping("/workerPrint")
	public String investigateWorkerPrint(@ModelAttribute("death")Death death, Model model){
		model.addAttribute("death", death);	
		model.addAttribute("culprit", culpritService.findById(death.getCulpritId()));

		return "modules/endcorrect/death/deathWorkerPrint";
	}
	

	
	/**
	 * 打印
	 * @param death
	 * @param model
	 * @return
	 */
	@RequestMapping("/printone")
	public String print1(@ModelAttribute("death")Death death, Model model){
		if (!StringUtils.isBlank(death.getCulpritId())) {
			Culprit culprit = culpritService.findById(death.getCulpritId());
			death.setCulprit(culprit);
		}
		if (!StringUtils.isBlank(death.getGroupId())) {
			SysGroup sysGroup = sysGroupService.findById(death.getGroupId());
			death.setSysGroup(sysGroup);
		}
		model.addAttribute("death", death);
		
		return "modules/endcorrect/death/print/print1";		//社区服刑人员外出证明
	}
	
	
	/**
	 * 打印
	 * @param death
	 * @param model
	 * @return
	 */
	@RequestMapping("/printtwo")
	public String print2(@ModelAttribute("death")Death death, Model model){
		if (!StringUtils.isBlank(death.getCulpritId())) {
			Culprit culprit = culpritService.findById(death.getCulpritId());
			death.setCulprit(culprit);
		}
		if (!StringUtils.isBlank(death.getGroupId())) {
			SysGroup sysGroup = sysGroupService.findById(death.getGroupId());
			death.setSysGroup(sysGroup);
		}
		model.addAttribute("death", death);
		
		return "modules/endcorrect/death/print/print2";		//社区服刑人员外出证明
	}
	
	
	
	
	
	
	
	
	/**
	 * 
	    * @Title: finish
	    * @Description: 提交（流程结束）
	    * @param @param death
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/finish")
	@ResponseBody
	public CommonJsonResult finishInform(Death death,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
		
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			deathService.saveDeathAuditStatus(sysAccount.getRoleId(), death, processDetail,true,null);
			commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
		}
		return commonJsonResult;
	}


	
	
	/**
	 * 
	    * @Title: updateFinshInfo  
	    * @Description: 打印结束更新标识  
	    * @param @param death
	    * @param @param request
	    * @param @param model
	    * @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
		@RequestMapping(value = "updateFinshInfo")
		@ResponseBody
		public CommonJsonResult updateFinshInfo(String id, String isPrintONE,String isPrintTWO) {
			CommonJsonResult commonJsonResult = null;
			try {
				
				Death death=new Death();
				if(!StringUtils.isBlank(id)){
					death.setId(id);
				}
				if(!StringUtils.isBlank(isPrintONE)){
					death.setIsPrintONE(Integer.valueOf(isPrintONE));
				}
				if(!StringUtils.isBlank(isPrintTWO)){
					death.setIsPrintTWO(Integer.valueOf(isPrintTWO));
				}
				
				deathService.updateByIdSelective(death);
				commonJsonResult = CommonJsonResult.build(200, "更新成功！");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				return commonJsonResult = CommonJsonResult.build(505, "更新失败！");
			}
		}
	
	
	
	
	
	
	
	
	
}
