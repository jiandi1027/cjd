package com.rowell.sifa.web.inculprit;

import java.text.SimpleDateFormat;
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
import com.rowell.sifa.pojo.inculprit.MoveIn;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.inculprit.MoveInService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.service.sys.SysGroupService;
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
	private MoveInService moveInService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private SysAccountService sysAccountService;
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
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
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
		String cedentialsNumber = moveIn.getCedentialsNumber();
		if(!StringUtils.isBlank(cedentialsNumber) && cedentialsNumber.contains("x")){
			moveIn.setCedentialsNumber(cedentialsNumber.replaceAll("x","X"));
		}
		if( moveIn.getStartDate() != null ) {
			String searchEndDate = new SimpleDateFormat("yyyy-MM-dd").format(moveIn.getStartDate()) + " 23:59:59" ;
			try{
				moveIn.setStartDate( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(searchEndDate) ) ;
			}catch (Exception e) {
			}
		}
		if( moveIn.getEndDate() != null ) {
			String searchEndDate1 = new SimpleDateFormat("yyyy-MM-dd").format(moveIn.getEndDate()) + " 23:59:59" ;
			try{
				moveIn.setEndDate( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(searchEndDate1) ) ;
			}catch (Exception e) {
			}
		}
		List<MoveIn> list = moveInService.findAll(moveIn);
		SysAccount account = SysAccountUtils.getSysAccount();
		for(MoveIn moveInEntity:list){
			moveInEntity.setRoled(account.getRoleId());
			SysGroup sysGroup = sysGroupService.findById(moveInEntity.getGroupId());
			moveInEntity.setGroupName(sysGroup.getName());
			if(!StringUtils.isBlank(moveInEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(moveInEntity);
		
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
		if(!StringUtils.isBlank(moveIn.getId())){
			SysFile record = new SysFile();
			record.setOrderStr("created asc");
			record.setTableId(moveIn .getId());
			record.setFileType(Constants.FILE_WARNING_QRGL_PATH);
			List<SysFile> fileList = sysFileService.findAll(record);
			model.addAttribute("fileList", fileList);
		}
		model.addAttribute("moveIn", moveIn);
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
			List<SysFile> fileList = getSysFiles();
			return moveInService.saveMoveIn(moveIn, fileList);
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(moveIn.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	//详情
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("moveIn") MoveIn moveIn, Model model) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		SysGroup sysGroup = sysGroupService.findById(moveIn.getGroupId());
		if(!StringUtils.isBlank(moveIn.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(moveIn.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			//ProcessUtils.fillProcessInfo(moveIn);
			for(int i=processDetails.size()-1;i>=0;i--){
				ProcessDetail processDetail=processDetails.get(i);
				String dicSorceType=processDetail.getDicSorceType();
				if(Constants.SOCRE_TYPE_XJZK.equals(dicSorceType)){//县矫正科打分
					model.addAttribute("jzksr",processDetail.getOptScore());
					model.addAttribute("jzkzf",processDetail.getZfScore());
				}
			}
		}
		moveIn.setGroupName(sysGroup.getName());
		SysAccount sysAccount1=sysAccountService.findById(moveIn.getInvestigatorId1());
		SysAccount sysAccount2=sysAccountService.findById(moveIn.getInvestigatorId2());
		SysAccount sysAccount3=sysAccountService.findById(moveIn.getAssistorId1());
		if(sysAccount1!=null){
			model.addAttribute("investigator1", sysAccount1.getAccountname());
		}
		if(sysAccount2!=null){
			model.addAttribute("investigator2", sysAccount2.getAccountname());
		}if(sysAccount3!=null){
			model.addAttribute("assistorId1", sysAccount3.getAccountname());
		}
		model.addAttribute("moveIn", moveIn);
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(moveIn .getId());
		record.setFileType(Constants.FILE_WARNING_QRGL_PATH);
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(moveIn .getId());
		record1.setFileType(Constants.FILE_MOVEIN_DC_PATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		
		return "modules/culprit/moveInDetail";
	}
	
	
	
	
	@RequestMapping(value = "submitMoveIn")
	@ResponseBody
	public CommonJsonResult submitMoveIn(MoveIn moveIn, Model model, HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;
		SysAccount sysAccount = SysAccountUtils.getSysAccount();//获取当前用户		
		try {
			moveInService.submitMoveIn(sysAccount.getId(), moveIn);
			commonJsonResult = CommonJsonResult.build(200, "指派成功！");
		}catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "指派失败！");
		}
		return commonJsonResult;
	}
	//流程审批
	@RequestMapping(value="submitMoveInAudit" )
	@ResponseBody
	public CommonJsonResult submitMoveInAudit(@ModelAttribute("moveIn") MoveIn moveIn,String decideType,String opinion,String optScore,String zfScore, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		ProcessDetail processDetail = new ProcessDetail();
		String roleId=sysAccount.getRoleId();
		String dicSorceType=null;
		if(Constants.ROLE_XJZKFZR.equals(roleId)){//县矫正科评分
			dicSorceType=Constants.SOCRE_TYPE_XJZK;
		}
		processDetail.setDicSorceType(dicSorceType);
		processDetail.setOptScore(optScore);
		processDetail.setZfScore(zfScore);
		processDetail.setDicDecideType(decideType);
		processDetail.setOpinion(opinion);
		List<SysFile> fileList = getSysFiles();
		try {
			moveInService.saveMoveInAuditStatus(sysAccount.getRoleId(), moveIn, processDetail,fileList);
			if(moveIn.getAuditType().equals("sfsReport") || moveIn.getAuditType().equals("sfsCheck")){
				commonJsonResult = CommonJsonResult.build(200, "上报成功！");
			}else{
				commonJsonResult = CommonJsonResult.build(200, "审批成功！");
			}
			
		}catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "处理失败！");
		}
		return commonJsonResult;
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
			commonJsonResult = CommonJsonResult.build(200, "删除成功！");
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！");
		}
		return commonJsonResult;
	}
	//流程处理页面
	@RequestMapping("moveInSubmitform")
	public String checkMoveIn(@ModelAttribute("moveIn")MoveIn moveIn,Model model){
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		SysGroup sysGroup = sysGroupService.findById(moveIn.getGroupId());
		if(!StringUtils.isBlank(moveIn.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(moveIn.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(moveIn);
		}
		moveIn.setGroupName(sysGroup.getName());
		model.addAttribute("moveIn", moveIn);
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(moveIn .getId());
		record.setFileType(Constants.FILE_WARNING_QRGL_PATH);
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(moveIn .getId());
		record1.setFileType(Constants.FILE_MOVEIN_DC_PATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		return "modules/culprit/moveInSubmitform";
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
	public String forProcessDetail(@ModelAttribute("moveIn")MoveIn moveIn, Model model){
		model.addAttribute("moveIn", moveIn);
		return "modules/culprit/moveInProcessDetail";
	}
	/**
	 * 打印界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/print")
	public String print(@ModelAttribute("moveIn")MoveIn moveIn ,String type,String docPrint,Model model){
		if(!StringUtils.isBlank(moveIn.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(moveIn.getProcessInstanceId());
			for(int i=processDetails.size()-1;i>=0;i--){
				ProcessDetail processDetail=processDetails.get(i);
				String auditName=processDetail.getAuditName();
				if("县分管审批".equals(auditName)){//县级
					model.addAttribute("xfgOption",processDetail.getOpinion());
				}
			}
			
		}
		SysGroup sysGroup = sysGroupService.findById(moveIn.getGroupId());
		SysGroup sysGroup1 = sysGroupService.findById(sysGroup.getParentId());//司法局
		model.addAttribute("sfjGroupName", sysGroup1.getName());
		model.addAttribute("moveIn", moveIn);
		if (type.equals("1")) {//社区服刑人员居住地变更审批表						
			return "modules/culprit/moveInPrint/movePrint";
		}
		if (type.equals("2")) {	//社区服刑人员居住地变更证明（存根）							
			return "modules/culprit/moveInPrint/movePrint1";
		}
		return null;
	}
   @RequestMapping("/diaoCha")
   public String information(MoveIn moveIn, Model model,HttpServletResponse response){
	   ProcessUtils.fillProcessInfo(moveIn);
	   model.addAttribute("moveIn",moveIn);
	   return "modules/culprit/moveInDiaoCha";
   }
	//终止流程
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("moveIn")MoveIn moveIn,Model model){
		try {
			ProcessUtils.endProcess("endevent1", moveIn.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	
	/**
	 * 
	    * @Title: revokeParoleFinishPrint  
	    * @Description: 县工作人员和市工作人员打印
	    * @param @param revokeProbation
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "moveInFinishPrint")
	public String moveInFinishPrint(@ModelAttribute("moveIn")MoveIn moveIn, Model model, HttpServletRequest request) {
		model.addAttribute("moveIn", moveIn);	
		return "modules/culprit/moveInFinishPrint";
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
		public CommonJsonResult updateFinshInfo(String id, String isPrintBGSP,String isPrintBGZM) {
			CommonJsonResult commonJsonResult = null;
			try {
				MoveIn moveIn=new MoveIn();
				if(!StringUtils.isBlank(id)){
					moveIn.setId(id);
				}
				if(!StringUtils.isBlank(isPrintBGSP)){
					moveIn.setIsPrintBGSP(Integer.valueOf(isPrintBGSP));
				}
				if(!StringUtils.isBlank(isPrintBGZM)){
					moveIn.setIsPrintBGZM(Integer.valueOf(isPrintBGZM));
				}
				moveInService.updateByIdSelective(moveIn);
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
		public String inform(@ModelAttribute("moveIn")MoveIn moveIn, Model model, HttpServletRequest request) {
			model.addAttribute("moveIn", moveIn);	
			return "modules/culprit/MoveInInform";
		}
		
	
}
