package com.rowell.sifa.web.dailymgr;

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
import com.rowell.sifa.pojo.dailymgr.SpecialArea;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.Area;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.SpecialAreaService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;
/**
 * 
    * @ClassName: SpecialAreaController  
    * @Description: 进入特定区域管理
    * @author DELL  
    * @date 2017年4月8日  
    *
 */
@Controller
@RequestMapping(value = "/dailymgr/specialArea")
public class SpecialAreaController extends BaseController {
	@Autowired
	private SpecialAreaService specialAreaService;
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private AreaService areaService;
	@Autowired
	private SysFileService sysFileService;
	@ModelAttribute("specialArea")
	public SpecialArea get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return specialAreaService.findById(id);
		} else {
			return new SpecialArea();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SpecialArea specialArea, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/dailymgr/specialArea/specialAreaList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(SpecialArea specialArea,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(specialArea.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(specialArea.getOrderStr());
		}
		
		List<SpecialArea> list = specialAreaService.findAll(specialArea);
		for(SpecialArea specialAreaEntity:list){
			specialAreaService.Areaformate(specialAreaEntity);
			if(!StringUtils.isBlank(specialAreaEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(specialAreaEntity);
			} 
		}
		PageInfo<SpecialArea> pageInfo = new PageInfo<SpecialArea>(list);
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
	    * @param @param SpecialArea
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("specialArea") SpecialArea specialArea, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(specialArea.getApplyDate()==null){
			specialArea.setApplyDate(new Date());
		}
		if(!StringUtils.isBlank(specialArea.getId())){//编辑页面显示具体信息
			String[] flag=specialArea.getArea().split(",");
			String areaProId=flag[0];
			String areaCityId=flag[1];
			String areaCountryId=flag[2];
			String areaStreet=flag[flag.length-1];
			model.addAttribute("areaProId", areaProId);
			model.addAttribute("areaCityId", areaCityId);
			model.addAttribute("areaCountryId", areaCountryId);
			model.addAttribute("areaStreet", areaStreet);
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("SpecialArea", specialArea);
		model.addAttribute("culprit", culpritService.findById(specialArea.getCulpritId()));
		return "modules/dailymgr/specialArea/specialAreaForm";
	}
	
	//保存草稿
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(SpecialArea specialArea, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes,String areaProId,String areaCityId,String areaCountryId,String areaStreet) {
			CommonJsonResult commonJsonResult = null;
			String area=areaProId+","+areaCityId+","+areaCountryId+","+areaStreet;
			specialArea.setArea(area);//进去区域
			try {
				if (!beanValidator(model, specialArea)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑失败！");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				if (StringUtils.isBlank(specialArea.getId())) {
					specialAreaService.insert(specialArea);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(specialArea.getId());
					commonJsonResult.setMsg("保存成功！");
				} else {
					specialAreaService.updateByIdSelective(specialArea);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(specialArea.getId());
					commonJsonResult.setMsg("修改成功！");
				}
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				if (StringUtils.isBlank(specialArea.getId())) {
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
		public CommonJsonResult batchDelete(SpecialArea specialArea, RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				specialAreaService.deleteById(specialArea.getId());
				commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
			}
			return commonJsonResult;
		}
	
		//详细
		@RequestMapping(value = "detail")
		public String detail(@ModelAttribute("specialArea") SpecialArea specialArea, Model model) {
			specialAreaService.Areaformate(specialArea);
			model.addAttribute("specialArea", specialArea);
			if(!StringUtils.isBlank(specialArea.getProcessInstanceId())){
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(specialArea.getProcessInstanceId());
				model.addAttribute("processDetails",processDetails);
				ProcessInstance processInstance = runtimeService
						.createProcessInstanceQuery()
						.processInstanceId(specialArea.getProcessInstanceId()).singleResult();
				if(processInstance!=null){
					String processDefinitionId = processInstance.getProcessDefinitionId();
					// 将流程定义 id传到页面，用于图形显示
					model.addAttribute("processDefinitionId", processDefinitionId);
				}
			}
			SysFile record1 = new SysFile();
			record1.setOrderStr("created asc");
			record1.setTableId(specialArea.getId());
			record1.setFileType(Constants.FILE_SPECIALAREA_GZCLPATH);
			List<SysFile> fileList1 = sysFileService.findAll(record1);
			model.addAttribute("fileList1", fileList1);
			
			model.addAttribute("culprit", culpritService.findById(specialArea.getCulpritId()));
			return "modules/dailymgr/specialArea/specialAreaDetail";
		}

		/**
		 * 
		    * @Title: submitSpecialArea  
		    * @Description: 流程上报 
		    * @param @param SpecialArea
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return CommonJsonResult    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "submitSpecialArea")
		@ResponseBody
		public CommonJsonResult submitSpecialArea(SpecialArea specialArea, Model model, HttpServletRequest request,
				String areaProId,String areaCityId,String areaCountryId,String areaStreet) {
			String area=areaProId+","+areaCityId+","+areaCountryId+","+areaStreet;
			specialArea.setArea(area);//进去区域
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			try {
				if (StringUtils.isBlank(specialArea.getId())) {
					specialAreaService.insert(specialArea);
				} else {
					specialAreaService.updateById(specialArea);
				}
				specialAreaService.submitSpecialArea(sysAccount.getId(), specialArea,processDetail);
				return CommonJsonResult.build(200, "上报成功！");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(505, "上报失败！");
			}
		}
		
		/**
		 * 跳转至流程审批页面
		    * @Title: specialAreaAudit  
		    * @Description: TODO(这里用一句话描述这个方法的作用)  
		    * @param @param SpecialArea
		    * @param @param model
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping("/specialAreaAudit")
		public String specialAreaAuditAudit(@ModelAttribute("specialArea")SpecialArea specialArea,Model model){
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			specialAreaService.Areaformate(specialArea);
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("specialArea", specialArea);
			model.addAttribute("culprit", culpritService.findById(specialArea.getCulpritId()));
			return "modules/dailymgr/specialArea/specialAreaAudit";
		}
		
		/**
		 * 
		    * @Title: submitSpecialAreaAudit  
		    * @Description: 流程处理  
		    * @param @param SpecialArea
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
		@RequestMapping("/submitSpecialAreaAudit")
		@ResponseBody
		public CommonJsonResult submitSpecialAreaAudit(@ModelAttribute("specialArea") SpecialArea specialArea,
				String decideType,String opinion,Model model,HttpServletRequest request){
			CommonJsonResult commonJsonResult=null;
			try {
				specialAreaService.updateById(specialArea);
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				ProcessDetail processDetail = new ProcessDetail();
				processDetail.setDicDecideType(decideType);
				processDetail.setOpinion(opinion);
				List<SysFile> fileList=null;
				specialAreaService.submitSpecialAreaAuditStatus(sysAccount.getRoleId(), specialArea, processDetail,fileList);
				commonJsonResult = CommonJsonResult.build(200, "审批成功！");
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "审批失败！");
			}
			//System.out.println("流程处理完毕！");
			return commonJsonResult;
			
		}
		
		//保存建议书
		@RequestMapping(value = "saveBook")
		@ResponseBody
		public CommonJsonResult saveBook(SpecialArea specialArea, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {	
					specialAreaService.updateByIdSelective(specialArea);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(specialArea.getId());
					commonJsonResult.setMsg("保存成功！");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "保存失败！");
					commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}
		
		
		////打印审批表
		@RequestMapping(value = "printShenhe")
		public String printShenhe(@ModelAttribute("specialArea") SpecialArea specialArea, Model model) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(specialArea.getArea()!=null){
				specialAreaService.Areaformate(specialArea);
			}
			
			if(!StringUtils.isBlank(specialArea.getProcessInstanceId())){
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(specialArea.getProcessInstanceId());
				for(int i=processDetails.size()-1;i>=0;i--){
					ProcessDetail processDetail=processDetails.get(i);
					String auditName=processDetail.getAuditName();
					if("司法所审核".equals(auditName)){
						model.addAttribute("sfsOption",processDetail.getOpinion());
					}
					if("县分管审批".equals(auditName)){//县级
						model.addAttribute("xfgOption",processDetail.getOpinion());
					}
				}
				
			}
			
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("specialArea", specialArea);
			Culprit culprit=culpritService.findById(specialArea.getCulpritId());
			CulpritJudgment culpritJudgment=culprit.getCulpritJudgment();
			model.addAttribute("culprit", culprit);
			model.addAttribute("culpritJudgment", culpritJudgment);
			return "modules/dailymgr/specialArea/print/printSpecialAreaTable";
		}
		
		 /**
		  * 流程终止
		  * 
		  */
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(SpecialArea specialArea,Model model){
			try {
				ProcessUtils.endProcess("endevent1", specialArea.getTaskId());
				return CommonJsonResult.build(200, "终止成功！");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败！");
			}
		}
		
		/**
		 * 
		    * @Title: findAreaByLevel  
		    * @Description: 根据地区等级或者地区上次id查询地区名字
		    * @param @param areaLevel
		    * @param @param areaParent
		    * @param @return    参数  
		    * @return List<Area>    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "findAreaByLevel")
		@ResponseBody
		public List<Area> findAreaByLevel(String areaLevel,String areaParent){
			Area area = new Area();
			area.setAreaLevel(areaLevel);
			area.setAreaParent(areaParent);
			List<Area> list = areaService.findAll(area);
			return list;
		}
		
		/***
		 * 
		    * @Title: forProcessDetail  
		    * @Description: 调整流程详情页面
		    * @param @param specialArea
		    * @param @param model
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "forProcessDetail")
		public String forProcessDetail(@ModelAttribute("specialArea") SpecialArea specialArea, Model model){
			model.addAttribute("specialArea", specialArea);
			return "modules/dailymgr/specialArea/specialAreaProcessDetail";
		}
		
		/**
		 * 
		    * @Title: specialAreaFinishPrint  
		    * @Description: 司法所打印
		    * @param @param revokeProbation
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "specialAreaFinishPrint")
		public String specialAreaFinishPrint(@ModelAttribute("specialArea")SpecialArea specialArea, Model model, HttpServletRequest request) {
			model.addAttribute("specialArea", specialArea);	
			model.addAttribute("culprit", culpritService.findById(specialArea.getCulpritId()));
			return "modules/dailymgr/specialArea/specialAreaFinishPrint";
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
			public CommonJsonResult updateFinshInfo(String id, String isPrintSHB) {
				CommonJsonResult commonJsonResult = null;
				try {
					SpecialArea specialArea=new SpecialArea();
					if(!StringUtils.isBlank(id)){
						specialArea.setId(id);
					}
					if(!StringUtils.isBlank(isPrintSHB)){
						specialArea.setIsPrintSHB(Integer.valueOf(isPrintSHB));
					}
					specialAreaService.updateByIdSelective(specialArea);
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
			public String inform(@ModelAttribute("specialArea")SpecialArea specialArea, Model model, HttpServletRequest request) {
				model.addAttribute("specialArea", specialArea);	
				model.addAttribute("culprit", culpritService.findById(specialArea.getCulpritId()));
				return "modules/dailymgr/specialArea/specialAreaInform";
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
			public CommonJsonResult finishInform(SpecialArea specialArea,Model model,HttpServletRequest request){
				CommonJsonResult commonJsonResult=null;
				try {
					List<SysFile> fileList=getSysFiles();
					SysAccount sysAccount = SysAccountUtils.getSysAccount();
					ProcessDetail processDetail = new ProcessDetail();
					specialAreaService.submitSpecialAreaAuditStatus(sysAccount.getRoleId(), specialArea, processDetail,fileList);
					commonJsonResult = CommonJsonResult.build(200, "提交成功！");
				} catch (Exception e) {
					logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "提交失败！");
				}
				return commonJsonResult;
			}
		
		
}
