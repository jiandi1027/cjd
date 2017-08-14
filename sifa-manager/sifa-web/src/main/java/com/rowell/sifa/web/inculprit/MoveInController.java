package com.rowell.sifa.web.inculprit;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.GraphicInfo;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.flowable.engine.repository.ProcessDefinition;
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
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.inculprit.MoveIn;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.inculprit.MoveInService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  矫正对象迁入Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culprit/moveIn")
public class MoveInController extends BaseController {
	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private MoveInService moveInService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	
	@ModelAttribute("moveIn")
	public MoveIn get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return moveInService.findById(id);
		} else {
			return new MoveIn();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 矫正对象迁入跳转页 
	    * @param @param moveIn
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:moveInt:view")
	@RequestMapping(value = "forList", method = RequestMethod.GET)
	public String forList(MoveIn moveIn, Model model, HttpServletRequest request) {
		return "modules/culprit/moveInList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找矫正对象迁入
	    * @param @param moveIn
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(MoveIn moveIn,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(moveIn.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(moveIn.getOrderStr());
		}

		List<MoveIn> list = moveInService.findAll(moveIn);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		for(MoveIn moveInEntity:list){
			
			if(!StringUtils.isBlank(moveInEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(moveInEntity);
			//Task task = taskService.createTaskQuery().taskId(askLeave.getTaskId()).taskAssignee(sysAccount.getRoleId()).singleResult();
//
//			List<Task> tasks = taskService.createTaskQuery().processInstanceId(moveInEntity.getProcessInstanceId()).active().list();  
//	        if(tasks!=null&&tasks.size()>0){
//	        	// 当前运行的结点
//	        	moveInEntity.setActivityName(tasks.get(0).getName());
//	        	 if(tasks.get(0).getAssignee().equals(sysAccount.getRoleId())){
//	        		 moveInEntity.setActivityId(tasks.get(0).getExecutionId());
//	        		 moveInEntity.setActivityName(tasks.get(0).getName());
//	        		 moveInEntity.setTaskId(tasks.get(0).getId());
//	        		 moveInEntity.setAuditType(tasks.get(0).getTaskDefinitionKey());
//	        		 moveInEntity.setProcessDefinitionId(tasks.get(0).getProcessDefinitionId());
//	        	 }
//				
//	        }
//			
				}
	        }

			
		 

		PageInfo<MoveIn> pageInfo = new PageInfo<MoveIn>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	// @RequiresPermissions("sys:moveIn:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("moveIn") MoveIn moveIn, Model model) {

		return "modules/culprit/moveInForm";
	}
	@RequestMapping("/moveInAudit")
	public String moveInAudit(@ModelAttribute("moveIn")MoveIn moveIn,Model model){
		model.addAttribute("moveIn", moveIn);
		return "modules/culprit/moveInAudit";
	}
	
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑矫正对象迁入  
	    * @param @param moveIn
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:moveIn:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(MoveIn moveIn, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, moveIn)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(moveIn.getId())) {
				moveInService.saveOrUpdate(moveIn);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存矫正对象迁入成功");
			} else {
				moveInService.updateByIdSelective(moveIn);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改矫正对象迁入成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(moveIn.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存矫正对象迁入失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改矫正对象迁入失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	@RequestMapping(value = "submitMoveIn", method = RequestMethod.GET)
	@ResponseBody
	public CommonJsonResult submitMoveIn(MoveIn moveIn, Model model, HttpServletRequest request) {
		SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
		moveInService.submitMoveIn(sysAccount.getId(), moveIn);
		return CommonJsonResult.ok();
	}
	@RequestMapping("/submitMoveInAudit")
	public String submitMoveInAudit(@ModelAttribute("moveIn")MoveIn moveIn,String decideType,String opinion, Model model,HttpServletRequest request){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		ProcessDetail processDetail = new ProcessDetail();
		processDetail.setDicDecideType(decideType);
		processDetail.setOpinion(opinion);
		moveInService.saveMoveInAuditStatus(sysAccount.getRoleId(), moveIn, processDetail);
		
		
		return "modules/culprit/moveInList";
	}
			
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除矫正对象迁入  
	    * @param @param moveIn
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:moveIn:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(MoveIn moveIn, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			moveInService.deleteById(moveIn.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除矫正对象迁入成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除矫正对象迁入失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除矫正对象迁入  
	    * @param @param moveIn
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:moveIn:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(MoveIn moveIn, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			moveInService.batchDelete(moveIn.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除矫正对象迁入成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除矫正对象迁入失败！", true);
		}
		return commonJsonResult;
	}


}
