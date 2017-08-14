package com.rowell.sifa.web.rewardspunishment;

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
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.inculprit.MoveIn;
import com.rowell.sifa.pojo.rewardspunishment.Parole;
import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.ParoleService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  假释Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/rewardspunishment/paroleController")
public class ParoleController extends BaseController{
	@Autowired
	private ParoleService paroleService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	@ModelAttribute("parole")
	public Parole get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return paroleService.findById(id);
		} else {
			return new Parole();
		}
	}
	/**
	 * 
	    * @Title: forList  
	    * @Description: 假释跳转页  
	    * @param @param parole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReportt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Parole parole, Model model, HttpServletRequest request) {
		return "modules/assess/Parole/paroleList";
	}
	/**
	 * 
	    * @Title: list  
	    * @Description: 假释列表  
	    * @param @param parole
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
	public EUDataGridResult list(Parole parole,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(parole.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(parole.getOrderStr());
		}

		List<Parole> list = paroleService.findAll(parole);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		//填充实体类
		for(Parole paroleEntity:list){
			
			if(!StringUtils.isBlank(paroleEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(paroleEntity);
				}
	        }
		PageInfo<Parole> pageInfo = new PageInfo<Parole>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:exitEntryReport:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("parole") Parole parole, Model model) {
		//model.addAttribute("parole", parole);
		if(parole.getId()!=null){//若id不为空，则为修改
			model.addAttribute("parole", parole);
			model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		}
		return "modules/assess/Parole/paroleForm";
	}
	/**
	 * 
	    * @Title: save  
	    * @Description: 保存假释信息 
	    * @param @param parole
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")//0保存1上报保存
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Parole parole, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,Integer reportType1) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, parole)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(parole.getId())) {
				//无记录情况下
				if(reportType1==1){
					//保存上报
					paroleService.insert(parole);
					
				}else{
					//保存
					paroleService.saveOrUpdate(parole);
				}
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				paroleService.updateByIdSelective(parole);
				//修改后判断是直接上报还是先保存修改
				if(reportType1==1){
					SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
					paroleService.submitParole(sysAccount.getId(), parole);
				}
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(parole.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/**
	 * 
	    * @Title: delete  
	    * @Description: 删除假释 
	    * @param @param parole
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Parole parole, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			paroleService.deleteById(parole.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	/**
	 * 
	    * @Title: batchDelete  
	    * @Description: 批量删除  
	    * @param @param parole
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Parole parole, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			paroleService.batchDelete(parole.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	/**
	 * 
	    * @Title: submitMoveIn  
	    * @Description: 仅仅上报  
	    * @param @param parole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "submitParole", method = RequestMethod.GET)
	@ResponseBody
	public CommonJsonResult submitParole(Parole parole, Model model, HttpServletRequest request) {
		SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
		paroleService.submitParole(sysAccount.getId(), parole);
		return CommonJsonResult.ok();
	}
	/**
	 * 
	    * @Title: submitParoleAudit  
	    * @Description: 流程处理 
	    * @param @param parole
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping("/submitParoleAudit")
	@ResponseBody
	public CommonJsonResult submitParoleAudit(@ModelAttribute("parole")Parole parole,String decideType,String opinion,String optScore,
			String zfScore,String dicSorceType,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			ProcessUtils.fillProcessInfo(parole);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			if("1".equals(parole.getProcuratorate())){
				decideType="1";
			}
			if("2".equals(parole.getProcuratorate())){
				decideType="0";
			}
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			if(optScore != null && optScore != ""){
				processDetail.setOptScore(optScore);
			}
			if(zfScore != null && zfScore != ""){
				processDetail.setZfScore(zfScore);
			}
			if(dicSorceType != null && dicSorceType != ""){
				processDetail.setDicSorceType(sysAccount.getRoleId());
			}
//		if("0".equals(decideType)){//不同意 则结束
//			askLeaveService.jumpAuditStatus(sysAccount.getRoleId(),askLeave,processDetail,0);
//		}else if("1".equals(decideType)){//同意则进入下一步
//			askLeaveService.saveAskLeaveAuditStatus(sysAccount.getRoleId(), askLeave, processDetail);
//		}else{//退回  返回到上一步
//			askLeaveService.jumpAuditStatus(sysAccount.getRoleId(),askLeave,processDetail,1);
//		}
			paroleService.saveParoleAuditStatus(sysAccount.getRoleId(), parole, processDetail);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("处理成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "处理失败！");
			
		}
		
		return commonJsonResult;
		//return "redirect:/dailymgr/askLeave/list";
	}
	@RequestMapping("/paroleAudit")
	public String paroleAudit(@ModelAttribute("parole")Parole parole,Model model){
		//RevokeParole RevokeParole1=paroleService.forSysDic(parole);//数据字典格式转换
		if(!StringUtils.isBlank(parole.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(parole.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(parole);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("parole", parole);
		model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		return "modules/assess/Parole/paroleAudit";
	}
	@RequestMapping("/paroleDetail")
	public String paroleDetail(@ModelAttribute("parole")Parole parole,Model model){
		//RevokeParole RevokeParole1=paroleService.forSysDic(parole);//数据字典格式转换
		if(!StringUtils.isBlank(parole.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(parole.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(parole);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("parole", parole);
		model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		return "modules/assess/Parole/paroleDetail";
	}


	
}
