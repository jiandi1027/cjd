package com.rowell.sifa.web.dailymgr;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
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
import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.dailymgr.SpecialArea;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.SpecialAreaService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.web.base.BaseController;
/**
 * 
    * @ClassName: SpecialAreaController  
    * @Description: 进入特定区域管理
    * @author DELL  
    * @date 2017年4月8日  
    *
 */
@Controller
@RequestMapping(value = "/dailymgr/specialArea")
public class SpecialAreaController extends BaseController {
	@Autowired
	private SpecialAreaService specialAreaService;
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private SysDicService sysDicService;
	
	@ModelAttribute("specialArea")
	public SpecialArea get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return specialAreaService.findById(id);
		} else {
			return new SpecialArea();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SpecialArea specialArea, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/dailymgr/specialArea/specialAreaList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(SpecialArea specialArea,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(specialArea.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(specialArea.getOrderStr());
		}

		List<SpecialArea> list = specialAreaService.findAll(specialArea);
		for(SpecialArea specialAreaEntity:list){
			if(!StringUtils.isBlank(specialAreaEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(specialAreaEntity);
			} 
		}
		PageInfo<SpecialArea> pageInfo = new PageInfo<SpecialArea>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	/**
	 * 
	    * @Title: form  
	    * @Description: 增加页面
	    * @param @param SpecialArea
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("specialArea") SpecialArea specialArea, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("SpecialArea", specialArea);
		model.addAttribute("culprit", culpritService.findById(specialArea.getCulpritId()));
		return "modules/dailymgr/specialArea/specialAreaForm";
	}
	
	//保存草稿
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(SpecialArea specialArea, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				if (!beanValidator(model, specialArea)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				if (StringUtils.isBlank(specialArea.getId())) {
					specialAreaService.insert(specialArea);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(specialArea.getId());
					commonJsonResult.setMsg("保存撤销缓刑成功");
				} else {
					specialAreaService.updateByIdSelective(specialArea);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(specialArea.getId());
					commonJsonResult.setMsg("修改撤销缓刑成功");
				}
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				if (StringUtils.isBlank(specialArea.getId())) {
					commonJsonResult = CommonJsonResult.build(505, "保存撤销缓刑失败！");
					commonJsonResult.setIsError(true);
				} else {
					commonJsonResult = CommonJsonResult.build(505, "修改撤销缓刑失败！");
					commonJsonResult.setIsError(true);
				}
				return commonJsonResult;
			}
		}
		
		//删除
		@RequestMapping(value = "delete")
		@ResponseBody
		public CommonJsonResult batchDelete(SpecialArea specialArea, RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				specialAreaService.deleteById(specialArea.getId());
				commonJsonResult = CommonJsonResult.build(200, "删除撤销假释成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "删除撤销假释失败！", true);
			}
			return commonJsonResult;
		}
	
		//详细
		@RequestMapping(value = "detail")
		public String detail(@ModelAttribute("specialArea") SpecialArea specialArea, Model model) {
			model.addAttribute("specialArea", specialArea);
			if(!StringUtils.isBlank(specialArea.getProcessInstanceId())){
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(specialArea.getProcessInstanceId());
				for(ProcessDetail processDetail:processDetails){
					if("1".equals(processDetail.getDicDecideType())||"6".equals(processDetail.getDicDecideType())){
						processDetail.setDicDecideType("同意");
					}else if("2".equals(processDetail.getDicDecideType())){
						processDetail.setDicDecideType("退回");
					}else{
						processDetail.setDicDecideType("不同意");
					}
				}
				model.addAttribute("processDetails",processDetails);
				ProcessInstance processInstance = runtimeService
						.createProcessInstanceQuery()
						.processInstanceId(specialArea.getProcessInstanceId()).singleResult();
				if(processInstance!=null){
					String processDefinitionId = processInstance.getProcessDefinitionId();
					// 将流程定义 id传到页面，用于图形显示
					model.addAttribute("processDefinitionId", processDefinitionId);
				}
			}
			model.addAttribute("culprit", culpritService.findById(specialArea.getCulpritId()));
			return "modules/dailymgr/specialArea/specialAreaDetail";
		}

		/**
		 * 
		    * @Title: submitSpecialArea  
		    * @Description: 流程上报 
		    * @param @param SpecialArea
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return CommonJsonResult    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "submitSpecialArea", method = RequestMethod.GET)
		@ResponseBody
		public CommonJsonResult submitSpecialArea(SpecialArea specialArea, Model model, HttpServletRequest request) {
			
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);//获取当前用户
			String decideType=request.getParameter("decideType");
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
			try {
				if (StringUtils.isBlank(specialArea.getId())) {
					specialAreaService.insert(specialArea);
				} else {
					specialAreaService.updateById(specialArea);
				}
				specialAreaService.submitSpecialArea(sysAccount.getId(), specialArea,processDetail);
				return CommonJsonResult.ok();
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(505, "上报失败");
			}
		}
		
		/**
		 * 跳转至流程审批页面
		    * @Title: outOfPrisonAudit  
		    * @Description: TODO(这里用一句话描述这个方法的作用)  
		    * @param @param SpecialArea
		    * @param @param model
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping("/specialAreaAudit")
		public String outOfPrisonAudit(@ModelAttribute("specialArea")SpecialArea specialArea,Model model){
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("specialArea", specialArea);
			model.addAttribute("culprit", culpritService.findById(specialArea.getCulpritId()));
			return "modules/dailymgr/specialArea/specialAreaAudit";
		}
		
		/**
		 * 
		    * @Title: submitOutOfPrisonAudit  
		    * @Description: 流程处理  
		    * @param @param SpecialArea
		    * @param @param decideType
		    * @param @param opinion
		    * @param @param optScore
		    * @param @param zfScore
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return CommonJsonResult    返回类型  
		    * @throws
		 */
		@RequestMapping("/submitSpecialAreaAudit")
		@ResponseBody
		public CommonJsonResult submitSpecialAreaAudit(@ModelAttribute("specialArea") SpecialArea specialArea,
				String decideType,String opinion,Model model,HttpServletRequest request){
			CommonJsonResult commonJsonResult=null;
			try {
				specialAreaService.updateById(specialArea);
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				ProcessDetail processDetail = new ProcessDetail();
				processDetail.setDicDecideType(decideType);
				processDetail.setOpinion(opinion);
				specialAreaService.submitSpecialAreaAuditStatus(sysAccount.getRoleId(), specialArea, processDetail);
				commonJsonResult = CommonJsonResult.build(200, "流程处理完毕！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "流程处理失败！", true);
			}
			System.out.println("流程处理完毕！");
			return commonJsonResult;
			
		}
		
		//保存建议书
		@RequestMapping(value = "saveBook")
		@ResponseBody
		public CommonJsonResult saveBook(SpecialArea specialArea, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {	
					specialAreaService.updateByIdSelective(specialArea);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(specialArea.getId());
					commonJsonResult.setMsg("保存成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "保存失败！");
					commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}
		
		
		////打印审批表
		@RequestMapping(value = "printShenhe")
		public String printShenhe(@ModelAttribute("specialArea") SpecialArea specialArea, Model model) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("specialArea", specialArea);
			Culprit culprit=culpritService.findById(specialArea.getCulpritId());
			CulpritJudgment culpritJudgment=culprit.getCulpritJudgment();
			model.addAttribute("culprit", culprit);
			model.addAttribute("culpritJudgment", culpritJudgment);
			return "modules/dailymgr/specialArea/print/printSpecialAreaTable";
		}
		
		 /**
		  * 流程终止
		  * 
		  */
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(SpecialArea specialArea,Model model){
			try {
				ProcessUtils.endProcess("endevent1", specialArea.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
			}
		}
		
	
}
