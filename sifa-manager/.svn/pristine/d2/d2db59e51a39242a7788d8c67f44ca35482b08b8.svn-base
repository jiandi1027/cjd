package com.rowell.sifa.web.statistics;

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
import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.rewardspunishment.RevokeOutOfPrison;
import com.rowell.sifa.pojo.rewardspunishment.RevokeProbation;
import com.rowell.sifa.pojo.statistics.CulpritStatusTj;
import com.rowell.sifa.pojo.statistics.CulpritWorkTj;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.rewardspunishment.RevokeOutOfPrisonService;
import com.rowell.sifa.service.statistics.CulpritWorkTjService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;
/**
 * 
    * @ClassName: 社区矫正统计报表（季表）
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author DELL  
    * @date 2017年4月13日  
    *
 */
@Controller
@RequestMapping(value = "/statistics/culpritWorkTj")
public class CulpritWorkTJController extends BaseController{
	@Autowired
	private CulpritWorkTjService culpritWorkTjService;
	@Autowired
	private SysGroupService sysGroupService;
	
	@ModelAttribute("culpritWorkTj")
	public CulpritWorkTj get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritWorkTjService.findById(id);
		} else {
			return new CulpritWorkTj();
		}
	}
	
	/**
	 * 
	    * @Title: forList  
	    * @Description: get请求跳转页面
	    * @param @param revokeOutPrison
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CulpritWorkTj culpritWorkTj, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/statistics/culpritWorkTj/culpritWorkTjList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(CulpritWorkTj culpritWorkTj,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritWorkTj.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culpritWorkTj.getOrderStr());
		}
		//查询本部门的统计表
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		String groupId=sysAccount.getGroupId();
		culpritWorkTj.setGroupId(groupId);
		List<CulpritWorkTj> list = culpritWorkTjService.findAll(culpritWorkTj);
		for(CulpritWorkTj c:list){
			if(sysGroupService.findById(c.getGroupId()).getLevelNo()==2){//判断该账户是否是司法所工作人员
				c.setGroupleave("2");
			}
		}
		PageInfo<CulpritWorkTj> pageInfo = new PageInfo<CulpritWorkTj>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	//查看
	@RequestMapping(value = "showPrint")
	public String showPrint(@ModelAttribute("culpritWorkTj") CulpritWorkTj culpritWorkTj, Model model) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		model.addAttribute("creater",sysAccount.getAccountname());//制表人
		List<CulpritWorkTj> childTjList=culpritWorkTjService.findChildTj(culpritWorkTj);
		if(sysGroupService.findById(culpritWorkTj.getGroupId()).getLevelNo()==2){//判断该账户是否是司法所工作人员
			childTjList.add(culpritWorkTj);
			model.addAttribute("groupleavel","2");//部门级别
		}
		model.addAttribute("childTjList", childTjList);
		return "modules/statistics/culpritWorkTj/culpritWorkTjprint";
	}
	//跳转到上报页面
	@RequestMapping(value = "submitTj")
	public String submitTj(@ModelAttribute("culpritWorkTj") CulpritWorkTj culpritWorkTj, Model model) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		model.addAttribute("creater",sysAccount.getAccountname());//制表人
		Date reportTime=new Date();
		model.addAttribute("reportTime",reportTime);
		List<CulpritWorkTj> childTjList=culpritWorkTjService.findChildTj(culpritWorkTj);
		if(sysGroupService.findById(culpritWorkTj.getGroupId()).getLevelNo()==2){//判断该账户是否是司法所工作人员
			childTjList.add(culpritWorkTj);
			model.addAttribute("groupleavel","2");//部门级别
		}
		model.addAttribute("childTjList", childTjList);
		return "modules/statistics/culpritWorkTj/culpritTSubmitWorkTj";
	}
	//保存并上报
	@RequestMapping(value = "submit")
	@ResponseBody
	public CommonJsonResult submit(CulpritWorkTj culpritWorkTj, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, culpritWorkTj)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			SysAccount sysAccount=SysAccountUtils.getSysAccount();
			culpritWorkTj.setCreater(sysAccount.getAccountname());//制表人
			culpritWorkTj.setReportTime(new Date());
			if(!"91804".equals(culpritWorkTj.getDicState())){
				culpritWorkTj.setDicState("91801");//已上报
				culpritWorkTjService.updateById(culpritWorkTj);//更新保存
				return CommonJsonResult.build(200, "上报成功!");
			}
			//完成统计更新所有部门报表状态
			culpritWorkTjService.updateDicStatusById(culpritWorkTj);//更新保存
			return CommonJsonResult.build(200, "统计完成!");
		} catch (Exception e) {
			logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "上报失败!");
				commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	
	//退回
	@RequestMapping(value = "returnTj")
	@ResponseBody
	public CommonJsonResult returnTj(@ModelAttribute("culpritWorkTj") CulpritWorkTj culpritWorkTj, HttpServletRequest request, Model model) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritWorkTj.setDicState("91803");//退回
			culpritWorkTj.setReturnTime(new Date());
			culpritWorkTjService.updateById(culpritWorkTj);//更新保存
			commonJsonResult = CommonJsonResult.build(200, "退回成功!");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "退回失败!");
			return commonJsonResult;
		}
	}
		
	
}















