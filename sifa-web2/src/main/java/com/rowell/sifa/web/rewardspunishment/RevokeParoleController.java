package com.rowell.sifa.web.rewardspunishment;

import java.util.Calendar;
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
import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;
import com.rowell.sifa.pojo.sys.Area;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.ImprisonService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.RevokeParoleService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.MxCheckService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName:提请撤销假释
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author DELL  
    * @date 2017年3月30日  
    *
 */
@Controller
@RequestMapping(value = "/rewardspunishment/revokeParole")
public class RevokeParoleController extends BaseController {
	@Autowired
	private RevokeParoleService revokeParoleService;
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;

	
	@Autowired
	private ImprisonService imprisonService;
	@Autowired
	private MxCheckService mxCheckService;//评分
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private AreaService areaService;
	
	@ModelAttribute("revokeParole")
	public RevokeParole get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return revokeParoleService.findById(id);
		} else {
			return new RevokeParole();
		}
	}
	
	/**
	 * 
	    * @Title: forList  
	    * @Description: get请求跳转页面
	    * @param @param RevokeParole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RevokeParole revokeParole, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/rewardspunishment/revokeParole/revokeParoleList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(RevokeParole revokeParole,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(revokeParole.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(revokeParole.getOrderStr());
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if (StringUtils.isBlank(revokeParole.getGroupId())) {
			revokeParole.setGroupId(sysAccount.getGroupId());
		} 
		List<RevokeParole> list = revokeParoleService.findAll(revokeParole);
		for(RevokeParole RevokeParoleEntity:list){
			if(!StringUtils.isBlank(RevokeParoleEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(RevokeParoleEntity);
			} 
		}
		PageInfo<RevokeParole> pageInfo = new PageInfo<RevokeParole>(list);
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
	    * @param @param RevokeParole
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("revokeParole") RevokeParole revokeParole, 
			@RequestParam(value = "isAddFlag", required = false, defaultValue = "1") String isAddFlag, Model model) {
		if(revokeParole.getId()!=null && (!"".equals(revokeParole.getId()))){//若id不为空，则为修改
			model.addAttribute("revokeParole", revokeParole);
			//model.addAttribute("culprit", culpritService.findById(revokeProbation.getCulpritId()));
			SysFile record1 = new SysFile();
			record1.setOrderStr("created asc");
			record1.setTableId(revokeParole.getId());
			record1.setFileType(Constants.FILE_REVOKE_PAROLE_ENDCASEPATH);
			List<SysFile> fileList1 = sysFileService.findAll(record1);
			model.addAttribute("fileList1", fileList1);
			
			SysFile record2 = new SysFile();
			record2.setOrderStr("created asc");
			record2.setTableId(revokeParole.getId());
			record2.setFileType(Constants.FILE_REVOKE_PAROLE_NOTEPATH);
			List<SysFile> fileList2 = sysFileService.findAll(record2);
			model.addAttribute("fileList2", fileList2);
		}

		model.addAttribute("isAddFlag", isAddFlag);
		return "modules/rewardspunishment/revokeParole/revokeParoleForm";
	}
	
	//保存草稿
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(RevokeParole revokeParole, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, revokeParole)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑失败！");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			List<SysFile> fileList1=getSysFiles("endCase");
			List<SysFile> fileList2=getSysFiles("note");
			commonJsonResult=revokeParoleService.saveRevokeParole(revokeParole, fileList1, fileList2);
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(revokeParole.getId())) {
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
	public CommonJsonResult batchDelete(RevokeParole RevokeParole, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			revokeParoleService.deleteById(RevokeParole.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	
	//详细
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model) {
		model.addAttribute("revokeParole", revokeParole);
		if(!StringUtils.isBlank(revokeParole.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeParole.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(revokeParole.getProcessInstanceId()).singleResult();
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
			record1.setTableId(revokeParole.getId());
			record1.setFileType(Constants.FILE_REVOKE_PAROLE_ENDCASEPATH);
			List<SysFile> fileList1 = sysFileService.findAll(record1);
			model.addAttribute("fileList1", fileList1);
			
			SysFile record2 = new SysFile();
			record2.setOrderStr("created asc");
			record2.setTableId(revokeParole.getId());
			record2.setFileType(Constants.FILE_REVOKE_PAROLE_NOTEPATH);
			List<SysFile> fileList2 = sysFileService.findAll(record2);
			model.addAttribute("fileList2", fileList2);
			
			//告知材料
			SysFile record3 = new SysFile();
			record3.setOrderStr("created asc");
			record3.setTableId(revokeParole.getId());
			record3.setFileType(Constants.FILE_REVOKE_PAROLE_GZCLPATH);
			List<SysFile> fileList3 = sysFileService.findAll(record3);
			model.addAttribute("fileList3", fileList3);
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/rewardspunishment/revokeParole/revokeParoleDetail";
	}
	
	
	//保存草稿并上报
	@RequestMapping(value = "preSubmit")
	public String preSubmit(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		String issueTime=revokeParole.getIssueTime();
		Calendar cal = Calendar.getInstance();
		String issueYear=null;
		String issueMonth=null;
		String issueDay=null;
		if(issueTime!=null){
			issueYear=issueTime.substring(0, 4);
			issueMonth=issueTime.substring(5, 7);
			issueDay=issueTime.substring(8, 10);
		}else{
			issueYear="" + cal.get(Calendar.YEAR);
			issueMonth=((cal.get(Calendar.MONTH) + 1)<10)?"0"+(cal.get(Calendar.MONTH) + 1):""+(cal.get(Calendar.MONTH) + 1);
			issueDay=(cal.get(Calendar.DAY_OF_MONTH)<10)?"0"+cal.get(Calendar.DAY_OF_MONTH):""+cal.get(Calendar.DAY_OF_MONTH);
		}
		model.addAttribute("issueYear", issueYear);
		model.addAttribute("issueMonth", issueMonth);
		model.addAttribute("issueDay", issueDay);
		Culprit culprit=culpritService.findById(revokeParole.getCulpritId());
		Area addressPro=areaService.findById(culprit.getAddressProId());
		Area addressCountry=areaService.findById(culprit.getAddressCountryId());
		if(revokeParole.getCourt()==null && addressPro!=null){
			revokeParole.setCourt(addressPro.getAreaName());
		}if(revokeParole.getProcuratorate()==null && addressCountry!=null){
			revokeParole.setProcuratorate(addressCountry.getAreaName());
		}
		if(revokeParole.getPolice()==null && addressCountry!=null){
			revokeParole.setPolice(addressCountry.getAreaName());
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeParole", revokeParole);
		model.addAttribute("culprit", culprit);
		return "modules/rewardspunishment/revokeParole/print/printRevokeParoleBook";
	}
		
	/**
	 * 
	    * @Title: submitRevokeParole  
	    * @Description: 流程上报
	    * @param @param revokeParole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "submitRevokeParole")
	@ResponseBody
	public CommonJsonResult submitRevokeParole(RevokeParole revokeParole, Model model, HttpServletRequest request,
			String issueYear,String issueMonth,String issueDay,String decideType) {
		Calendar cal = Calendar.getInstance();
		if (issueYear == null || issueYear.length() <= 0) {
			issueYear = "" + cal.get(Calendar.YEAR);
		}
		if (issueMonth == null || issueMonth.length() <= 0) {
			issueMonth = "" + (cal.get(Calendar.MONTH) + 1);
		}
		if (issueMonth.length() == 1) {
			issueMonth = "0" + issueMonth;
		}
		if (issueDay == null || issueDay.length() <= 0) {
			issueDay = "" + cal.get(Calendar.DAY_OF_MONTH);
		}
		if (issueDay.length() == 1) {
			issueDay = "0" + issueDay;
		}
		String issueTime = issueYear + "," + issueMonth + "," + issueDay;
		revokeParole.setIssueTime(issueTime);
		revokeParoleService.updateById(revokeParole);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		ProcessDetail processDetail = new ProcessDetail();
		processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
		try {
			revokeParoleService.submitRevokeParole(sysAccount.getId(), revokeParole,processDetail);
			return CommonJsonResult.build(200, "上报成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(505, "上报失败！");
		}
	}
	
	/**
	 * 
	    * @Title: revokeParoleAudit  
	    * @Description: 跳转至流程审批页面
	    * @param @param revokeParole
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/revokeParoleAudit")
	public String revokeParoleAudit(@ModelAttribute("revokeParole")RevokeParole revokeParole,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(!StringUtils.isBlank(revokeParole.getProcessInstanceId())){//各部门打分查询
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeParole.getProcessInstanceId());
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
		mxCheck.setProcessInstanceId(revokeParole.getProcessInstanceId());
		mxCheck.setIsUse(0);
		mxCheck.setDelFlag(0);
		mxCheckService.deleteMore(mxCheck);
		
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(revokeParole.getId());
		record1.setFileType(Constants.FILE_REVOKE_PAROLE_ENDCASEPATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		
		SysFile record2 = new SysFile();
		record2.setOrderStr("created asc");
		record2.setTableId(revokeParole.getId());
		record2.setFileType(Constants.FILE_REVOKE_PAROLE_NOTEPATH);
		List<SysFile> fileList2 = sysFileService.findAll(record2);
		model.addAttribute("fileList2", fileList2);
		
		
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeParole", revokeParole);
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/rewardspunishment/revokeParole/revokeParoleAudit";
	}
	
	/**
	 * 
	    * @Title: submitRevokeParoleAudit  
	    * @Description:处理流程数据 
	    * @param @param revokeParole
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping("/submitRevokeParoleAudit")
	@ResponseBody
	public CommonJsonResult submitRevokeParoleAudit(@ModelAttribute("revokeParole")RevokeParole revokeParole,
			String decideType,String opinion,String optScore,String zfScore,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
			revokeParoleService.updateById(revokeParole);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(revokeParole.getAuditType().equals("xfgCheck") && "97003".equals(revokeParole.getSubmittionOrgTypeId())&&"1".equals(decideType)){
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
			revokeParoleService.submitRevokeParoleAuditStatus(sysAccount.getRoleId(), revokeParole, processDetail,fileList);
			if(Constants.ROLE_SFSGZRY.equals(roleId) || Constants.ROLE_XJZKGZRY.equals(roleId) || Constants.ROLE_SJZCGZRY.equals(roleId) ){//司法所工作人员、县矫正科工作人员、市矫正工作人员处理
				commonJsonResult = CommonJsonResult.build(200, "处理成功！", false);
			}else{
				commonJsonResult = CommonJsonResult.build(200, "审批成功！", false);
			}
			//流程审批结束时，在imprison插入数据
			if("1007".equals(sysAccount.getRoleId())||"2007".equals(sysAccount.getRoleId())){
				ProcessInstance rpi = SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)//
						.createProcessInstanceQuery()// 创建流程实例查询对象
						.processInstanceId(revokeParole.getProcessInstanceId()).singleResult();
				if (rpi == null) {//流程结束
					imprisonService.insertRevokeParole(revokeParole);
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "审批失败！", true);
		}
		System.out.println("流程处理完毕！");
		return commonJsonResult;
		
	}
	

	
	//保存撤销缓刑建议书
	@RequestMapping(value = "saveBook")
	@ResponseBody
	public CommonJsonResult saveBook(RevokeParole revokeParole, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {	
			String issueYear=request.getParameter("issueYear");
			String issueMonth=request.getParameter("issueMonth");
			String issueDay=request.getParameter("issueDay");
			Calendar cal = Calendar.getInstance();
			if (issueYear == null || issueYear.length() <= 0) {
				issueYear = "" + cal.get(Calendar.YEAR);
			}
			if (issueMonth == null || issueMonth.length() <= 0) {
				issueMonth = "" + (cal.get(Calendar.MONTH) + 1);
			}
			if (issueMonth.length() == 1) {
				issueMonth = "0" + issueMonth;
			}
			if (issueDay == null || issueDay.length() <= 0) {
				issueDay = "" + cal.get(Calendar.DAY_OF_MONTH);
			}
			if (issueDay.length() == 1) {
				issueDay = "0" + issueDay;
			}
				String issueTime=issueYear+","+issueMonth+","+issueDay;
				revokeParole.setIssueTime(issueTime);
				revokeParoleService.updateByIdSelective(revokeParole);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(revokeParole.getId());
				commonJsonResult = CommonJsonResult.build(200, "保存成功！");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	
	
	////打印《撤销缓刑建议书》
	@RequestMapping(value = "printJianYi")
	public String printJianYi(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model) {
		String issueTime=revokeParole.getIssueTime();
		Calendar cal = Calendar.getInstance();
		String issueYear=null;
		String issueMonth=null;
		String issueDay=null;
		if(issueTime!=null){
			issueYear=issueTime.substring(0, 4);
			issueMonth=issueTime.substring(5, 7);
			issueDay=issueTime.substring(8, 10);
		}else{
			issueYear="" + cal.get(Calendar.YEAR);
			issueMonth=((cal.get(Calendar.MONTH) + 1)<10)?"0"+(cal.get(Calendar.MONTH) + 1):""+(cal.get(Calendar.MONTH) + 1);
			issueDay=(cal.get(Calendar.DAY_OF_MONTH)<10)?"0"+cal.get(Calendar.DAY_OF_MONTH):""+cal.get(Calendar.DAY_OF_MONTH);
		}
		model.addAttribute("issueYear", issueYear);
		model.addAttribute("issueMonth", issueMonth);
		model.addAttribute("issueDay", issueDay);
		model.addAttribute("revokeParole", revokeParole);
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/rewardspunishment/revokeParole/print/printRevokeParoleBook1";
	}
	
	
	
	////打印《撤销缓刑审批表》
	@RequestMapping(value = "printShenhe")
	public String printShenhe(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		if(!StringUtils.isBlank(revokeParole.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeParole.getProcessInstanceId());
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
		model.addAttribute("revokeParole", revokeParole);
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/rewardspunishment/revokeParole/print/printRevokeParoleTable";
	}
	
	
	
	 /**
	  * 流程终止
	  * 
	  */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(RevokeParole revokeParole,Model model){
		try {
			ProcessUtils.endProcess("endevent1", revokeParole.getTaskId());
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
	public String forProcessDetail(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model){
		model.addAttribute("revokeParole", revokeParole);
		return "modules/rewardspunishment/revokeParole/revokeParoleProcessDetail";
	}
	
	//档案管理返回页面
	@RequestMapping(value = "revokeParoleDoclist")
	public String revokeParoleDoclist(RevokeParole revokeParole, Model model, HttpServletRequest request) {
		model.addAttribute("revokeParole", revokeParole);	
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/dailymgr/documentManage/rewardspunishment/revokeParoleDoc";
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
	@RequestMapping(value = "revokeParoleFinishPrint")
	public String revokeParoleFinishPrint(@ModelAttribute("revokeParole")RevokeParole revokeParole, Model model, HttpServletRequest request) {
		model.addAttribute("revokeParole", revokeParole);	
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/rewardspunishment/revokeParole/revokeParoleFinishPrint";
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
				RevokeParole revokeParole=new RevokeParole();
				if(!StringUtils.isBlank(id)){
					revokeParole.setId(id);
				}
				if(!StringUtils.isBlank(isPrintJYS)){
					revokeParole.setIsPrintJYS(Integer.valueOf(isPrintJYS));
				}
				if(!StringUtils.isBlank(isPrintSHB)){
					revokeParole.setIsPrintSHB(Integer.valueOf(isPrintSHB));
				}
				revokeParoleService.updateByIdSelective(revokeParole);
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
		public String inform(@ModelAttribute("revokeParole")RevokeParole revokeParole, Model model, HttpServletRequest request) {
			model.addAttribute("revokeParole", revokeParole);	
			model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
			return "modules/rewardspunishment/revokeParole/revokeParoleInform";
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
		public CommonJsonResult finishInform(RevokeParole revokeParole,Model model,HttpServletRequest request){
			CommonJsonResult commonJsonResult=null;
			try {
				List<SysFile> fileList1=getSysFiles();
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				ProcessDetail processDetail = new ProcessDetail();
				revokeParoleService.submitRevokeParoleAuditStatus(sysAccount.getRoleId(), revokeParole, processDetail,fileList1);
				commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
			}
			return commonJsonResult;
		}
	
}
