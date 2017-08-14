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
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.dailymgr.HelpDifficulty;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.service.culpritinfo.CulpritLawService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.monitoring.TerminalService;
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
	
	@Autowired
	private CulpritLawService culpritLawService;
	
	@Autowired
	private TerminalService terminalService;
	
 
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
		if (StringUtils.isBlank(culprit.getGroupId())) {
			culprit.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}
		culprit.setFinshInfo(1);
		List<Culprit> list = culpritService.findAllByGroupId(culprit);
		PageInfo<Culprit> pageInfo = new PageInfo<Culprit>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	//档案详情
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("culprit") Culprit culprit, Model model) {
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		
		Terminal terminal = new Terminal();
		terminal.setCulpritId(culprit.getId());
		List<Terminal> list1=terminalService.findAll(terminal);
		if (list1.size() > 0) {
			model.addAttribute("terminal",list1.get(0));
		}
		return "modules/dailymgr/documentManage/documentManage";
	}
	
	//档案修改
	@RequestMapping(value = "update")
	public String update(@ModelAttribute("culprit") Culprit culprit, HttpServletRequest request,Model model) {
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/documentManageUpdate";
	}
	
}
