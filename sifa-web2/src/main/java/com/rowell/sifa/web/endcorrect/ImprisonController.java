package com.rowell.sifa.web.endcorrect;

import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

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
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.Imprison;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.ImprisonService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.SysFileService;
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
	private SysFileService sysFileService;
	
	
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
				//打分明细
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
			SysFile record1 = new SysFile();
			record1.setOrderStr("created asc");
			record1.setTableId(imprison.getId());
			record1.setFileType(Constants.FILE_IMPRISON_JUDGEPATH);
			List<SysFile> fileList1 = sysFileService.findAll(record1);
			model.addAttribute("fileList1", fileList1);
			
			SysFile record2 = new SysFile();
			record2.setOrderStr("created asc");
			record2.setTableId(imprison.getId());
			record2.setFileType(Constants.FILE_IMPRISON_ENDCASEPATH);
			List<SysFile> fileList2 = sysFileService.findAll(record2);
			model.addAttribute("fileList2", fileList2);
			
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
		Culprit culprit=culpritService.findById(imprison.getCulpritId());
		if(imprison.getPeopleCount()==null){
			imprison.setPeopleCount(culprit.getAddressCountry());
		}
		model.addAttribute("imprison", imprison);
		model.addAttribute("culprit", culprit);
		return "modules/endcorrect/imprison/print/printImprisonBook";
	}		
		
		
	//打印审批表
	@RequestMapping(value = "printShenhe")
	public String printShenhe(@ModelAttribute("imprison") Imprison imprison, Model model) {
		if(!StringUtils.isBlank(imprison.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(imprison.getProcessInstanceId());
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
			if(imprison.getImprisonDealResult()!=null){
				Culprit culprit=new Culprit();
				culprit.setId(imprison.getCulpritId());
				if("91401".equals(imprison.getImprisonDealResult())){//完成收监
					culprit.setDicStatusKey(Constants.CULPRIT_STATUS_SJZX);//矫正状态更改为收监执行
				}else if("91402".equals(imprison.getImprisonDealResult())){//在逃
					culprit.setDicStatusKey(Constants.CULPRIT_STATUS_LZJZZZ);//矫正状态更改为漏罪在逃矫正中止
				}else if("91403".equals(imprison.getImprisonDealResult())){//监狱拒收
					culprit.setDicStatusKey(Constants.CULPRIT_STATUS_JZZ);//矫正状态更改为矫正中
				}else if("91404".equals(imprison.getImprisonDealResult())){//死亡
					culprit.setDicStatusKey(Constants.CULPRIT_STATUS_SW);//矫正状态更改为死亡
				}else if("91405".equals(imprison.getImprisonDealResult())){//监狱管理局驳回
					culprit.setDicStatusKey(Constants.CULPRIT_STATUS_JZZ);//矫正状态更改为矫正中
				}
				culpritService.updateByIdSelective(culprit);
			}
			imprisonService.updateByIdSelective(imprison);
			List<SysFile> fileList1=getSysFiles("judge");
			sysFileService.saveFiles(fileList1, Constants.FILE_TABLE_IMPRISON,imprison.getId(), Constants.FILE_IMPRISON_JUDGEPATH);
			List<SysFile> fileList2=getSysFiles("endCase");
			sysFileService.saveFiles(fileList2, Constants.FILE_TABLE_IMPRISON,imprison.getId(), Constants.FILE_IMPRISON_ENDCASEPATH);
			commonJsonResult = CommonJsonResult.build(200, "保存成功！");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "保存失败！");
			commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	
	
	
	
	
}
