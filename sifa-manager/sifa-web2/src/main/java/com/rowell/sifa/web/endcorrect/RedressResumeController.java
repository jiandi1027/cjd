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
import com.rowell.sifa.pojo.endcorrect.RedressResume;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.RedressResumeService;
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
@RequestMapping(value="/endcorrect/redressResume")
public class RedressResumeController extends BaseController{
	@Autowired
	private RedressResumeService redressResumeService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("redressResume")
	public RedressResume get(@RequestParam( value="id",required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return redressResumeService.findById(id);
		}else{
			return new RedressResume();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RedressResume redressResume, Model model, HttpServletRequest request) {
		return "modules/endcorrect/redressResume/redressResumeList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(RedressResume redressResume,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(redressResume.getGroupId())){
			redressResume.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(redressResume.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(redressResume.getOrderStr());
		}
		List<RedressResume> list = redressResumeService.findAll(redressResume);
		for(RedressResume redressResumeTemp:list){
			if(!StringUtils.isBlank(redressResumeTemp.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(redressResumeTemp);
			}
		}
		PageInfo<RedressResume> pageInfo = new PageInfo<RedressResume>(list);
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
		public String forAdd(RedressResume redressResume, Model model, HttpServletRequest request) {
			return "modules/endcorrect/redressResume/redressResumeAdd";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			RedressResume redressResume=redressResumeService.findById(id);
			model.addAttribute("redressResume",redressResume);
			if(!StringUtils.isBlank(redressResume.getProcessInstanceId())){
				model.addAttribute("processDetails", processDetailService.findByProcessInsId(redressResume.getProcessInstanceId()));
			}
			Culprit culprit=culpritService.findById(redressResume.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/redressResume/redressResumeDetail";
		}

		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(RedressResume redressResume, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, redressResume)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				redressResume.setCreateRole(sysAccount.getRoleId());
				redressResumeService.insert(redressResume);
				if(!StringUtils.isBlank(redressResume.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(redressResume);
				}
				ProcessDetail processDetail = new ProcessDetail();
				redressResumeService.updateByIdSelective(redressResume);
				redressResumeService.saveRedressResumeAuditStatus(sysAccount.getRoleId(),redressResume,processDetail);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				return commonJsonResult;
			}
		}
		
		@RequestMapping(value = "forCheck", method = RequestMethod.GET)
		public String forCheck(String id, Model model,String auditType, HttpServletRequest request) {
			RedressResume redressResume=redressResumeService.findById(id);
			redressResume.setAuditType(auditType);
			model.addAttribute("redressResume",redressResume);
			Culprit culprit=culpritService.findById(redressResume.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/redressResume/redressResumeCheck";
		}
		
		@RequestMapping(value = "check")
		@ResponseBody
		public CommonJsonResult check(RedressResume redressResume, String opinion,String dicDecideType,HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, redressResume)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				if(!StringUtils.isBlank(redressResume.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(redressResume);
				}
				ProcessDetail processDetail = new ProcessDetail();
				processDetail.setOpinion(opinion);
				processDetail.setDicDecideType(dicDecideType);
				redressResumeService.updateByIdSelective(redressResume);
				redressResumeService.saveRedressResumeAuditStatus(sysAccount.getRoleId(),redressResume,processDetail);
				
				String msg="审批成功";
				if(!StringUtils.isBlank(redressResume.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(redressResume);
					if(redressResume.getIsEnd()!=null && redressResume.getIsEnd()==1){
						msg="结束流程";
					}
				}
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg(msg);

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				return commonJsonResult;
			}
		}
		
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(RedressResume redressResume,Model model){
			try {
				ProcessUtils.endProcess("endevent1", redressResume.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
			}
		}
	
		@RequestMapping(value = "forProcessDetail")
		public String forProcessDetail(@ModelAttribute("redressResume") RedressResume redressResume, Model model){
			model.addAttribute("redressResume", redressResume);
			return "modules/endcorrect/redressResume/redressResumeProcessDetail";
		}
}
