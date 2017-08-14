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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.rewardspunishment.NoDeal;
import com.rowell.sifa.service.rewardspunishment.NoDealService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: NoDealController  
    * @Description: 待处理作不处理
    * @author zhl 
    * @date 2017年3月14日  
    *
 */
@Controller
@RequestMapping(value="/jiangcheng/noDeal")
public class NoDealController extends BaseController{
	@Autowired
	private NoDealService noDealService;
	
	@ModelAttribute("NoDeal")
	public NoDeal get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return noDealService.findById(id);
		}else{
			return new NoDeal();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(NoDeal NoDeal, Model model, HttpServletRequest request) {
		return "modules/assess/noDealList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(NoDeal noDeal,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(noDeal.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(noDeal.getOrderStr());
		}
		List<NoDeal> list = noDealService.findAll(noDeal);
		PageInfo<NoDeal> pageInfo = new PageInfo<NoDeal>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
}
