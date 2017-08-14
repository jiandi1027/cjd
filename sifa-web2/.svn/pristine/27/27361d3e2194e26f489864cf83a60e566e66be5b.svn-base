package com.rowell.sifa.web.rewardspunishment;

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
import com.rowell.sifa.commons.shiro.ShiroUser;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.Commend;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.CommendService;
import com.rowell.sifa.service.sys.MxCheckService;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: CommendController  
    * @Description: 表扬 
    * @author yxb  
    * @date 2017年3月23日  
    *
 */
@Controller
@RequestMapping(value="/rewardspunishment/commend")
public class CommendController extends BaseController{
	@Autowired
	private CommendService commendService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private MxCheckService mxCheckService;
	@ModelAttribute("commend")
	public Commend get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return commendService.findById(id);
		}else{
			return new Commend();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Commend commend, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		return "modules/rewardspunishment/commend/commendList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST) 
	@ResponseBody
	public EUDataGridResult list(Commend commend,String name,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(commend.getGroupId())) {
			SysAccount account = SysAccountUtils.getSysAccount();
			commend.setGroupId(account.getGroupId());
		}
		if (StringUtils.isBlank(commend.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(commend.getOrderStr());
		}
		if(!"".equals(name) && name != null){
			commend.setCulpritName(name);
		}
		List<Commend> list = commendService.findAll(commend);
		for(Commend commen:list){
			/*ShiroUser activeUser = SysAccountUtils;
			commen.setRoleId(sysAccount.getRoleId());*/
			if(!StringUtils.isBlank(commen.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(commen);
			}
		}
		PageInfo<Commend> pageInfo = new PageInfo<Commend>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	//跳转到增加页面
	@RequestMapping(value = "add")
	public String forAdd(Commend commend, Model model, HttpServletRequest request) {
		if(commend.getId()!=null && (!"".equals(commend.getId()))){//若id不为空，则为修改
			model.addAttribute("commend", commend);
			//model.addAttribute("culprit", culpritService.findById(revokeProbation.getCulpritId()));
			SysFile record = new SysFile();
			record.setOrderStr("created asc");
			record.setTableId(commend.getId());
			record.setFileType(Constants.FILE_COMMEND_BY_PATH);
			List<SysFile> fileList = sysFileService.findAll(record);
			//System.out.println("添加：fileList："+fileList);
			model.addAttribute("fileList", fileList);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/rewardspunishment/commend/commendForm";
	}
	//保存表扬信息
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Commend commend, HttpServletRequest request, Model model,String decideType) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, commend)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑失败！");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			commend.setDoDate(new Date());
			SysAccount account = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
			//System.out.println("decideType====="+decideType);
			List<SysFile> fileList = getSysFiles();
			if(StringUtils.isBlank(commend.getId())) {
				commendService.insert(commend,request,account.getRoleId(),processDetail);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			}else{
				commendService.updateById(commend);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg(" 编辑成功");
			}
			sysFileService.saveFiles(fileList, Constants.FILE_TABLE_COMMEND, commend.getId(), Constants.FILE_COMMEND_BY_PATH);
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if(StringUtils.isBlank(commend.getId())){
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			}else{
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}
			return commonJsonResult;
		}
	}
	
	//终止流程
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("commend")Commend commend,Model model){
		try {
			ProcessUtils.endProcess("endevent1", commend.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}

	//跳转审批页面
	@RequestMapping("/commendAudit")
	public String commendAudit(@ModelAttribute("commend")Commend commend,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(!StringUtils.isBlank(commend.getProcessInstanceId())){//各部门打分查询
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(commend.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			for(int i=processDetails.size()-1;i>=0;i--){
				ProcessDetail processDetail=processDetails.get(i);
				String dicSorceType=processDetail.getDicSorceType();
				if(Constants.SOCRE_TYPE_XJZK.equals(dicSorceType)){//县矫正科打分
					model.addAttribute("jzksr",processDetail.getOptScore());
					System.out.println("jzksr"+processDetail.getOptScore());
					model.addAttribute("jzkzf",processDetail.getZfScore());
					System.out.println("jzkzf"+processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_XFZK.equals(dicSorceType)){//县法制科打分
					model.addAttribute("fzkzf", processDetail.getZfScore());
					System.out.println("fzkzf"+processDetail.getZfScore());
				}
			}
		}
			//清除未提交评分缓存
				MxCheck mxCheck = new MxCheck();
				mxCheck.setProcessInstanceId(commend.getProcessInstanceId());
				mxCheck.setIsUse(0);
				mxCheck.setDelFlag(0);
				mxCheckService.deleteMore(mxCheck);
				
		ShiroUser activeUser = SysAccountUtils.getPrincipal();
		sysAccount = sysAccountService.findById(activeUser.getId());
		model.addAttribute("sysAccount",sysAccount.getRoleId());
		model.addAttribute("commend", commend);
		//System.out.println(commend);
		model.addAttribute("culprit", culpritService.findById(commend.getCulpritId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(commend.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/rewardspunishment/commend/commendAudit";
	}
	//流程审批阶段
	@RequestMapping("/submitCommendAudit")
	@ResponseBody
	public CommonJsonResult submitCommendAudit(@ModelAttribute("commend")Commend commend,String optScore,String zfScore,String decideType,
			String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			//System.out.println("submitCommendAudit中："+decideType);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			String roleId=sysAccount.getRoleId();
			String dicSorceType=null;
			if(Constants.ROLE_XJZKFZR.equals(roleId)){//县矫正科评分
				dicSorceType=Constants.SOCRE_TYPE_XJZK;
			}else if(Constants.ROLE_XFZKFZR.equals(roleId)){//县法制科评分
				dicSorceType=Constants.SOCRE_TYPE_XFZK;
			}
			processDetail.setDicSorceType(dicSorceType);
			processDetail.setOptScore(optScore);
			processDetail.setZfScore(zfScore);
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			commendService.saveCommenAuditStatus(sysAccount.getRoleId(), commend, processDetail);
			commonJsonResult = CommonJsonResult.ok();
			if("sfsReport".equals(commend.getAuditType())||"jzkReport".equals(commend.getAuditType())){
				commonJsonResult = CommonJsonResult.build(200, "上报成功！");
			}else{
				commonJsonResult = CommonJsonResult.build(200, "审批成功！");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "处理失败！");
			
		}
		return commonJsonResult;
	}
	//流程详情
	@RequestMapping(value = "detail")
	public String detail(Commend commend, Model model) {
		model.addAttribute("commend",commend);
		if(!StringUtils.isBlank(commend.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(commend.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(commend.getProcessInstanceId()).singleResult();
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
				}
			}
		}
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(commend.getId());
		record.setFileType(Constants.FILE_COMMEND_BY_PATH);
		List<SysFile> fileList = sysFileService.findAll(record);
		//System.out.println("详情fieList："+fileList);
		model.addAttribute("fileList", fileList);
		
		model.addAttribute("culprit", culpritService.findById(commend.getCulpritId()));
		return "modules/rewardspunishment/commend/commendDetail";
	}
	//档案返回谈话教育页面
		@RequestMapping(value = "commendDoclist", method = RequestMethod.GET)
		public String commendDoclist(Commend commend, Model model, HttpServletRequest request) {
			model.addAttribute("commend", commend);	
			model.addAttribute("culprit", culpritService.findById(commend.getCulpritId()));
			return "modules/dailymgr/documentManage/rewardspunishment/commendDoc";
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
		public String forProcessDetail(@ModelAttribute("commend") Commend commend, Model model){
			model.addAttribute("commend", commend);
			return "modules/rewardspunishment/commend/commendProcessDetail";
		}
		/**
		 * 删除
		 */
		@RequestMapping(value = "delete")
		@ResponseBody
		public CommonJsonResult batchDelete(Commend commend, RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				commendService.deleteById(commend.getId());
				commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
			}
			return commonJsonResult;
		}

}
