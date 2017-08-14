package com.rowell.sifa.web.culpritinfo;
import java.util.Calendar;
import java.util.Date;
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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.culpritinfo.CulpritSupervisor;
import com.rowell.sifa.pojo.culpritinfo.Monitor;
import com.rowell.sifa.pojo.dailymgr.Talk;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.pojo.investigate.Investigate;
import com.rowell.sifa.pojo.rewardspunishment.GradeChange;
import com.rowell.sifa.pojo.sys.Area;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritLawService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.culpritinfo.CulpritSupervisorService;
import com.rowell.sifa.service.culpritinfo.MonitorService;
import com.rowell.sifa.service.dailymgr.DailyReportLastService;
import com.rowell.sifa.service.dailymgr.TalkService;
import com.rowell.sifa.service.inculprit.ExitEntryReportService;
import com.rowell.sifa.service.investigate.InvestigateService;
import com.rowell.sifa.service.rewardspunishment.GradeChangeService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  矫正对象Controller（首次报道）
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/culprit")
public class CulpritController extends BaseController {

	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private AreaService areaService;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private CulpritLawService culpritLawService;
	@Autowired
	private CulpritSupervisorService culpritSupervisorService;
	@Autowired
	private ExitEntryReportService exitEntryReportService;
	@Autowired
	private SysDicService sysDicService;
	@Autowired
	private TalkService talkService;
	@Autowired
	private DailyReportLastService dailyReportLastService;
	@Autowired
	private GradeChangeService gradeChangeService;
	@Autowired
	private InvestigateService investigateService;
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private MonitorService monitorService;
	@ModelAttribute("culprit")
	public Culprit get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritService.findById(id);
		} else {
			return new Culprit();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 矫正对象跳转页 
	    * @param @param culprit
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Culprit culprit, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/culprit/culpritForm";
	}
	/***
	    * @Title: list  
	    * @Description: 查找矫正对象
	    * @param @param culprit
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		if (StringUtils.isBlank(culprit.getGroupId())) {
			culprit.setGroupId(sysAccount.getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}
		if(!StringUtils.isBlank(request.getParameter("q"))){
			culprit.setName(request.getParameter("q"));
		}
		List<Culprit> list = culpritService.findAllByGroupId(culprit);
		Date now=new Date();
		//首次报道中删选本司法所未完成入矫的矫正人员
		for(Culprit c : list){
			/*if(sysAccount.getGroupId().equals(c.getGroupId()) && (Constants.ROLE_SFSGZRY.equals(sysAccount.getRoleId())|| Constants.ROLE_SFSFZR.equals(sysAccount.getRoleId()))){
				c.setHasPermission(1);
			}*/
			//未完成报到中删选逾期未到的
			if(c.getCulpritJudgment()!=null){
				Date limitDate=c.getCulpritJudgment().getLimitDate();
				if(limitDate!=null && c.getFinshInfo() ==0 && !Constants.FIRST_REPORT_TYPE_YQWD.equals(c.getDicFirstReportTypeKey()) ){
					int i = now.compareTo(limitDate); 
					if(i>0){
						c.setDicFirstReportTypeKey(Constants.FIRST_REPORT_TYPE_YQWD);
						culpritService.updateByIdSelective(c);
					}
				}
			}			
		}
		PageInfo<Culprit> pageInfo = new PageInfo<Culprit>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		
		return result;
	}
	
	
	/***
	    * @Title: list 
	    * @Description: 返回矫正对象列表，用于下拉选择
	    * @param @param culprit
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "selectList"})
	@ResponseBody
	public EUDataGridResult selectList(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}
		if(!StringUtils.isBlank(request.getParameter("q"))){
			culprit.setName(request.getParameter("q"));
		}
		culprit.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		List<Culprit> list = culpritService.selectAllSimple(culprit);
		PageInfo<Culprit> pageInfo = new PageInfo<Culprit>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = { "list1", "" })
	@ResponseBody
	public EUDataGridResult list1(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}
		if(!StringUtils.isBlank(request.getParameter("q"))){
			culprit.setName(request.getParameter("q"));
		}

		List<Culprit> list = culpritService.findAll(culprit);
		for(Culprit c : list){
			//性别
			SysDic dicSexKey = sysDicService.findById(c.getDicSexKey());
			c.setDicSexKey(dicSexKey.getValue());
			//文化程度
			SysDic dicWhcdKey = sysDicService.findById(c.getDicWhcdKey());
			c.setDicWhcdKey(dicWhcdKey.getValue());
			//婚姻状况
			SysDic dicHyzkKey = sysDicService.findById(c.getDicHyzkKey());
			c.setDicHyzkKey(dicHyzkKey.getValue());
			if(SysAccountUtils.getSysAccount().getGroupId().equals(c.getGroupId())){
				c.setHasPermission(1);
			}

		}
		PageInfo<Culprit> pageInfo = new PageInfo<Culprit>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	/***
	    * @Title: list  
	    * @Description: 查找矫正对象
	    * @param @param culprit
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "findAll", "" })
	@ResponseBody
	public List<Culprit> findAll(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		//PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}
		culprit.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		List<Culprit> list = culpritService.findAll(culprit);

		

		return list;
	}

	// @RequiresPermissions("sys:culprit:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("culprit") Culprit culprit, Model model) {
			//设置默认时间(开始矫正时间)
			culprit.setCulpritJudgment(new CulpritJudgment());
			culprit.getCulpritJudgment().setRedressStartDate(new Date());
			culprit.getCulpritJudgment().setAdjudgeRedressT(new Date());
			//设置首次报道截至日期
			Calendar c=Calendar.getInstance();   
			c.setTime(new Date()); 
			c.add(Calendar.DAY_OF_MONTH,+10);
			Date limitDate=c.getTime();
			culprit.getCulpritJudgment().setLimitDate(limitDate);
			//设置默认出生年月
			Calendar calendar=Calendar.getInstance();   
			calendar.setTime(new Date()); 
			calendar.add(Calendar.YEAR,-20); 
			Date birthday=calendar.getTime();
			culprit.setBirthday(birthday);
			culprit.setDicFirstReportGetKey(Constants.FIRST_REPORT_KEY_ADD);//首次报到来源类型为"直接报到"
			culprit.setDicFirstReportTypeKey(Constants.FIRST_REPORT_TYPE_BLZ);//首次报到状态为"办理中"
			model.addAttribute("culprit",culprit);
			//设置文书默认时间
			CulpritLaw culpritLaw=new CulpritLaw();
			culpritLaw.setLegalDocsStartDate(new Date());
			culpritLaw.setExecuteNotificationDate(new Date());
			culpritLaw.setLegalDocsReceiveT(new Date());
			
			model.addAttribute("culpritLaw",culpritLaw);
			
		return "modules/culprit/culpritAddForm";
	}
	
	// @RequiresPermissions("sys:culprit:view")
	@RequestMapping(value = "findById")
	@ResponseBody
	public Culprit findById(@ModelAttribute("culprit") Culprit culprit, Model model) {
		return culprit;
	}
	/**
	 * 
	    * @Title: findNumByGroupId  
	    * @Description: 通过组织id查找该组织下犯人数量  
	    * @param @param culprit
	    * @param @param model
	    * @param @return    参数  
	    * @return int    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "findNumByGroupId",method = RequestMethod.GET)
	@ResponseBody
	public String findNumByGroupId(Culprit culprit, Model model) {
		Integer num = culpritService.findNumByGroupId(culprit.getGroupId());
		return culpritService.getCulpritNo(num+1, culprit.getGroupId()); 
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑矫正对象  
	    * @param @param culprit
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culprit:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Culprit culprit,CulpritJudgment culpritJudgment,CulpritLaw culpritLaw, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, culprit)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑失败！");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			//档案修改记录标记
			String flag=request.getParameter("flag");
			//矫正对象照片
			List<SysFile> fileList1=getSysFiles("image");
			//法律文书
			List<SysFile> fileList2=getSysFiles("legalDocs");
			commonJsonResult=culpritService.saveCulprit(culprit, culpritJudgment, culpritLaw, flag,fileList1,fileList2);
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culprit.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除矫正对象  
	    * @param @param culprit
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culprit:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(@ModelAttribute("culprit")Culprit culprit, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			CulpritJudgment culpritJudgment=new CulpritJudgment();
			culpritJudgment.setCulpritId(culprit.getId());
			List<CulpritJudgment> list1=culpritJudgmentService.findAll(culpritJudgment);
			if(!list1.isEmpty()){
				culpritJudgmentService.deleteById(list1.get(0).getId());
			}
			
			CulpritLaw culpritLaw=new CulpritLaw();
			culpritLaw.setCulpritId(culprit.getId());
			List<CulpritLaw> list2=culpritLawService.findAll(culpritLaw);
			if(!list2.isEmpty()){
				culpritLawService.deleteById(list2.get(0).getId());
			}
			culpritService.deleteById(culprit.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除矫正对象  
	    * @param @param culprit
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culprit:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Culprit culprit, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritService.batchDelete(culprit.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
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
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("culprit") Culprit culprit, Model model) {
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(culprit.getId());
		record1.setFileType(Constants.FILE_CULPRIT_IMAGE_PATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		if(!fileList1.isEmpty()){
			model.addAttribute("image", fileList1.get(0));
		}
		
		SysFile record2 = new SysFile();
		record2.setOrderStr("created asc");
		record2.setTableId(culprit.getId());
		record2.setFileType(Constants.FILE_CULPRITlAW_DOC_PATH);
		List<SysFile> fileList2 = sysFileService.findAll(record2);
		model.addAttribute("fileList2", fileList2);
		
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/culprit/culpritDetail";
	}
	@RequestMapping(value = "deal")
	public String deal(@ModelAttribute("culprit") Culprit culprit, Model model) {
		model.addAttribute("culprit",culprit);//罪犯信息
		
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/culprit/culpritApply";
	}
	//监管人员指定
	@RequestMapping(value = "supervisorForm")
	public String supervisorForm(CulpritSupervisor culpritSupervisor, Model model) {
		Culprit culprit=culpritService.findById(culpritSupervisor.getCulpritId());
		model.addAttribute("culprit",culprit);
		List<CulpritSupervisor> c=culpritSupervisorService.findAll(culpritSupervisor);
		if(!c.isEmpty()){
			model.addAttribute("culpritSupervisor",c.get(0));
		}
		return "modules/culprit/supervisor";
	}
	@RequestMapping(value = "saveSupervisor")
	@ResponseBody
	public CommonJsonResult saveSupervisor(CulpritSupervisor culpritSupervisor){
		CommonJsonResult commonJsonResult = null;
		try {
			if (StringUtils.isBlank(culpritSupervisor.getId())) {
				culpritSupervisorService.saveOrUpdate(culpritSupervisor);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(culpritSupervisor.getId());
				commonJsonResult.setMsg("保存成功！");
			} else {
				culpritSupervisorService.updateByIdSelective(culpritSupervisor);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(culpritSupervisor.getId());
				commonJsonResult.setMsg("修改成功！");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritSupervisor.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	
	
	/*//打印社区矫正责任书验证矫正小组是否建立
	@RequestMapping(value = "checkSupervisor")
	@ResponseBody
	public CommonJsonResult checkSupervisor(CulpritSupervisor culpritSupervisor, Model model){
		CommonJsonResult commonJsonResult = null;
		CulpritSupervisor c=culpritSupervisorService.findById(culpritSupervisor.getId());
			if(c!=null){
				if(c.getAdjustMasterId()==null && c.getAdjustorName()==null){
					commonJsonResult = CommonJsonResult.build(505, "请建立矫正小组再打印！");
				}else{
					commonJsonResult = CommonJsonResult.build(200, "");
				}
			}else{
				commonJsonResult = CommonJsonResult.build(505, "请建立矫正小组再打印！");
			}
			
			return commonJsonResult;
	}
	*/
	
	
	//(首次修改)
	@RequestMapping(value = "update")
	public String update(@ModelAttribute("culprit") Culprit culprit, Model model) {
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(culprit.getId());
		record1.setFileType(Constants.FILE_CULPRIT_IMAGE_PATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		if(!fileList1.isEmpty()){
			model.addAttribute("image", fileList1.get(0));
		}
		
		SysFile record2 = new SysFile();
		record2.setOrderStr("created asc");
		record2.setTableId(culprit.getId());
		record2.setFileType(Constants.FILE_CULPRITlAW_DOC_PATH);
		List<SysFile> fileList2 = sysFileService.findAll(record2);
		model.addAttribute("fileList2", fileList2);
		
		/*return "modules/dailymgr/documentManage/documentManage";*/
		return "modules/culprit/culpritAddForm";
	}
	//矫正对象基本信息
	@RequestMapping(value = "information")
	public String information(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		ExitEntryReport exitEntryReport = new  ExitEntryReport();
		exitEntryReport.setCulpritId(culprit.getId());
		List<ExitEntryReport> reportList=exitEntryReportService.findAll(exitEntryReport);
		if(reportList.size()>0){
			model.addAttribute("exitEntryReport",reportList.get(0));
		}
		CulpritSupervisor culpritSupervisor=new CulpritSupervisor();
		culpritSupervisor.setCulpritId(culprit.getId());
		List<CulpritSupervisor> culpritSupervisorList =culpritSupervisorService.findAll(culpritSupervisor);
		if(culpritSupervisorList.size()>0){
			CulpritSupervisor c=culpritSupervisorList.get(0);
			String assistantName="";
			if(c.getAssistantId()!=null){
				//若协管员名字有多个
				String[] assistantIds=c.getAssistantId().split(",");
				
				for(int i=0;i<assistantIds.length;i++){
					String assistantName1=SysAccountUtils.getSysAccountById(assistantIds[i]).getAccountname();
					assistantName+=","+assistantName1;
				}
			}
			c.setAssistantName(assistantName);
			model.addAttribute("culpritSupervisor",c);
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		//矫正小组
		Monitor monitor=new Monitor();
		monitor.setCulpritId(culprit.getId());
		List<Monitor> monitorList=monitorService.findAll(monitor);
		if(monitorList.size()>0){
			String monitorGroup="";
			for(Monitor m:monitorList){
				monitorGroup+=m.getName()+"("+m.getGroupTypeId()+"),";
			}
			monitorGroup=monitorGroup.substring(0, monitorGroup.length()-1);
			model.addAttribute("monitorGroup",monitorGroup);
		}
		//照片
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(culprit.getId());
		record1.setFileType(Constants.FILE_CULPRIT_IMAGE_PATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		if(!fileList1.isEmpty()){
			model.addAttribute("image", fileList1.get(0));
		}
		
		
		return "modules/dailymgr/documentManage/information";
	}
	@RequestMapping(value = "person")
	public String person(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/person";
	}
	@RequestMapping(value = "culpritLaw")
	public String culpritLaw(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/culpritLaw";
	}
	@RequestMapping(value = "culpritJudgment")
	public String culpritJudgment(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/culpritJudgment";
	}
	@RequestMapping(value = "rewardspunishment")
	public String rewardspunishment(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/rewardspunishment/rewardspunishment";
	}
	
	//打印告知书
	@RequestMapping(value = "printGZS")
	public String printGZS(@ModelAttribute("culprit") Culprit culprit, Model model) {
		Date nowDate=new Date();
		model.addAttribute("nowDate",nowDate);
		return "modules/culprit/print/culpritPrintGZS";
	}
	
	//打印通知单
	@RequestMapping(value = "printTZD")
	public String printTZD(@ModelAttribute("culprit") Culprit culprit, Model model) {
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount",sysAccount);
		return "modules/culprit/print/culpritPrintTZD";
	}
	
	
	//首次谈话教育
		@RequestMapping(value = "firstTalkForm")
		public String firstTalkForm( Talk talk, Model model) {
			talk.setIsFirstTalk("0");
			List<Talk> list=talkService.findAll(talk);
			if(!list.isEmpty()){
				Talk talkEntity=list.get(0);
				/*String s  = talkEntity.getPlace();
				String[] str=s.split(",");
				if(str.length>3){
					 talkEntity.setAddressPro(str[0]);
					 talkEntity.setAddressCity(str[1]);
					 talkEntity.setAddressCountry(str[2]);
					 talkEntity.setAddressStreet(str[3]);
				}
				if(str.length>4){
					talkEntity.setAddressDetail(str[4]);
				} */
				
				model.addAttribute("talk",talkEntity);
			}else{
				//若谈话内容为空，则默认生成内容
				if(StringUtils.isBlank(talk.getRecord())){
					String record="问：我是"+SysAccountUtils.getSysAccount().getGroupName()+"工作人员（出示证件）。现依法找你谈话，向你了解相关情况，告知你在社区矫正期间应当遵守的有关规定（宣读相关法律法规）。你对应当遵守的各项规定是否清楚？"
							+ "\r\n答："
							+ "\r\n\r\n问：你接受社区矫正的类别是什么？矫正期限多长？"
							+ "\r\n答："
							+ "\r\n\r\n问：你违法犯罪的基本情况是什么？ "
							+ "\r\n答："
							+ "\r\n\r\n问：你在何时何地还受到过何种处罚（刑事、行政）？被采取过何种强制措施（拘留、其他强制措施）？是否有过吸毒？"
							+ "\r\n答："
							+ "\r\n\r\n问：你对自己的犯罪行为有何认识和态度？"
							+ "\r\n答："
							+ "\r\n\r\n问：你家庭还有哪些成员？他们的基本情况怎样？"
							+ "\r\n答："
							+ "\r\n\r\n问：你是否持有护照或港澳通行证？是否有海外关系？"
							+ "\r\n答："
							+ "\r\n\r\n问：你有什么技术特长和经济谋生的办法？"
							+ "\r\n答："
							+ "\r\n\r\n问：你目前生活或工作上有什么困难？"
							+ "\r\n答："
							+ "\r\n\r\n问：今后你准备如何做一个守法公民？"
							+ "\r\n答："
							+ "\r\n\r\n问：你还有什么补充说明？ "
							+ "\r\n答："
							+ "\r\n\r\n问：以上内容是否属实？"
							+ "\r\n答：";
					talk.setRecord(record);
				}
				
				talk.setTalkor(SysAccountUtils.getSysAccount().getAccountname());
				talk.setRecorder(SysAccountUtils.getSysAccount().getAccountname());
			}
			return "modules/culprit/firstTalkForm";
	}
	
	//打印社区矫正责任书
	@RequestMapping(value = "printZRS")
	public String printZRS(@ModelAttribute("culprit") Culprit culprit, Model model) {
		Date nowDate=new Date();
		model.addAttribute("nowDate",nowDate);
		return "modules/culprit/print/sqjzzrs";
	}	
	
	//打印社区矫正宣告书
		@RequestMapping(value = "printXGS")
		public String printXGS(@ModelAttribute("culprit") Culprit culprit, Model model) {
			
			Date nowDate=new Date();
			model.addAttribute("nowDate",nowDate);
			//矫正小组
			Monitor monitor=new Monitor();
			monitor.setCulpritId(culprit.getId());
			List<Monitor> monitorList=monitorService.findAll(monitor);
			if(monitorList.size()>0){
				String monitorGroup="";
				for(Monitor m:monitorList){
					monitorGroup+=m.getName()+"("+m.getGroupTypeId()+"),";
				}
				monitorGroup=monitorGroup.substring(0, monitorGroup.length()-1);
				model.addAttribute("monitorGroup",monitorGroup);
			}

			return "modules/culprit/print/sqjzxgs";
		}	
		
	//首次报道更新标识
	@RequestMapping(value = "updateFinshInfo")
	@ResponseBody
	public CommonJsonResult updateFinshInfo(String id,String finshInfo,String finshInfo1,
			String finshInfo2,String finshInfo3,String finshInfo4,String finshInfo5,String finshInfo6,
			String finshInfo7,String finshInfo8,String finshInfo9,String dicMonitorGradeKey,Model model) {
		CommonJsonResult commonJsonResult = null;
		Culprit culprit=new Culprit();
		culprit.setDicFirstReportTypeKey(Constants.FIRST_REPORT_TYPE_BLZ);//报到状态改为办理中
		if(dicMonitorGradeKey!=null){
			culprit.setDicMonitorGradeKey(dicMonitorGradeKey);
		}
		if(finshInfo!=null){
			culprit.setFinshInfo(Integer.valueOf(finshInfo));
			culprit.setDicStatusKey(Constants.CULPRIT_STATUS_JZZ);//档案状态设为矫正中
			culprit.setCreatedTime(new Date());//记录首次报道时间
			Culprit culprit1=culpritService.findById(id);
			culprit.setDicFirstReportTypeKey(Constants.FIRST_REPORT_TYPE_WCRJ);//报到状态改为完成入矫
			if(culprit1.getDicMonitorGradeKey()==null){
				culprit.setDicMonitorGradeKey("27004");//完成入矫时若监管等级为空，则默认为为严管
			}
			GradeChange gradeChange=new GradeChange();
			gradeChange.setCulpritId(id);
			gradeChange.setDicMonitorGradeKey(culprit1.getDicMonitorGradeKey());
			gradeChange.setLogo("0");
			gradeChange.setPrintStatus("0");
			gradeChange.setBlankFlag("1");
			gradeChangeService.saveOrUpdate(gradeChange);
			culprit1.setReportDate(new Date());
			dailyReportLastService.save(culprit1);
		}
		
		if(finshInfo1!=null){
			culprit.setFinshInfo1(Integer.valueOf(finshInfo1));
		}
		if(finshInfo2!=null){
			culprit.setFinshInfo2(Integer.valueOf(finshInfo2));		
		}
		if(finshInfo3!=null){
			culprit.setFinshInfo3(Integer.valueOf(finshInfo3));
		}
		if(finshInfo4!=null){
			culprit.setFinshInfo4(Integer.valueOf(finshInfo4));
		}
		if(finshInfo5!=null){
			culprit.setFinshInfo5(Integer.valueOf(finshInfo5));
		}
		if(finshInfo6!=null){
			culprit.setFinshInfo6(Integer.valueOf(finshInfo6));
		}
		if(finshInfo7!=null){
			culprit.setFinshInfo7(Integer.valueOf(finshInfo7));		
		}
		if(finshInfo8!=null){
			culprit.setFinshInfo8(Integer.valueOf(finshInfo8));
		}
		if(finshInfo9!=null){
			culprit.setFinshInfo9(Integer.valueOf(finshInfo9));
		}
		culprit.setId(id);
		try{
			if (!StringUtils.isBlank(culprit.getId())) {
				culpritService.updateByIdSelective(culprit);
				commonJsonResult = CommonJsonResult.build(200, "更新成功！");
			} else {
				commonJsonResult = CommonJsonResult.build(505, "更新失败！");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culprit.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}
	
			return commonJsonResult;
		}
		
	}
	
	/***
	 * 
	    * @Title: getAreaValue  
	    * @Description: 根据key 表名、列名 获取数据字典的值
	    * @param @param 
	    * @param @param 
	    * @param @param key
	    * @param @return    参数  
	    * @return SysDic    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "getAreaValue")
	@ResponseBody
	public Area getAreaValue(@RequestParam(value = "id") String id){
		Area area= areaService.findById(id);
		return area;
	}

	//审前匹配
	@RequestMapping(value = "matchInvestigate")
	@ResponseBody
	public CommonJsonResult matchInvestigate(String identification){
		CommonJsonResult commonJsonResult = null;
		Investigate investigate=new Investigate();
		investigate.setRelevantNumber(identification);
		List<Investigate>list=investigateService.findAll(investigate);
		if(!list.isEmpty()){
			commonJsonResult = CommonJsonResult.build(200,"匹配成功!",list.get(0));
		}else{
			commonJsonResult = CommonJsonResult.build(500,"匹配失败!");
		}
		return commonJsonResult;
	}
	
	//查找迁入管理和审前调查有无人员
	@RequestMapping(value = "matchInvestigateAndMoveIn")
	@ResponseBody
	public CommonJsonResult matchInvestigateAndMoveIn(String identification){
		CommonJsonResult commonJsonResult=culpritService.matchInvestigateAndMoveIn(identification);
		return commonJsonResult;
	}
	
	//审前调查、迁入管理、矫正对象是否存在身份证信息
	@RequestMapping(value = "isIdCardExist")
	@ResponseBody
	public CommonJsonResult isIdCardExist(String idcard, String tablename){
		CommonJsonResult commonJsonResult=culpritService.isIdCardExist(idcard, tablename);
		
		return commonJsonResult;
	}
}
