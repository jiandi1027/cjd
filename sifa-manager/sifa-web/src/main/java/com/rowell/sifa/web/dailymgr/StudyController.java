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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.Study;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.StudyService;
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
@RequestMapping(value="/dailymgr/study")
public class StudyController extends BaseController{
	@Autowired
	private StudyService studyService;
	@Autowired
	private CulpritService culpritService;

	
	@ModelAttribute("study")
	public Study get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return studyService.findById(id);
		}else{
			return new Study();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Study study, Model model, HttpServletRequest request) {
		return "modules/dailymgr/study/studyList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Study study,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(study.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(study.getOrderStr());
		}
		List<Study> list = studyService.findAll(study);
		
		PageInfo<Study> pageInfo = new PageInfo<Study>(list);
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
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			Study study=studyService.findById(id,sysAccount);
			model.addAttribute("study",study);

			return "modules/dailymgr/study/studyForm";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			Study study=studyService.findById(id,sysAccount);
			model.addAttribute("study",study);
			return "modules/dailymgr/study/studyDetail";
		}
		

		@RequestMapping(value = { "save"}, method = RequestMethod.POST)
		public String save(Study study, Model model, HttpServletRequest request) {
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			if(study.getId()!=null){
				study.setGroupId(sysAccount.getGroupId());
			}
			studyService.save(study,sysAccount);
			return "modules/dailymgr/study/studyList";
		}
	
}
