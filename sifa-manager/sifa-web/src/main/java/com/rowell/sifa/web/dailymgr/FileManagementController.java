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
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.HelpDifficulty;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.web.base.BaseController;
import com.rowell.sifa.web.sys.SysDicController;

/**  
    * @ClassName: AskLeaveController  
    * @Description: 档案管理(这里用一句话描述这个类的作用)  
    * @author yxb
    * @date 2017年3月1日  
    *    
    */
@Controller
@RequestMapping(value = "/dailymgr/fileManagement")
public class FileManagementController extends BaseController {

	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private SysDicController sysDicController;
 
	@ModelAttribute("culprit")
	public Culprit get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritService.findById(id);
		} else {
			return new Culprit();
		}
	}
	

	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(HelpDifficulty helpDifficulty, Model model, HttpServletRequest request) {
		return "/modules/dailymgr/fileManagement/fileManagementList";
	}
	

	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}
		List<Culprit> list = culpritService.findAll(culprit);
		PageInfo<Culprit> pageInfo = new PageInfo<Culprit>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	

}
