package com.rowell.sifa.web.homepage;
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
import com.rowell.sifa.pojo.homepage.WorkRemind;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.homepage.WorkRemindService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.sys.utils.SysDicUtils;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: WorkRemindController
 * @Description: 待处理事项(这里用一句话描述这个类的作用)
 * @author zhl
 * @date 2017年3月1日
 * 
 */
@Controller
@RequestMapping(value = "/homepage/workRemind")
public class WorkRemindController extends BaseController {
	@Autowired
	private WorkRemindService workRemindService;
	@Autowired
	private SysDicService sysDicService;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;

	@ModelAttribute("workRemind")
	public WorkRemind get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return workRemindService.findById(id);
		} else {
			return new WorkRemind();
		}
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(WorkRemind workRemind, Model model, HttpServletRequest request) {
		return "/modules/homepage/workRemind/workRemindList";
	}

	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(WorkRemind workRemind, HttpServletRequest request, Model model) {
		if (StringUtils.isBlank(workRemind.getGroupId())) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			String groupId=sysAccount.getGroupId();
			workRemind.setGroupId(groupId);
		}
		List<SysDic> list=null;
		if(workRemind.getSearchWorkRemindVal()!=null && workRemind.getSearchWorkRemindVal()!=""){//查询事项
			SysDic sysDic=new SysDic();
			sysDic.setKey(workRemind.getSearchWorkRemindVal());
			list = sysDicService.findAll(sysDic);
		}else{
			list = SysDicUtils.getSysDicList("SF_NO_DEAL", "EVENT_REMINDER_TYPE", Constants.TO_BE_Processed);
		}
		for(SysDic s:list){
			workRemind.setDicType(s.getKey());
			int amount=workRemindService.findAmountByDicId(workRemind);
			s.setAmount(amount);
		}
		SysDic sysDic1=new SysDic();
		sysDic1.setExamAndAppListSize(examinationAndApprovalService.findAllAmount());
		sysDic1.setWorkRemindListSize(workRemindService.findAllAmount());
		list.add(sysDic1);
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		return result;
	}
	
	//不同处理事项list页面不同
	@RequestMapping(value = "toView")
	public String toView(SysDic sysDic,String groupId, Model model, HttpServletRequest request){	
		model.addAttribute("key", sysDic.getKey());
		model.addAttribute("groupId", groupId);
		return workRemindService.findUrlById(sysDic.getKey(),model);
		
	}
	@RequestMapping(value = { "toViewList", "" })
	@ResponseBody
	public EUDataGridResult toViewList(String key,WorkRemind workRemind,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(workRemind.getGroupId())) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			String groupId=sysAccount.getGroupId();
			workRemind.setGroupId(groupId);
		}
		if (StringUtils.isBlank(workRemind.getOrderStr())) {
			PageHelper.orderBy("task_Date asc");
		} else {
			PageHelper.orderBy(workRemind.getOrderStr());
		}
		// 创建一个返回值对象
		workRemind.setDicType(key);
		List<WorkRemind> list=workRemindService.findAll(workRemind);
		PageInfo<WorkRemind> pageInfo = new PageInfo<WorkRemind>(list);
		model.addAttribute("pager", pageInfo);
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());		
		return result;
	}
	
	
	@RequestMapping(value = "auditWorkRemind")
	public String auditWorkRemind(@ModelAttribute("workRemind")WorkRemind workRemind, Model model, HttpServletRequest request){	
		model.addAttribute("workRemind", workRemind);
		//return "/modules/homepage/workRemind/auditWorkRemind";
		return workRemindService.findAuditUrlByKey(workRemind.getDicType());
	}
	
	//保存处理结果
	@RequestMapping(value = "update")
	@ResponseBody
	public CommonJsonResult update(WorkRemind workRemind, HttpServletRequest request, Model model) {
		CommonJsonResult commonJsonResult = null;
		try {
			workRemind.setDelFlag(1);//作废标记
			workRemindService.saveOrUpdate(workRemind);
			commonJsonResult=CommonJsonResult.build(200, "处理成功！");
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "处理失败！");
			commonJsonResult.setIsError(true);
			}
			return commonJsonResult;
		}
	
	
}
