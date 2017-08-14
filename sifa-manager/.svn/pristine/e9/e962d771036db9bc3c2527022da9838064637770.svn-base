package com.rowell.sifa.web.dailymgr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
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
import com.rowell.sifa.pojo.dailymgr.SmsCulprit;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.dailymgr.SmsCulpritService;
import com.rowell.sifa.vo.dailymgr.AskLeaveCustom;
import com.rowell.sifa.web.base.BaseController;

/**  
    * @ClassName: AskLeaveController  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author yxb
    * @date 2017年3月1日  
    *    
    */
@Controller
@RequestMapping(value = "/dailymgr/smsCulprit")
public class SmsCulpritController extends BaseController {
	@Autowired
	private SmsCulpritService smsCulpritService;
	


	@ModelAttribute("smsCulprit")
	public SmsCulprit get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return smsCulpritService.findById(id);
		} else {
			return new SmsCulprit();
		}
	}

	// @RequiresPermissions("dailymgr:dailymgrDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SmsCulprit smsCulprit, Model model, HttpServletRequest request) {
		return "modules/dailymgr/smsCulprit/smsCulpritList";
	}
	

	

	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(SmsCulprit smsCulprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(smsCulprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(smsCulprit.getOrderStr());
		}
		List<SmsCulprit> list = smsCulpritService.findAll(smsCulprit);
		PageInfo<SmsCulprit> pageInfo = new PageInfo<SmsCulprit>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

}
