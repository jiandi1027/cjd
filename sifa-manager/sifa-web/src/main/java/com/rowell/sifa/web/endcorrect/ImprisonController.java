package com.rowell.sifa.web.endcorrect;

import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
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
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.OutOfPrison;
import com.rowell.sifa.pojo.endcorrect.Imprison;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.ImprisonService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: ImprisonController  
    * @Description: 收监执行
    * @author DELL  
    * @date 2017年4月7日  
    *
 */
@Controller
@RequestMapping(value = "/endcorrect/imprison")
public class ImprisonController extends BaseController {
	@Autowired
	private ImprisonService imprisonService;
	
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private SysDicService sysDicService;
	
	
	@ModelAttribute("imprison")
	public Imprison get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return imprisonService.findById(id);
		} else {
			return new Imprison();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Imprison imprison, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/endcorrect/imprison/imprisonList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Imprison imprison,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(imprison.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(imprison.getOrderStr());
		}
		List<Imprison> list = imprisonService.findAll(imprison);
		/*for(Imprison imprisonEntity:list){
			if(!StringUtils.isBlank(imprisonEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(imprisonEntity);
			} 
		}*/
		PageInfo<Imprison> pageInfo = new PageInfo<Imprison>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
	//详细
		@RequestMapping(value = "detail")
		public String detail(@ModelAttribute("imprison") Imprison imprison, Model model) {
			model.addAttribute("imprison", imprison);
			if(!StringUtils.isBlank(imprison.getProcessInstanceId())){
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(imprison.getProcessInstanceId());
				for(ProcessDetail processDetail:processDetails){
					if("1".equals(processDetail.getDicDecideType())||"6".equals(processDetail.getDicDecideType())){
						processDetail.setDicDecideType("同意");
					}else if("2".equals(processDetail.getDicDecideType())){
						processDetail.setDicDecideType("退回");
					}else{
						processDetail.setDicDecideType("不同意");
					}
				}
				model.addAttribute("processDetails",processDetails);
				ProcessInstance processInstance = runtimeService
						.createProcessInstanceQuery()
						.processInstanceId(imprison.getProcessInstanceId()).singleResult();
				if(processInstance!=null){
					String processDefinitionId = processInstance.getProcessDefinitionId();
					// 将流程定义 id传到页面，用于图形显示
					model.addAttribute("processDefinitionId", processDefinitionId);
				}
			}
			model.addAttribute("culprit", culpritService.findById(imprison.getCulpritId()));
			return "modules/endcorrect/imprison/imprisonDetail";
		}
	
	//打印建议书
	@RequestMapping(value = "printJianyi")
	public String printJianyi(@ModelAttribute("imprison")  Imprison imprison, Model model, HttpServletRequest request) {
		Calendar c = Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
		String issueYear = c.get(Calendar.YEAR)+"";    //获取年
		String issueMonth = c.get(Calendar.MONTH) + 1+"";   //获取月份，0表示1月份
		String issueDay = c.get(Calendar.DAY_OF_MONTH)+"";    //获取当前天数
		model.addAttribute("issueYear", issueYear);
		model.addAttribute("issueMonth", issueMonth);
		model.addAttribute("issueDay", issueDay);
		model.addAttribute("imprison", imprison);
		model.addAttribute("culprit", culpritService.findById(imprison.getCulpritId()));
		return "modules/endcorrect/imprison/print/printImprisonBook";
	}		
		
		
	//打印审批表
	@RequestMapping(value = "printShenhe")
	public String printShenhe(@ModelAttribute("imprison") Imprison imprison, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		//model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("imprison", imprison);
		model.addAttribute("culprit", culpritService.findById(imprison.getCulpritId()));
		return "modules/endcorrect/imprison/print/printImPrisonTable";
	}
		
	//保存裁定、收监处理
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Imprison imprison, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, imprison)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			imprisonService.updateByIdSelective(imprison);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "保存失败！");
			commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	
	
	
	
	
}
