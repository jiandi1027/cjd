package com.rowell.sifa.web.dailymgr;

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
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.dailymgr.Interview;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.dailymgr.InterviewService;
import com.rowell.sifa.web.base.BaseController;


/**  
 * @ClassName: InterviewController  
 * @Description: TODO(走访登记控制层)  
 * @author FWY  
 * @date 2017年4月7日  
 */
@Controller
@RequestMapping(value = "/dailymgr/interview")
public class InterviewController extends BaseController {
	
	@Autowired
	InterviewService interviewService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(AskLeave askLeave, Model model, HttpServletRequest request) {
		return "modules/dailymgr/interview/interviewList";
	}
	/**
	 * 
	 * @Title: list  
	 * @Description: 走访登记列表  
	 * @param page
	 * @param request
	 * @param response
	 * @param model
	 * @return EUDataGridResult    返回类型  
	 * @throws
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Interview interview,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(interview.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(interview.getOrderStr());
		}

		List<Interview> list = interviewService.findAll(interview);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		//填充实体类
		for(Interview interviewEntity:list){
			interviewEntity=interviewService.addCulpritToInterview(interviewEntity);
	       }
		PageInfo<Interview> pageInfo = new PageInfo<Interview>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	/**
	 * 跳转到增加页面
	 * @param Interview
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "add")
	public String add(Interview interview, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(interview.getId())) {
			Interview interview1 = interviewService.findById(interview.getId());
			model.addAttribute("interview", interview1);
		}
		return "modules/dailymgr/interview/interviewAdd";
		
	}
	
	/**
	 * 跳转到详情页面
	 * @param Interview
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "detail")
	public String detail(Interview interview, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(interview.getId())) {
			Interview interview1 = interviewService.findById(interview.getId());
			model.addAttribute("interview", interview1);
		}
		return "modules/dailymgr/interview/interviewDetail";
		
	}
	
	/**
	 * 新增走访登记
	 * @param Interview
	 * @param model
	 * @param request
	 * @return
	 */
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Interview interview, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,Integer reportType1) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, interview)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(interview.getId())) {
				interviewService.saveOrUpdate(interview);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				interviewService.updateByIdSelective(interview);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(interview.getId())) {
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
	 * 删除走访登记
	 * @param interview
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Interview interview, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			
			interviewService.batchDelete(interview.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
}

