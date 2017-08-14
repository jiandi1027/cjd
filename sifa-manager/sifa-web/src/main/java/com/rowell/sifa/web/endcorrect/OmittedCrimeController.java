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
import com.rowell.sifa.pojo.endcorrect.OmittedCrime;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.OmittedCrimeService;
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
@RequestMapping(value="/endcorrect/omittedCrime")
public class OmittedCrimeController extends BaseController{
	@Autowired
	private OmittedCrimeService omittedCrimeService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("omittedCrime")
	public OmittedCrime get(@RequestParam( value="id",required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return omittedCrimeService.findById(id);
		}else{
			return new OmittedCrime();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(OmittedCrime omittedCrime, Model model, HttpServletRequest request) {
		return "modules/endcorrect/omittedCrime/omittedCrimeList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(OmittedCrime omittedCrime,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(omittedCrime.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(omittedCrime.getOrderStr());
		}
		List<OmittedCrime> list = omittedCrimeService.findAll(omittedCrime);
		for(OmittedCrime omittedCrimeTemp:list){
			if(!StringUtils.isBlank(omittedCrimeTemp.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(omittedCrimeTemp);
			}
		}
		PageInfo<OmittedCrime> pageInfo = new PageInfo<OmittedCrime>(list);
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
		public String forAdd(OmittedCrime omittedCrime, Model model, HttpServletRequest request) {
			return "modules/endcorrect/omittedCrime/omittedCrimeAdd";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			OmittedCrime omittedCrime=omittedCrimeService.findById(id);
			model.addAttribute("omittedCrime",omittedCrime);
			if(!StringUtils.isBlank(omittedCrime.getProcessInstanceId())){
				model.addAttribute("processDetails", processDetailService.findByProcessInsId(omittedCrime.getProcessInstanceId()));
			}
			Culprit culprit=culpritService.findById(omittedCrime.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/omittedCrime/omittedCrimeDetail";
		}
		

		@RequestMapping(value = { "save"}, method = RequestMethod.POST)
		public String save(OmittedCrime omittedCrime, Model model, HttpServletRequest request) {
			//recidivismPerhapsService.saveOrUpdate(recidivismPerhaps);
			omittedCrimeService.insert(omittedCrime);
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			if(!StringUtils.isBlank(omittedCrime.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(omittedCrime);
			}
			ProcessDetail processDetail = new ProcessDetail();
			omittedCrimeService.updateByIdSelective(omittedCrime);
			omittedCrimeService.saveOmittedCrimeAuditStatus(sysAccount.getRoleId(),omittedCrime,processDetail);
			
			return "modules/endcorrect/omittedCrime/omittedCrimeList";
		}
		
		@RequestMapping(value = "check", method = RequestMethod.GET)
		public String forCheck(String id, Model model,String auditType, HttpServletRequest request) {
			OmittedCrime omittedCrime=omittedCrimeService.findById(id);
			omittedCrime.setAuditType(auditType);
			model.addAttribute("omittedCrime",omittedCrime);
			Culprit culprit=culpritService.findById(omittedCrime.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/omittedCrime/omittedCrimeCheck";
		}
		
		@RequestMapping(value = { "check"}, method = RequestMethod.POST)
		public String check(OmittedCrime omittedCrime, Model model, String opinion,String dicDecideType,HttpServletRequest request) {
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			if(!StringUtils.isBlank(omittedCrime.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(omittedCrime);
			}
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setOpinion(opinion);
			processDetail.setDicDecideType(dicDecideType);
			omittedCrimeService.updateByIdSelective(omittedCrime);
			omittedCrimeService.saveOmittedCrimeAuditStatus(sysAccount.getRoleId(),omittedCrime,processDetail);
			return "modules/endcorrect/omittedCrime/omittedCrimeList";
		}
	
}
