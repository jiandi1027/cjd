package com.rowell.sifa.web.monitoring;

import java.util.ArrayList;
import java.util.Date;
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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.monitoring.SfArea;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.service.monitoring.SfAreaService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: TerminalAreaController
 * @Description: TODO(电子围栏Controller)
 * @author fwy
 * @date 2017年4月03日
 */
@Controller
@RequestMapping(value = "/monitoring/terminalArea")
public class TerminalAreaController extends BaseController{
	@Autowired
	SfAreaService sfAreaService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String test( Model model, HttpServletRequest request) {
		return "modules/monitoring/terminalArea/list";
	}
	/**
	 * 添加区域
	 * @param model
	 * @param request
	 * @param name
	 * @param remark
	 * @return
	 */
	@RequestMapping(value = "addArea", method = RequestMethod.POST)
	@ResponseBody
	public String addArea( Model model, HttpServletRequest request,
			@RequestParam(value = "name", required = false,defaultValue = "") String name,
			@RequestParam(value = "remark", required = false,defaultValue = "") String remark
			) {
		SfArea sfArea = new SfArea();
		sfArea.setName(name);
		if(sfAreaService.findAll(sfArea)!=null&&sfAreaService.findAll(sfArea).size()>0){
			return "0";
		}else{
			sfArea.setRemark(remark);
			sfAreaService.insert(sfArea);
			return "1";
		}
	}
	/**
	 * 区域列表
	 * @param page
	 * @param name
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "name", required = false, defaultValue = "") String name,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		List<SfArea> list = new ArrayList<SfArea>();
		SfArea sfArea = new SfArea();
		if(name!=null&&!name.equals("")){
			sfArea.setName(name);
		}
		list = sfAreaService.findAll(sfArea);
		PageInfo<SfArea> pageInfo = new PageInfo<SfArea>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	/**
	 * 删除区域
	 * @param model
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "deleteArea", method = RequestMethod.POST)
	@ResponseBody
	public String deleteArea( Model model, HttpServletRequest request,
			@RequestParam(value = "id", required = false,defaultValue = "") String id
			) {
		
		sfAreaService.deleteById(id);
			return "0";
	}
	/**
	 * 更新区域
	 * @param model
	 * @param request
	 * @param id
	 * @param remark
	 * @return
	 */
	@RequestMapping(value = "updateArea", method = RequestMethod.POST)
	@ResponseBody
	public String updateArea( Model model, HttpServletRequest request,
			@RequestParam(value = "id", required = false,defaultValue = "") String id,
			@RequestParam(value = "remark", required = false,defaultValue = "") String remark
			) {
		SfArea record = new SfArea();
		record.setRemark(remark);
		record.setId(id);
		int i =sfAreaService.updateByIdSelective(record);
		if(i==1){
			return "0";
		}else{
			return "1";
		}
			
	}
	
}
