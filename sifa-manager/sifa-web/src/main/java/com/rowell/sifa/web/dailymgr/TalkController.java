package com.rowell.sifa.web.dailymgr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.TaskService;
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
import com.rowell.sifa.pojo.dailymgr.Talk;
import com.rowell.sifa.pojo.endcorrect.RedressStop;
import com.rowell.sifa.pojo.rewardspunishment.Parole;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.dailymgr.TalkService;
import com.rowell.sifa.web.base.BaseController;


/**  
 * @ClassName: InterviewController  
 * @Description: TODO(谈话教育控制层)  
 * @author FWY  
 * @date 2017年4月7日  
 */
@Controller
@RequestMapping(value = "/dailymgr/talk")
public class TalkController extends BaseController{
	
	@Autowired
	private TalkService talkService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Talk talk, Model model, HttpServletRequest request) {
		return "modules/dailymgr/talk/talkList";
	}

	/**
	 * 
	 * @Title: list  
	 * @Description: 谈话教育列表  
	 * @param parole
	 * @param page
	 * @param request
	 * @param response
	 * @param model
	 * @return EUDataGridResult    返回类型  
	 * @throws
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Talk talk,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(talk.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(talk.getOrderStr());
		}

		List<Talk> list = talkService.findAll(talk);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		//填充实体类
		for(Talk talkEntity:list){
			talkEntity=talkService.addCulpritToTalk(talkEntity);
	       }
		PageInfo<Talk> pageInfo = new PageInfo<Talk>(list);

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
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "add")
	public String add(Talk talk, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(talk.getId())) {
			Talk talk1 = talkService.findById(talk.getId());
			model.addAttribute("talk", talk1);
		}
		return "modules/dailymgr/talk/talkAdd";
		
	}
	
	/**
	 * 跳转到详情页面
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "detail")
	public String detail(Talk talk, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(talk.getId())) {
			Talk talk1 = talkService.findById(talk.getId());
			model.addAttribute("talk", talk1);
		}
		return "modules/dailymgr/talk/talkDetail";
		
	}
	
	/**
	 * 新增谈话记录
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Talk talk, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,Integer reportType1) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, talk)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(talk.getId())) {
					talkService.saveOrUpdate(talk);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				talkService.updateByIdSelective(talk);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(talk.getId())) {
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
	 * 删除谈话记录
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Talk talk, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			
			talkService.batchDelete(talk.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
}
