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
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.statistics.CulpritStatusTj;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.statistics.CulpritStatusTjService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;
/**
 * 
    * @ClassName: 社区矫正人员情况统计表（月表）
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author DELL  
    * @date 2017年4月13日  
    *
 */
@Controller
@RequestMapping(value = "/statistics/culpritStatusTj")
public class CulpritStatusTJController extends BaseController{
	@Autowired
	private CulpritStatusTjService culpritStatusTjService;
	@Autowired
	private SysGroupService sysGroupService;
	
	@ModelAttribute("culpritStatusTj")
	public CulpritStatusTj get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritStatusTjService.findById(id);
		} else {
			return new CulpritStatusTj();
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
	public String forList(CulpritStatusTj culpritStatusTj, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/statistics/culpritStatusTj/culpritStatusTjList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(CulpritStatusTj culpritStatusTj,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritStatusTj.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culpritStatusTj.getOrderStr());
		}
		//此处设置为当前部门
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		String groupId=sysAccount.getGroupId();
		culpritStatusTj.setGroupId(groupId);
		List<CulpritStatusTj> list = culpritStatusTjService.findAll(culpritStatusTj);
		for(CulpritStatusTj c:list){
			if(sysGroupService.findById(c.getGroupId()).getLevelNo()==2){//判断该账户是否是司法所工作人员
				c.setGroupleave("2");
			}
		}
		PageInfo<CulpritStatusTj> pageInfo = new PageInfo<CulpritStatusTj>(list);
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
	public String showPrint(@ModelAttribute("culpritStatusTj") CulpritStatusTj culpritStatusTj, Model model) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		model.addAttribute("creater",sysAccount.getAccountname());//制表人
		model.addAttribute("reportTime",culpritStatusTj.getReporttime());
		//model.addAttribute("culpritStatusTj", culpritStatusTj);
		List<CulpritStatusTj> childTjList=culpritStatusTjService.findChildTj(culpritStatusTj);
		if(sysGroupService.findById(culpritStatusTj.getGroupId()).getLevelNo()==2){//判断该账户是否是司法所工作人员
			childTjList.add(culpritStatusTj);
			model.addAttribute("groupleavel","2");//部门级别
		}
		model.addAttribute("childTjList",childTjList);
		return "modules/statistics/culpritStatusTj/culpritTjprint";
	} 
	
	//跳转到上报页面
	@RequestMapping(value = "submitTj")
	public String submitTj(@ModelAttribute("culpritStatusTj") CulpritStatusTj culpritStatusTj, Model model) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		String creater=sysAccount.getAccountname();
		model.addAttribute("creater",creater);//制表人
		Date reportTime=new Date();
		model.addAttribute("reportTime",reportTime);
		//model.addAttribute("culpritStatusTj", culpritStatusTj);
		List<CulpritStatusTj> childTjList=culpritStatusTjService.findChildTj(culpritStatusTj);
		if(sysGroupService.findById(culpritStatusTj.getGroupId()).getLevelNo()==2){//判断该账户是否是司法所工作人员
			childTjList.add(culpritStatusTj);
			model.addAttribute("groupleavel","2");//部门级别
		}
		model.addAttribute("childTjList",childTjList);
		return "modules/statistics/culpritStatusTj/culpritTSubmitTj";
	}
	
	//保存并上报
	@RequestMapping(value = "submit")
	@ResponseBody
	public CommonJsonResult submit(CulpritStatusTj culpritStatusTj, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, culpritStatusTj)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			SysAccount sysAccount=SysAccountUtils.getSysAccount();
			culpritStatusTj.setCreater(sysAccount.getAccountname());//制表人
			culpritStatusTj.setReporttime(new Date());
			if(!"91804".equals(culpritStatusTj.getDicState())){
				culpritStatusTj.setDicState("91801");//已上报
				culpritStatusTjService.updateById(culpritStatusTj);//更新保存
				return CommonJsonResult.build(200, "上报成功!");
			}
			culpritStatusTjService.updateDicStatusById(culpritStatusTj);
			return CommonJsonResult.build(200, "统计完成!");
		} catch (Exception e) {
			logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "上报失败！");
				commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	
	//退回
		@RequestMapping(value = "returnTj")
		@ResponseBody
		public CommonJsonResult returnTj(@ModelAttribute("culpritStatusTj") CulpritStatusTj culpritStatusTj, HttpServletRequest request, Model model) {
			CommonJsonResult commonJsonResult = null;
			try {
				culpritStatusTj.setDicState("91803");//退回
				culpritStatusTj.setReturnTime(new Date());
				culpritStatusTjService.updateById(culpritStatusTj);//更新保存
				commonJsonResult = CommonJsonResult.build(200, "退回成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "退回失败！");
				return commonJsonResult;
			}
		}
	
	
}















