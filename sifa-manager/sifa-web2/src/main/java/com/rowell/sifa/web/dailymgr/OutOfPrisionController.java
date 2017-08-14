package com.rowell.sifa.web.dailymgr;

import java.util.Calendar;
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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.dailymgr.OutOfPrison;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.Area;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.OutOfPrisonService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.MxCheckService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName:OutOfPrisionController
    * @Description: 延长监外执行
    * @author DELL  
    * @date 2017年3月30日  
    *
 */
@Controller
@RequestMapping(value = "/dailymgr/outOfPrison")
public class OutOfPrisionController extends BaseController {
	@Autowired
	private OutOfPrisonService outOfPrisonService;
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
	@Autowired
	private AreaService areaService;
	@ModelAttribute("outOfPrison")
	public OutOfPrison get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return outOfPrisonService.findById(id);
		} else {
			return new OutOfPrison();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(OutOfPrison outPrison, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/dailymgr/outOfPrison/outOfPrisonList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(OutOfPrison outOfPrison,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(outOfPrison.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(outOfPrison.getOrderStr());
		}

		List<OutOfPrison> list = outOfPrisonService.findAll(outOfPrison);
		for(OutOfPrison outOfPrisonEntity:list){
			if(!StringUtils.isBlank(outOfPrisonEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(outOfPrisonEntity);
			} 
		}
		PageInfo<OutOfPrison> pageInfo = new PageInfo<OutOfPrison>(list);
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
	    * @param @param outOfPrison
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
		if(outOfPrison.getStartDate()==null){
			outOfPrison.setStartDate(new Date());
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		if(outOfPrison.getId()!=null && (!"".equals(outOfPrison.getId()))){//若id不为空，则为修改
			model.addAttribute("outOfPrison", outOfPrison);
			//model.addAttribute("culprit", culpritService.findById(revokeProbation.getCulpritId()));
			SysFile record1 = new SysFile();
			record1.setOrderStr("created asc");
			record1.setTableId(outOfPrison.getId());
			record1.setFileType(Constants.FILE_OUTOFPRISON_ENDCASEPATH);
			List<SysFile> fileList1 = sysFileService.findAll(record1);
			model.addAttribute("fileList1", fileList1);
			
			SysFile record2 = new SysFile();
			record2.setOrderStr("created asc");
			record2.setTableId(outOfPrison.getId());
			record2.setFileType(Constants.FILE_OUTOFPRISON_NOTEPATH);
			List<SysFile> fileList2 = sysFileService.findAll(record2);
			model.addAttribute("fileList2", fileList2);
		}
		model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
		return "modules/dailymgr/outOfPrison/outOfPrisonForm";
	}
	
	//保存草稿
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(OutOfPrison outOfPrison, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				if (!beanValidator(model, outOfPrison)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				List<SysFile> fileList1=getSysFiles("lawNote");
				List<SysFile> fileList2=getSysFiles("note");
				commonJsonResult=outOfPrisonService.saveOutOfPrison(outOfPrison, fileList1, fileList2);
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				if (StringUtils.isBlank(outOfPrison.getId())) {
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
		public CommonJsonResult batchDelete(OutOfPrison outOfPrison, RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				outOfPrisonService.deleteById(outOfPrison.getId());
				commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
			}
			return commonJsonResult;
		}
	
		//详细
		@RequestMapping(value = "detail")
		public String detail(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
			model.addAttribute("outOfPrison", outOfPrison);
			if(!StringUtils.isBlank(outOfPrison.getProcessInstanceId())){
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(outOfPrison.getProcessInstanceId());
				model.addAttribute("processDetails",processDetails);
				ProcessInstance processInstance = runtimeService
						.createProcessInstanceQuery()
						.processInstanceId(outOfPrison.getProcessInstanceId()).singleResult();
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
			record1.setTableId(outOfPrison.getId());
			record1.setFileType(Constants.FILE_OUTOFPRISON_ENDCASEPATH);
			List<SysFile> fileList1 = sysFileService.findAll(record1);
			model.addAttribute("fileList1", fileList1);
			
			SysFile record2 = new SysFile();
			record2.setOrderStr("created asc");
			record2.setTableId(outOfPrison.getId());
			record2.setFileType(Constants.FILE_OUTOFPRISON_NOTEPATH);
			List<SysFile> fileList2 = sysFileService.findAll(record2);
			model.addAttribute("fileList2", fileList2);
			
			SysFile record3 = new SysFile();
			record3.setOrderStr("created asc");
			record3.setTableId(outOfPrison.getId());
			record3.setFileType(Constants.FILE_OUTOFPRISON_GZCLPATH);
			List<SysFile> fileList3 = sysFileService.findAll(record3);
			model.addAttribute("fileList3", fileList3);
			
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/outOfPrisonDetail";
		}
	
		//保存草稿并上报
		@RequestMapping(value = "preSubmit")
		public String preSubmit(@ModelAttribute("outOfPrison")  OutOfPrison outOfPrison, Model model, HttpServletRequest request) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			String issueTime=outOfPrison.getIssueTime();
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
			Culprit culprit=culpritService.findById(outOfPrison.getCulpritId());
			Area addressPro=areaService.findById(culprit.getAddressProId());
			Area addressCountry=areaService.findById(culprit.getAddressCountryId());
			
			if(outOfPrison.getCourt()==null && addressPro!=null){
				outOfPrison.setCourt(addressPro.getAreaName());
			}if(outOfPrison.getProcuratorate()==null && addressCountry!=null){
				outOfPrison.setProcuratorate(addressCountry.getAreaName());
			}
			if(outOfPrison.getPolice()==null && addressCountry!=null){
				outOfPrison.setPolice(addressCountry.getAreaName());
			}
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("outOfPrison", outOfPrison);
			CulpritJudgment culpritJudgment=culprit.getCulpritJudgment();
			model.addAttribute("culprit", culprit);
			model.addAttribute("culpritJudgment", culpritJudgment);
			return "modules/dailymgr/outOfPrison/print/printOutOfPrisonBook";
		}	
		
		/**
		 * 
		    * @Title: submitOutOfPrison  
		    * @Description: 流程上报 
		    * @param @param outOfPrison
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return CommonJsonResult    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "submitOutOfPrison")
		@ResponseBody
		public CommonJsonResult submitOutOfPrison(OutOfPrison outOfPrison, Model model, HttpServletRequest request,
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
				issueDay = "0" +issueDay;
			}
			String issueTime = issueYear + "," + issueMonth + "," + issueDay;
			outOfPrison.setIssueTime(issueTime);
			outOfPrisonService.updateById(outOfPrison);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
			try {
				outOfPrisonService.submitOutOfPrison(sysAccount.getId(), outOfPrison,processDetail);
				return CommonJsonResult.build(200, "上报成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(505, "上报失败");
			}
		}
		
		/**
		 * 跳转至流程审批页面
		    * @Title: outOfPrisonAudit  
		    * @Description: TODO(这里用一句话描述这个方法的作用)  
		    * @param @param outOfPrison
		    * @param @param model
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping("/outOfPrisonAudit")
		public String outOfPrisonAudit(@ModelAttribute("outOfPrison")OutOfPrison outOfPrison,Model model){
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(!StringUtils.isBlank(outOfPrison.getProcessInstanceId())){//各部门打分查询
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(outOfPrison.getProcessInstanceId());
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
			mxCheck.setProcessInstanceId(outOfPrison.getProcessInstanceId());
			mxCheck.setIsUse(0);
			mxCheck.setDelFlag(0);
			mxCheckService.deleteMore(mxCheck);
			
			
			SysFile record1 = new SysFile();
			record1.setOrderStr("created asc");
			record1.setTableId(outOfPrison.getId());
			record1.setFileType(Constants.FILE_OUTOFPRISON_ENDCASEPATH);
			List<SysFile> fileList1 = sysFileService.findAll(record1);
			model.addAttribute("fileList1", fileList1);
			
			SysFile record2 = new SysFile();
			record2.setOrderStr("created asc");
			record2.setTableId(outOfPrison.getId());
			record2.setFileType(Constants.FILE_OUTOFPRISON_NOTEPATH);
			List<SysFile> fileList2 = sysFileService.findAll(record2);
			model.addAttribute("fileList2", fileList2);
			
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("outOfPrison", outOfPrison);
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/outOfPrisonAudit";
		}
		
		/**
		 * 
		    * @Title: submitOutOfPrisonAudit  
		    * @Description: 流程处理  
		    * @param @param outOfPrison
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
		@RequestMapping("/submitOutOfPrisonAudit")
		@ResponseBody
		public CommonJsonResult submitOutOfPrisonAudit(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison,
				String decideType,String opinion,String optScore,String zfScore,Model model,HttpServletRequest request){
			CommonJsonResult commonJsonResult=null;
			try {
				outOfPrisonService.updateById(outOfPrison);
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				/*if(outOfPrison.getAuditType().equals("xfgCheck") && "97003".equals(outOfPrison.getSubmittionOrgTypeId())&&"1".equals(decideType)){
					decideType="6";
				}*/
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
				outOfPrisonService.submitOutOfPrisonAuditStatus(sysAccount.getRoleId(), outOfPrison, processDetail,fileList);
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
		
		//保存建议书
		@RequestMapping(value = "saveBook")
		@ResponseBody
		public CommonJsonResult saveBook(OutOfPrison outOfPrison, HttpServletRequest request, Model model,
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
					outOfPrison.setIssueTime(issueTime);
					outOfPrisonService.updateByIdSelective(outOfPrison);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(outOfPrison.getId());
					commonJsonResult.setMsg("保存成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "保存失败！");
					commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}
		
		////打印建议表
		@RequestMapping(value = "printJianYi")
		public String printJianYi(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
			String issueTime=outOfPrison.getIssueTime();
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
			Culprit culprit=culpritService.findById(outOfPrison.getCulpritId());
			if(outOfPrison.getCourt()==null){
				outOfPrison.setCourt(areaService.findById(culprit.getAddressProId()).getAreaName());
			}if(outOfPrison.getProcuratorate()==null){
				outOfPrison.setProcuratorate(areaService.findById(culprit.getAddressCountryId()).getAreaName());
			}
			if(outOfPrison.getPolice()==null){
				outOfPrison.setPolice(areaService.findById(culprit.getAddressCountryId()).getAreaName());
			}
			model.addAttribute("outOfPrison", outOfPrison);
			CulpritJudgment culpritJudgment=culprit.getCulpritJudgment();
			model.addAttribute("culprit", culprit);
			model.addAttribute("culpritJudgment", culpritJudgment);
			return "modules/dailymgr/outOfPrison/print/printOutOfPrisonBook1";
		}
		
		////打印审批表
		@RequestMapping(value = "printShenhe")
		public String printShenhe(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
			if(!StringUtils.isBlank(outOfPrison.getProcessInstanceId())){
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(outOfPrison.getProcessInstanceId());
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
			model.addAttribute("outOfPrison", outOfPrison);
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/print/printOutOfPrisonTable";
		}
		
		////打印医学委托书
		@RequestMapping(value = "printYiXue")
		public String printYiXue(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("outOfPrison", outOfPrison);
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/print/printOutOfPrisonYiXue";
		}
		
		//作废
		@RequestMapping(value = "saveFlag")
		@ResponseBody
		public CommonJsonResult saveFlag(OutOfPrison outOfPrison, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {	
					outOfPrison.setDicBlankFlagKey("91601");//作废标记（已作废）
					outOfPrison.setFlagTime(new Date());
					SysAccount sysAccount = SysAccountUtils.getSysAccount();
					outOfPrison.setFlagAccountId(sysAccount.getRoleId());
					outOfPrison.setFlagAccountName(sysAccount.getAccountname());
					outOfPrisonService.updateByIdSelective(outOfPrison);
					ProcessUtils.endProcess("endevent1", outOfPrison.getTaskId());
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setMsg("作废成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "作废失败！");
					commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}
		
		 /**
		  * 流程终止
		  * 
		  */
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(OutOfPrison outOfPrison,Model model){
			try {
				outOfPrison.setDicBlankFlagKey("91601");//作废标记（已作废）
				outOfPrisonService.updateByIdSelective(outOfPrison);
				ProcessUtils.endProcess("endevent1", outOfPrison.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
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
		public String forProcessDetail(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model){
			model.addAttribute("outOfPrison", outOfPrison);
			return "modules/dailymgr/outOfPrison/outOfPrisonProcessDetail";
		}
		
			
		/**
		 * 
		    * @Title: outOfPrisonFinishPrint  
		    * @Description: 县工作人员和市工作人员打印
		    * @param @param revokeProbation
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "outOfPrisonFinishPrint")
		public String outOfPrisonFinishPrint(@ModelAttribute("outOfPrison")OutOfPrison outOfPrison, Model model, HttpServletRequest request) {
			model.addAttribute("outOfPrison", outOfPrison);	
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/outOfPrisonFinishPrint";
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
			public CommonJsonResult updateFinshInfo(String id, String isPrintJYS,String isPrintSHB,String isPrintYiXue) {
				CommonJsonResult commonJsonResult = null;
				try {
					OutOfPrison outOfPrison=new OutOfPrison();
					if(!StringUtils.isBlank(id)){
						outOfPrison.setId(id);
					}
					if(!StringUtils.isBlank(isPrintJYS)){
						outOfPrison.setIsPrintJYS(Integer.valueOf(isPrintJYS));
					}
					if(!StringUtils.isBlank(isPrintSHB)){
						outOfPrison.setIsPrintSHB(Integer.valueOf(isPrintSHB));
					}
					if(!StringUtils.isBlank(isPrintYiXue)){
						outOfPrison.setIsPrintYiXue(Integer.valueOf(isPrintYiXue));
					}
					outOfPrisonService.updateByIdSelective(outOfPrison);
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
			public String inform(@ModelAttribute("outOfPrison")OutOfPrison outOfPrison, Model model, HttpServletRequest request) {
				model.addAttribute("outOfPrison", outOfPrison);	
				model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
				return "modules/dailymgr/outOfPrison/outOfPrisonInform";
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
			public CommonJsonResult finishInform(OutOfPrison outOfPrison,Model model,HttpServletRequest request){
				CommonJsonResult commonJsonResult=null;
				try {
					List<SysFile> fileList=getSysFiles();
					SysAccount sysAccount = SysAccountUtils.getSysAccount();
					ProcessDetail processDetail = new ProcessDetail();
					outOfPrisonService.submitOutOfPrisonAuditStatus(sysAccount.getRoleId(), outOfPrison, processDetail,fileList);
					commonJsonResult = CommonJsonResult.build(200, "提交成功！");
				} catch (Exception e) {
					logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "提交失败！");
				}
				return commonJsonResult;
			}
		
		
	
}
