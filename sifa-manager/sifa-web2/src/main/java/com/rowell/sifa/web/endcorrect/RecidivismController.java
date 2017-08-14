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
import com.rowell.sifa.pojo.endcorrect.Recidivism;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.RecidivismService;
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
@RequestMapping(value="/endcorrect/recidivism")
public class RecidivismController extends BaseController{
	@Autowired
	private RecidivismService recidivismService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("recidivism")
	public Recidivism get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return recidivismService.findById(id);
		}else{
			return new Recidivism();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Recidivism recidivism, Model model, HttpServletRequest request) {
		return "modules/endcorrect/recidivism/recidivismList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Recidivism recidivism,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(recidivism.getGroupId())){
			recidivism.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(recidivism.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(recidivism.getOrderStr());
		}
		List<Recidivism> list = recidivismService.findAll(recidivism);
		for(Recidivism recidivismTemp:list){
			if(!StringUtils.isBlank(recidivismTemp.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(recidivismTemp);
			}
		}
		PageInfo<Recidivism> pageInfo = new PageInfo<Recidivism>(list);
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
		public String forAdd(String id, Model model, HttpServletRequest request) {
			Recidivism recidivism=recidivismService.findById(id);
			model.addAttribute("recidivism",recidivism);
			Culprit culprit=culpritService.findById(recidivism.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/recidivism/recidivismAdd";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			Recidivism recidivism=recidivismService.findById(id);
			model.addAttribute("recidivism",recidivism);
			if(!StringUtils.isBlank(recidivism.getProcessInstanceId())){
				model.addAttribute("processDetails", processDetailService.findByProcessInsId(recidivism.getProcessInstanceId()));
			}
			Culprit culprit=culpritService.findById(recidivism.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/recidivism/recidivismDetail";
		}
		

		
		@RequestMapping(value = "check", method = RequestMethod.GET)
		public String forCheck(String id, Model model,String auditType, HttpServletRequest request) {
			Recidivism recidivism=recidivismService.findById(id);
			recidivism.setAuditType(auditType);
			model.addAttribute("recidivism",recidivism);
			Culprit culprit=culpritService.findById(recidivism.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/recidivism/recidivismCheck";
		}
		
	
		@RequestMapping(value = "check")
		@ResponseBody
		public CommonJsonResult check(Recidivism recidivism, String opinion,String dicDecideType,HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, recidivism)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				if(!StringUtils.isBlank(recidivism.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(recidivism);
				}
				ProcessDetail processDetail = new ProcessDetail();
				processDetail.setOpinion(opinion);
				processDetail.setDicDecideType(dicDecideType);
				recidivismService.updateByIdSelective(recidivism);
				recidivismService.saveRecidivismAuditStatus(sysAccount.getRoleId(),recidivism,processDetail);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("审批成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}
		
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(Recidivism recidivism,Model model){
			try {
				ProcessUtils.endProcess("endevent1", recidivism.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
			}
		}
		
		@RequestMapping(value = "forProcessDetail")
		public String forProcessDetail(@ModelAttribute("recidivism") Recidivism recidivism, Model model){
			model.addAttribute("recidivism", recidivism);
			return "modules/endcorrect/recidivism/recidivismProcessDetail";
		}

}
