package com.rowell.sifa.web.rewardspunishment;

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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.WarningOral;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.WarningOralService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: verbalWarningController  
    * @Description: 口头警告Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/jiangcheng/verbalWarning")
public class WarningOralController extends BaseController{
	@Autowired
	private WarningOralService warningOralService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("verbalWarning")
	public WarningOral get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return warningOralService.findById(id);
		}else{
			return new WarningOral();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(WarningOral verbalWarning, Model model, HttpServletRequest request) {
		return "modules/assess/verbalWarningList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(WarningOral verbalWarning,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(verbalWarning.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(verbalWarning.getOrderStr());
		}
		List<WarningOral> list = warningOralService.findAll(verbalWarning);
		for(WarningOral warningOral:list){
			if(!StringUtils.isBlank(warningOral.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(warningOral);
			}
		}
		PageInfo<WarningOral> pageInfo = new PageInfo<WarningOral>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
		//跳转到增加页面a
		@RequestMapping(value = "add")
		public String forAdd(WarningOral verbalWarning, Model model, HttpServletRequest request) {
			Culprit culprit=new Culprit();
			culprit.setGroupId("660");
			List<Culprit> culpritList=culpritService.findAll(culprit);
			model.addAttribute("culpritList",culpritList);
			return "modules/assess/verbalWarningAdd";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			WarningOral warningOral=warningOralService.findById(id);
			model.addAttribute("warningOral",warningOral);
			if(!StringUtils.isBlank(warningOral.getProcessInstanceId())){
				model.addAttribute("processDetails", processDetailService.findByProcessInsId(warningOral.getProcessInstanceId()));
			}
			return "modules/assess/verbalWarningDetail";
		}
		

		@RequestMapping(value = { "save"}, method = RequestMethod.POST)
		public String save(WarningOral warningOral, Model model, HttpServletRequest request) {
			warningOralService.saveOrUpdate(warningOral);
			warningOralService.submitWarningOral(warningOral);
			return "modules/assess/verbalWarningList";
		}
		
		@RequestMapping(value = "check", method = RequestMethod.GET)
		public String forCheck(String id, Model model, HttpServletRequest request) {
			WarningOral warningOral=warningOralService.findById(id);
			model.addAttribute("warningOral",warningOral);
			return "modules/assess/verbalWarningCheck";
		}
		
		@RequestMapping(value = { "check"}, method = RequestMethod.POST)
		public String check(WarningOral warningOral, Model model, String opinion,HttpServletRequest request) {
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			if(!StringUtils.isBlank(warningOral.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(warningOral);
			}
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setOpinion(opinion);
			warningOralService.updateByIdSelective(warningOral);
			warningOralService.saveOrderAuditStatus(sysAccount.getRoleId(),warningOral,processDetail);
			return "modules/assess/verbalWarningList";
		}
	
}
