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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
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
		if(StringUtils.isBlank(finishRedress.getGroupId())){
			finishRedress.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
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
		public String forAdd(String id, Model model, HttpServletRequest request,String culpritId) {
			if(!StringUtils.isBlank(culpritId)){//待处理事项处理需要
				FinishRedress finishRedress1=new FinishRedress();
				finishRedress1.setCulpritId(culpritId);
				model.addAttribute("finishRedress",finishRedress1);
			}else{
				FinishRedress finishRedress=finishRedressService.findById(id);
				model.addAttribute("finishRedress",finishRedress);
			}
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

		
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(FinishRedress finishRedress, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, finishRedress)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				finishRedressService.insert(finishRedress);
				if(!StringUtils.isBlank(finishRedress.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(finishRedress);
				}
				ProcessDetail processDetail = new ProcessDetail();
				if(finishRedress.getId()!=null){
					finishRedressService.saveOrUpdate(finishRedress);
				}else{
					finishRedressService.updateByIdSelective(finishRedress);
				}
				
				finishRedressService.saveFinishRedressAuditStatus(sysAccount.getRoleId(),finishRedress,processDetail);

				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				return commonJsonResult;
			}
		}
		
		@RequestMapping(value = "forCheck", method = RequestMethod.GET)
		public String forCheck(String id, Model model,String auditType, HttpServletRequest request) {
			FinishRedress finishRedress=finishRedressService.findById(id);
			finishRedress.setAuditType(auditType);
			model.addAttribute("finishRedress",finishRedress);
			Culprit culprit=culpritService.findById(finishRedress.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/finishRedress/finishRedressCheck";
		}
		
		
		@RequestMapping(value = "check")
		@ResponseBody
		public CommonJsonResult check(FinishRedress finishRedress, String opinion,String dicDecideType,HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, finishRedress)) {
					commonJsonResult = CommonJsonResult.build(505, "审核数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				if(!StringUtils.isBlank(finishRedress.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(finishRedress);
				}
				ProcessDetail processDetail = new ProcessDetail();
				processDetail.setOpinion(opinion);
				processDetail.setDicDecideType(dicDecideType);
				finishRedressService.updateByIdSelective(finishRedress);
				finishRedressService.saveFinishRedressAuditStatus(sysAccount.getRoleId(),finishRedress,processDetail);
				
				String msg="审批成功";
				
				if(!StringUtils.isBlank(finishRedress.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(finishRedress);
					if(finishRedress.getIsEnd()!=null && finishRedress.getIsEnd()==1){
						Culprit culprit=new Culprit();
						culprit.setId(finishRedress.getCulpritId());
						culprit.setDicStatusKey("13002");
						culpritService.updateByIdSelective(culprit);
						msg="结束流程";
					}
				}
				
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg(msg);

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "审核数据失败");
				return commonJsonResult;
			}
		}
		
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(FinishRedress finishRedress,Model model){
			try {
				ProcessUtils.endProcess("endevent1", finishRedress.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
			}
		}
		
		@RequestMapping(value = "forProcessDetail")
		public String forProcessDetail(@ModelAttribute("finishRedress") FinishRedress finishRedress, Model model){
			model.addAttribute("finishRedress", finishRedress);
			return "modules/endcorrect/finishRedress/finishRedressProcessDetail";
		}
		
		@RequestMapping(value = "qmjdb")
		public String printQmjdb(String finishRedressId, Model model){
			
			if(finishRedressId!=null){
				FinishRedress finishRedress=finishRedressService.findById(finishRedressId);
				model.addAttribute("finishRedress", finishRedress);
				model.addAttribute("culprit", culpritService.findById(finishRedress.getCulpritId()));
			}
			
			return "modules/endcorrect/finishRedress/print/qmjdb";
		}
		
		
		@RequestMapping(value = "jcjzzms")
		public String printJcjzzms(String finishRedressId, Model model){
			
			if(finishRedressId!=null){
				FinishRedress finishRedress=finishRedressService.findById(finishRedressId);
				model.addAttribute("finishRedress", finishRedress);
				model.addAttribute("culprit", culpritService.findById(finishRedress.getCulpritId()));
			}
			
			return "modules/endcorrect/finishRedress/print/jcjzzms";
		}
		
		@RequestMapping(value = "jcsqjzxgs")
		public String printJcsqjzxgs(String finishRedressId, Model model){
			
			if(finishRedressId!=null){
				FinishRedress finishRedress=finishRedressService.findById(finishRedressId);
				model.addAttribute("finishRedress", finishRedress);
				model.addAttribute("culprit", culpritService.findById(finishRedress.getCulpritId()));
			}
			
			return "modules/endcorrect/finishRedress/print/jcsqjzxgs";
		}
		
		
	
		@RequestMapping(value = "jztzs")
		public String printJztzs(String finishRedressId, Model model){
			
			if(finishRedressId!=null){
				FinishRedress finishRedress=finishRedressService.findById(finishRedressId);
				model.addAttribute("finishRedress", finishRedress);
				model.addAttribute("culprit", culpritService.findById(finishRedress.getCulpritId()));
			}
			
			return "modules/endcorrect/finishRedress/print/jztzs";
		}
}
