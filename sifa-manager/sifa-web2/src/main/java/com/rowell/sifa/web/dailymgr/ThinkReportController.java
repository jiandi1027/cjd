package com.rowell.sifa.web.dailymgr;

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
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.ThinkReport;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.ThinkReportService;
import com.rowell.sifa.service.sys.SysFileService;
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
@RequestMapping(value="/dailymgr/thinkReport")
public class ThinkReportController extends BaseController{
	@Autowired
	private ThinkReportService thinkReportService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private SysFileService sysFileService;
	
	@ModelAttribute("thinkReport")
	public ThinkReport get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return thinkReportService.findById(id);
		}else{
			return new ThinkReport();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(ThinkReport thinkReport, Model model, HttpServletRequest request) {
		return "modules/dailymgr/thinkReport/thinkReportList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(ThinkReport thinkReport,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(thinkReport.getGroupId())){
			thinkReport.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(thinkReport.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(thinkReport.getOrderStr());
		}
		List<ThinkReport> list = thinkReportService.findAll(thinkReport);
		
		PageInfo<ThinkReport> pageInfo = new PageInfo<ThinkReport>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
		//跳转到增加页面
		@RequestMapping(value = "form")
		public String form(String id, Model model, HttpServletRequest request) {
			ThinkReport thinkReport=thinkReportService.findById(id);
			model.addAttribute("thinkReport",thinkReport);
			if(thinkReport!=null){
				SysFile sysFile = new SysFile();
				sysFile.setTableName(Constants.FILE_TABLE_THINK_REPORT);
				sysFile.setTableId(thinkReport.getId());
				sysFile.setFileType(Constants.FILE_THINK_REPORT);
				List<SysFile> fileList=sysFileService.findAll(sysFile);
				model.addAttribute("fileList",fileList);
			}
			
			return "modules/dailymgr/thinkReport/thinkReportForm";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			ThinkReport thinkReport=thinkReportService.findById(id);
			model.addAttribute("thinkReport",thinkReport);
			if(thinkReport!=null){
				SysFile sysFile = new SysFile();
				sysFile.setTableName(Constants.FILE_TABLE_THINK_REPORT);
				sysFile.setTableId(thinkReport.getId());
				sysFile.setFileType(Constants.FILE_THINK_REPORT);
				List<SysFile> fileList=sysFileService.findAll(sysFile);
				model.addAttribute("fileList",fileList);
			}
			return "modules/dailymgr/thinkReport/thinkReportDetail";
		}
		

		//档案返回思想汇报页面
		@RequestMapping(value = "thinkReportDoclist", method = RequestMethod.GET)
		public String thinkReportDoclist(ThinkReport thinkReport, Model model, HttpServletRequest request) {
			model.addAttribute("thinkReport", thinkReport);	
			model.addAttribute("culprit", culpritService.findById(thinkReport.getCulpritId()));
			return "modules/dailymgr/documentManage/thinkReportDoc";
		}
		
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(ThinkReport thinkReport,  Model model,HttpServletRequest request) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, thinkReport)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				List<SysFile> fileList=getSysFiles(); 
				thinkReportService.saveOrUpdate(thinkReport);
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_THINK_REPORT, thinkReport.getId(), Constants.FILE_THINK_REPORT);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				return commonJsonResult;
			}
		}
	
}
