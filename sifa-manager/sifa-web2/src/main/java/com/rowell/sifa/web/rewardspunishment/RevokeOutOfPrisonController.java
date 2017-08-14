package com.rowell.sifa.web.rewardspunishment;

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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.RevokeOutOfPrison;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.RevokeOutOfPrisonService;
import com.rowell.sifa.service.sys.MxCheckService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName:提请撤销暂予监外执行
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author DELL  
    * @date 2017年3月30日 
    *
 */
@Controller
@RequestMapping(value = "/rewardspunishment/revokeOutOfPrison")
public class RevokeOutOfPrisonController extends BaseController {
	@Autowired
	private RevokeOutOfPrisonService revokeOutOfPrisonService;
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private MxCheckService mxCheckService;//评分
	@Autowired
	private SysFileService sysFileService;

	@ModelAttribute("revokeOutOfPrison")
	public RevokeOutOfPrison get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return revokeOutOfPrisonService.findById(id);
		} else {
			return new RevokeOutOfPrison();
		}
	}
	
	/**
	 * 
	    * @Title: forList  
	    * @Description: get请求跳转页面
	    * @param @param revokeOutPrison
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RevokeOutOfPrison revokeOutPrison, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(RevokeOutOfPrison revokeOutOfPrison,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(revokeOutOfPrison.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(revokeOutOfPrison.getOrderStr());
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if (StringUtils.isBlank(revokeOutOfPrison.getGroupId())) {
			revokeOutOfPrison.setGroupId(sysAccount.getGroupId());
		} 
		List<RevokeOutOfPrison> list = revokeOutOfPrisonService.findAll(revokeOutOfPrison);
		for(RevokeOutOfPrison RevokeOutOfPrisonEntity:list){
			if(!StringUtils.isBlank(RevokeOutOfPrisonEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(RevokeOutOfPrisonEntity);
			} 
		}
		PageInfo<RevokeOutOfPrison> pageInfo = new PageInfo<RevokeOutOfPrison>(list);
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
	    * @Description: 跳转至增加页面  
	    * @param @param RevokeOutOfPrison
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("revokeOutOfPrison") RevokeOutOfPrison revokeOutOfPrison, 
			@RequestParam(value = "isAddFlag", required = false, defaultValue = "1") String isAddFlag, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		if(revokeOutOfPrison.getId()!=null && (!"".equals(revokeOutOfPrison.getId()))){//若id不为空，则为修改
			SysFile record1 = new SysFile();
			record1.setOrderStr("created asc");
			record1.setTableId(revokeOutOfPrison.getId());
			record1.setFileType(Constants.FILE_REVOKE_OUTOFPRISON_ENDCASEPATH);
			List<SysFile> fileList1 = sysFileService.findAll(record1);
			model.addAttribute("fileList1", fileList1);
			
			SysFile record2 = new SysFile();
			record2.setOrderStr("created asc");
			record2.setTableId(revokeOutOfPrison.getId());
			record2.setFileType(Constants.FILE_REVOKE_OUTOFPRISON_NOTEPATH);
			List<SysFile> fileList2 = sysFileService.findAll(record2);
			model.addAttribute("fileList2", fileList2);
		}
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		model.addAttribute("isAddFlag", isAddFlag);
		return "modules/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonForm";
	}
	
	//保存草稿
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(RevokeOutOfPrison revokeOutOfPrison, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, revokeOutOfPrison)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑失败！");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			List<SysFile> fileList1=getSysFiles("endCase");
			List<SysFile> fileList2=getSysFiles("note");
			commonJsonResult=revokeOutOfPrisonService.saveRevokeOutOfPrison(revokeOutOfPrison, fileList1, fileList2);
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(revokeOutOfPrison.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}
			return commonJsonResult;
		}
	}
	
	//删除
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult batchDelete(RevokeOutOfPrison revokeOutOfPrison, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			revokeOutOfPrisonService.deleteById(revokeOutOfPrison.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	
	/**
	 * 
	    * @Title: submitRevokeOutOfPrison  
	    * @Description: 上报 
	    * @param @param RevokeOutOfPrison
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "submitRevokeOutOfPrison")
	@ResponseBody
	public CommonJsonResult submitRevokeOutOfPrison(RevokeOutOfPrison revokeOutOfPrison, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();//获取当前用户
		String decideType=request.getParameter("decideType");
		ProcessDetail processDetail = new ProcessDetail();
		processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
		try {
			if (StringUtils.isBlank(revokeOutOfPrison.getId())) {
				revokeOutOfPrisonService.insert(revokeOutOfPrison);
			} else {
				revokeOutOfPrisonService.updateByIdSelective(revokeOutOfPrison);
			}
			revokeOutOfPrisonService.submitRevokeOutOfPrison(sysAccount.getId(), revokeOutOfPrison,processDetail);
			return CommonJsonResult.build(200, "上报成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(505, "上报失败！");
		}
	}
	/**
	 * 
	    * @Title: RevokeOutOfPrisonAudit  
	    * @Description: 跳转至流程审批页面
	    * @param @param RevokeOutOfPrison
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/revokeOutOfPrisonAudit")
	public String revokeOutOfPrisonAudit(@ModelAttribute("revokeOutOfPrison")RevokeOutOfPrison revokeOutOfPrison,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(!StringUtils.isBlank(revokeOutOfPrison.getProcessInstanceId())){//各部门打分查询
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeOutOfPrison.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			for(int i=processDetails.size()-1;i>=0;i--){
				ProcessDetail processDetail=processDetails.get(i);
				String dicSorceType=processDetail.getDicSorceType();
				if(Constants.SOCRE_TYPE_XJZK.equals(dicSorceType)){//县矫正科打分
					model.addAttribute("jzksr",processDetail.getOptScore());
					model.addAttribute("jzkzf",processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_XFZK.equals(dicSorceType)){//县法制科打分
					model.addAttribute("fzkzf", processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_SJZC.equals(dicSorceType)){//市矫正处打分
					model.addAttribute("jzcsr", processDetail.getOptScore());
					model.addAttribute("jzczf",processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_SFZC.equals(dicSorceType)){//市法制处打分
					model.addAttribute("fzczf",processDetail.getZfScore());
				}
			}
		}
		//清除未提交评分缓存
		MxCheck mxCheck = new MxCheck();
		mxCheck.setProcessInstanceId(revokeOutOfPrison.getProcessInstanceId());
		mxCheck.setIsUse(0);
		mxCheck.setDelFlag(0);
		mxCheckService.deleteMore(mxCheck);
		
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(revokeOutOfPrison.getId());
		record1.setFileType(Constants.FILE_REVOKE_OUTOFPRISON_ENDCASEPATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		
		SysFile record2 = new SysFile();
		record2.setOrderStr("created asc");
		record2.setTableId(revokeOutOfPrison.getId());
		record2.setFileType(Constants.FILE_REVOKE_OUTOFPRISON_NOTEPATH);
		List<SysFile> fileList2 = sysFileService.findAll(record2);
		model.addAttribute("fileList2", fileList2);
		
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonAudit";
	}
	
	
	
	//详细
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("revokeOutOfPrison") RevokeOutOfPrison revokeOutOfPrison, Model model) {
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		if(!StringUtils.isBlank(revokeOutOfPrison.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeOutOfPrison.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(revokeOutOfPrison.getProcessInstanceId()).singleResult();
			if(processInstance!=null){
				String processDefinitionId = processInstance.getProcessDefinitionId();
				// 将流程定义 id传到页面，用于图形显示
				model.addAttribute("processDefinitionId", processDefinitionId);
			}
			for(int i=processDetails.size()-1;i>=0;i--){
				ProcessDetail processDetail=processDetails.get(i);
				String dicSorceType=processDetail.getDicSorceType();
				if(Constants.SOCRE_TYPE_XJZK.equals(dicSorceType)){//县矫正科打分
					model.addAttribute("jzksr",processDetail.getOptScore());
					model.addAttribute("jzkzf",processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_XFZK.equals(dicSorceType)){//县法制科打分
					model.addAttribute("fzkzf", processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_SJZC.equals(dicSorceType)){//市矫正处打分
					model.addAttribute("jzcsr", processDetail.getOptScore());
					model.addAttribute("jzczf",processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_SFZC.equals(dicSorceType)){//市法制处打分
					model.addAttribute("fzczf",processDetail.getZfScore());
				}
			}
			
		}
		
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(revokeOutOfPrison.getId());
		record1.setFileType(Constants.FILE_REVOKE_OUTOFPRISON_ENDCASEPATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		
		SysFile record2 = new SysFile();
		record2.setOrderStr("created asc");
		record2.setTableId(revokeOutOfPrison.getId());
		record2.setFileType(Constants.FILE_REVOKE_OUTOFPRISON_NOTEPATH);
		List<SysFile> fileList2 = sysFileService.findAll(record2);
		model.addAttribute("fileList2", fileList2);
		
		//告知材料
		SysFile record3 = new SysFile();
		record3.setOrderStr("created asc");
		record3.setTableId(revokeOutOfPrison.getId());
		record3.setFileType(Constants.FILE_REVOKE_OUTOFPRISON_GZCLPATH);
		List<SysFile> fileList3 = sysFileService.findAll(record3);
		model.addAttribute("fileList3", fileList3);
		
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonDetail";
	}
	
	//打印《撤销暂予监外执行审核表》
	@RequestMapping(value = "printShenhe")
	public String printShenhe(@ModelAttribute("revokeOutOfPrison") RevokeOutOfPrison revokeOutOfPrison, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		if(!StringUtils.isBlank(revokeOutOfPrison.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeOutOfPrison.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			for(int i=processDetails.size()-1;i>=0;i--){
				ProcessDetail processDetail=processDetails.get(i);
				String auditName=processDetail.getAuditName();
				if("司法所审核".equals(auditName)){
					model.addAttribute("sfsOption",processDetail.getOpinion());
				}
				if("县分管审批".equals(auditName)){//县级
					model.addAttribute("xfgOption",processDetail.getOpinion());
				}
				if("市分管领导".equals(auditName)){//地级
					model.addAttribute("sfgOption",processDetail.getOpinion());
				}
			}
			
		}
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		model.addAttribute("culpritJudgment", culpritService.findById(revokeOutOfPrison.getCulpritId()).getCulpritJudgment());
		return "modules/rewardspunishment/revokeOutOfPrison/print/printRevokeOutOfPrisonTable";
	}
	
	/**
	 * 
	    * @Title: submitRevokeOutOfPrisonAudit  
	    * @Description: 处理审核结果  
	    * @param @param RevokeOutOfPrison
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
	@RequestMapping("/submitRevokeOutOfPrisonAudit")
	@ResponseBody
	public CommonJsonResult submitRevokeOutOfPrisonAudit(@ModelAttribute("revokeOutOfPrison")RevokeOutOfPrison revokeOutOfPrison,
			String decideType,String opinion,String optScore,String zfScore,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
			revokeOutOfPrisonService.updateById(revokeOutOfPrison);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(revokeOutOfPrison.getAuditType().equals("xfgCheck") && "97003".equals(revokeOutOfPrison.getDicSubOrgTypeKey())&&"1".equals(decideType)){
				decideType="6";
			}
			ProcessDetail processDetail = new ProcessDetail();
			String roleId=sysAccount.getRoleId();
			String dicSorceType=null;
			if(Constants.ROLE_XJZKFZR.equals(roleId)){//县矫正科评分
				dicSorceType=Constants.SOCRE_TYPE_XJZK;
			}else if(Constants.ROLE_XFZKFZR.equals(roleId)){//县法制科评分
				dicSorceType=Constants.SOCRE_TYPE_XFZK;
			}else if(Constants.ROLE_SJZCFZR.equals(roleId)){//市矫正处评分
				dicSorceType=Constants.SOCRE_TYPE_SJZC;	
			}else if(Constants.ROLE_SFZCFZR.equals(roleId)){//市法制处评分
				dicSorceType=Constants.SOCRE_TYPE_SFZC;
			}
			processDetail.setDicSorceType(dicSorceType);
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			processDetail.setOptScore(optScore);
			processDetail.setZfScore(zfScore);
			List<SysFile> fileList=null;
			revokeOutOfPrisonService.submitRevokeOutOfPrisonAuditStatus(sysAccount.getRoleId(), revokeOutOfPrison, processDetail,fileList);
			if(Constants.ROLE_SFSGZRY.equals(roleId) || Constants.ROLE_XJZKGZRY.equals(roleId) || Constants.ROLE_SJZCGZRY.equals(roleId) ){//司法所工作人员、县矫正科工作人员、市矫正工作人员处理
				commonJsonResult = CommonJsonResult.build(200, "处理成功！", false);
			}else{
				commonJsonResult = CommonJsonResult.build(200, "审批成功！", false);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "审批失败！", true);
		}
		System.out.println("流程处理完毕！");
		return commonJsonResult;
		
	}
	
	
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(RevokeOutOfPrison revokeOutOfPrison,Model model){
		try {
			ProcessUtils.endProcess("endevent1", revokeOutOfPrison.getTaskId());
			return CommonJsonResult.build(200, "终止成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败！");
		}
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
	public String forProcessDetail(@ModelAttribute("revokeOutOfPrison") RevokeOutOfPrison revokeOutOfPrison, Model model){
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		return "modules/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonProcessDetail";
	}

	
	//档案管理返回页面
	@RequestMapping(value = "revokeOutOfPrisonDoclist")
	public String revokeOutOfPrisonDoclist(@ModelAttribute("revokeOutOfPrison")RevokeOutOfPrison revokeOutOfPrison, Model model, HttpServletRequest request) {
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);	
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/dailymgr/documentManage/rewardspunishment/revokeOutOfPrisonDoc";
	}
	
	/**
	 * 
	    * @Title: revokeOutOfPrisonFinishPrint  
	    * @Description: 县工作人员和市工作人员打印
	    * @param @param revokeProbation
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "revokeOutOfPrisonFinishPrint")
	public String revokeOutOfPrisonFinishPrint(@ModelAttribute("revokeOutOfPrison")RevokeOutOfPrison revokeOutOfPrison, Model model, HttpServletRequest request) {
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);	
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonFinishPrint";
	}
	
	/**
	 * 
	    * @Title: updateFinshInfo  
	    * @Description: 打印结束更新标识  
	    * @param @param revokeProbation
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
		@RequestMapping(value = "updateFinshInfo")
		@ResponseBody
		public CommonJsonResult updateFinshInfo(String id, String isPrintJYS,String isPrintSHB) {
			CommonJsonResult commonJsonResult = null;
			try {
				RevokeOutOfPrison revokeOutOfPrison=new RevokeOutOfPrison();
				if(!StringUtils.isBlank(id)){
					revokeOutOfPrison.setId(id);
				}
				if(!StringUtils.isBlank(isPrintJYS)){
					revokeOutOfPrison.setIsPrintJYS(Integer.valueOf(isPrintJYS));
				}
				if(!StringUtils.isBlank(isPrintSHB)){
					revokeOutOfPrison.setIsPrintSHB(Integer.valueOf(isPrintSHB));
				}
				revokeOutOfPrisonService.updateByIdSelective(revokeOutOfPrison);
				commonJsonResult = CommonJsonResult.build(200, "更新成功！");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				return commonJsonResult = CommonJsonResult.build(505, "更新失败！");
			}
		}
		
		/**
		 * 
		    * @Title: inform  
		    * @Description: 告知
		    * @param @param revokeParole
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "inform")
		public String inform(@ModelAttribute("revokeOutOfPrison")RevokeOutOfPrison revokeOutOfPrison, Model model, HttpServletRequest request) {
			model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);	
			model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
			return "modules/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonInform";
		}
		
		
		/**
		 * 
		    * @Title: finishInform  
		    * @Description: 告知提交（流程结束）
		    * @param @param detached
		    * @param @param decideType
		    * @param @param opinion
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping("/finishInform")
		@ResponseBody
		public CommonJsonResult finishInform(RevokeOutOfPrison revokeOutOfPrison,Model model,HttpServletRequest request){
			CommonJsonResult commonJsonResult=null;
			try {
				List<SysFile> fileList=getSysFiles();
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				ProcessDetail processDetail = new ProcessDetail();
				revokeOutOfPrisonService.submitRevokeOutOfPrisonAuditStatus(sysAccount.getRoleId(), revokeOutOfPrison, processDetail,fileList);
				commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
			}
			return commonJsonResult;
		}
	
	
}
