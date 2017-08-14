package com.rowell.sifa.web.datacenter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**  
    * @ClassName: SystemFile  
    * @Description: 制度文件控制层
    * @author Administrator  
    * @date 2017年4月6日  
    *    
    */
@Controller
@RequestMapping(value="/datacenter/systemFile")
public class SystemFileController extends BaseController{
	@Autowired
	private SysFileService sysFileService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Model model, HttpServletRequest request){
		return "/modules/datacenter/systemFile/systemFileList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(SysFile sysFile,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		sysFile.setOrderStr("created desc");
		sysFile.setFileType(Constants.FILE_SYSTEM_FILE);
		List<SysFile> fileList = sysFileService.findAll(sysFile);
		PageInfo<SysFile> pageInfo = new PageInfo<SysFile>(fileList);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(fileList);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	
	
	/**
	 * 
	    * @Title: form  
	    * @Description: 跳转至增加页面  
	    * @param @param RevokeOutOfPrison
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(SysFile sysFile, Model model) {
		return "modules/datacenter/systemFile/systemFileForm";
	}
	
	//保存草稿
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			try {
				List<SysFile> fileList=getSysFiles();
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_SYSTEM_FILE,"", Constants.FILE_SYSTEM_FILE);
				return CommonJsonResult.build(200, "保存成功！");
			} catch (Exception e) {
				logger.error(e.getMessage());
				return CommonJsonResult.build(505, "保存失败！");
			}
		}
		
	
	
	
}
