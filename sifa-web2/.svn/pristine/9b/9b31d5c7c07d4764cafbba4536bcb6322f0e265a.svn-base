package com.rowell.sifa.web.monitoring;

import java.util.ArrayList;
import java.util.Iterator;
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

import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.sifa.pojo.monitoring.SfArea;
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
		return "modules/monitoring/terminalArea/terminalAreaList";
	}
	
	@RequestMapping(value = "addcity", method = RequestMethod.GET)
	public String addcity( Model model, HttpServletRequest request) {
		return "modules/monitoring/terminalArea/terminalAreaAddcity";
	}

	@RequestMapping(value = "addArea", method = RequestMethod.GET)
	public String formArea(@RequestParam(value = "remark", required = false,defaultValue = "") String remark, Model model, HttpServletRequest request) {
		model.addAttribute("remark", remark);
		return "modules/monitoring/terminalArea/terminalAreaForm";
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
	public CommonJsonResult addArea( Model model, HttpServletRequest request,
			@RequestParam(value = "custompoName", required = false,defaultValue = "") String custompoName,
			@RequestParam(value = "remark", required = false,defaultValue = "") String remark
			) {
		CommonJsonResult commonJsonResult = null;
		try {
			SfArea sfArea = new SfArea();
			sfArea.setName(custompoName);
			sfArea.setRemark(remark);
			sfAreaService.insert(sfArea);
				
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "保存失败！");
			commonJsonResult.setIsError(true);

			return commonJsonResult;
		}
	}
	
	/**
	 * 验证区域名字
	 * @param model
	 * @param request
	 * @param name
	 * @param remark
	 * @return
	 */
	@RequestMapping(value = "iscustomponame", method = RequestMethod.POST)
	@ResponseBody
	public CommonJsonResult iscustomponame( Model model, HttpServletRequest request,
			@RequestParam(value = "custompoName", required = false,defaultValue = "") String custompoName
			) {
		CommonJsonResult commonJsonResult = null;
		try {
			SfArea sfArea = new SfArea();
			sfArea.setName(custompoName);
			List<SfArea> list = sfAreaService.findAll(sfArea);
			Boolean flag = true;
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getName().equals(custompoName)) {
						flag = false;
					}
				}
			}
			if (flag) {
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("验证通过");
			}
			else {
				commonJsonResult = CommonJsonResult.build(500, "已存在该地区！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(500, "已存在该地区！");
			commonJsonResult.setIsError(true);

			return commonJsonResult;
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
			//@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "name", required = false, defaultValue = "") String name,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		//PageHelper.startPage(page, getPageSize());
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
