package com.rowell.sifa.web.homepage;

import java.util.ArrayList;
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
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.homepage.ExaminationAndApproval;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: ExaminationAndApprovalController
 * @Description: 待审批事项(这里用一句话描述这个类的作用)
 * @author yxb
 * @date 2017年3月1日
 * 
 */
@Controller
@RequestMapping(value = "/homepage/examinationAndApproval")
public class ExaminationAndApprovalController1 extends BaseController {
	@Autowired
	ExaminationAndApprovalService examinationAndApprovalService;


	@ModelAttribute("examinationAndApproval")
	public ExaminationAndApproval get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return examinationAndApprovalService.findById(id);
		} else {
			return new ExaminationAndApproval();
		}
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(ExaminationAndApproval examinationAndApproval, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		
		return "/modules/homepage/ExaminationAndApproval/examinationAndApprovalList";
	}

	@RequestMapping(value = { "list", "" },method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(ExaminationAndApproval examinationAndApproval,String name,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if(!StringUtils.isBlank(name)){
			examinationAndApproval.setCulpritName(name);
		}
		List<ExaminationAndApproval> list = examinationAndApprovalService.findAll(examinationAndApproval);
		//List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(examinationAndApproval.getProcessInstanceId());
		List<ExaminationAndApproval> list1=new ArrayList<ExaminationAndApproval>();
		SysAccount account = SysAccountUtils.getSysAccount();
		for(ExaminationAndApproval e:list){
			if(!StringUtils.isBlank(e.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(e);
			} 
			if(e.getHasPermission()==1){//删选有权限处理事项
				e.setRoleId(account.getRoleId());
				list1.add(e);
			}
		}
		PageHelper.startPage(page, getPageSize());
		PageInfo<ExaminationAndApproval> pageInfo = new PageInfo<ExaminationAndApproval>(list1);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list1);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	
	 /**
	  * 流程终止
	  * 
	  */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@RequestParam(value = "taskId", required = false) String taskId,Model model){
		try {
			ProcessUtils.endProcess("endevent1", taskId);
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
}
