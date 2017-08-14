package com.rowell.sifa.web.endcorrect;

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
import com.rowell.sifa.pojo.endcorrect.FinishRedress;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.FinishRedressService;
import com.rowell.sifa.service.flow.ProcessDetailService;
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
@RequestMapping(value="/endcorrect/finishRedress")
public class FinishRedressController extends BaseController{
	@Autowired
	private FinishRedressService finishRedressService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("finishRedress")
	public FinishRedress get(@RequestParam( value="id",required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return finishRedressService.findById(id);
		}else{
			return new FinishRedress();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(FinishRedress finishRedress, Model model, HttpServletRequest request) {
		return "modules/endcorrect/finishRedress/finishRedressList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(FinishRedress finishRedress,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(finishRedress.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(finishRedress.getOrderStr());
		}
		List<FinishRedress> list = finishRedressService.findAll(finishRedress);
		for(FinishRedress finishRedressTemp:list){
			if(!StringUtils.isBlank(finishRedressTemp.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(finishRedressTemp);
			}
		}
		PageInfo<FinishRedress> pageInfo = new PageInfo<FinishRedress>(list);
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
		public String forAdd(FinishRedress finishRedress, Model model, HttpServletRequest request) {
			return "modules/endcorrect/finishRedress/finishRedressAdd";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			FinishRedress finishRedress=finishRedressService.findById(id);
			model.addAttribute("finishRedress",finishRedress);
			if(!StringUtils.isBlank(finishRedress.getProcessInstanceId())){
				model.addAttribute("processDetails", processDetailService.findByProcessInsId(finishRedress.getProcessInstanceId()));
			}
			Culprit culprit=culpritService.findById(finishRedress.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/finishRedress/finishRedressDetail";
		}
		

		@RequestMapping(value = { "save"}, method = RequestMethod.POST)
		public String save(FinishRedress finishRedress, Model model, HttpServletRequest request) {
			//recidivismPerhapsService.saveOrUpdate(recidivismPerhaps);
			finishRedressService.insert(finishRedress);
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			if(!StringUtils.isBlank(finishRedress.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(finishRedress);
			}
			ProcessDetail processDetail = new ProcessDetail();
			finishRedressService.updateByIdSelective(finishRedress);
			finishRedressService.saveFinishRedressAuditStatus(sysAccount.getRoleId(),finishRedress,processDetail);
			
			return "modules/endcorrect/finishRedress/finishRedressList";
		}
		
		@RequestMapping(value = "check", method = RequestMethod.GET)
		public String forCheck(String id, Model model,String auditType, HttpServletRequest request) {
			FinishRedress finishRedress=finishRedressService.findById(id);
			finishRedress.setAuditType(auditType);
			model.addAttribute("finishRedress",finishRedress);
			Culprit culprit=culpritService.findById(finishRedress.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/finishRedress/finishRedressCheck";
		}
		
		@RequestMapping(value = { "check"}, method = RequestMethod.POST)
		public String check(FinishRedress finishRedress, Model model, String opinion,String dicDecideType,HttpServletRequest request) {
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			if(!StringUtils.isBlank(finishRedress.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(finishRedress);
			}
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setOpinion(opinion);
			processDetail.setDicDecideType(dicDecideType);
			finishRedressService.updateByIdSelective(finishRedress);
			finishRedressService.saveFinishRedressAuditStatus(sysAccount.getRoleId(),finishRedress,processDetail);
			return "modules/endcorrect/finishRedress/finishRedressList";
		}
	
}
