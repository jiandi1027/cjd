package com.rowell.sifa.web.terminal;

import java.net.MalformedURLException;
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
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.sys.SysLocation;
import com.rowell.sifa.pojo.terminal.TerLocationRes;
import com.rowell.sifa.service.monitoring.SfAreaService;
import com.rowell.sifa.service.monitoring.TerminalActivityService;
import com.rowell.sifa.service.monitoring.TerminalAreaService;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  粗定位Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/spLocation")
public class SpLocationController extends BaseController {
	@Autowired
	private TerminalActivityService terminalActivityService;
	@Autowired
	private TerminalHistoryService terminalHistoryService;

//	@ModelAttribute("spLocation")
//	public SysLocation get(@RequestParam(required = false) String id) {
//		if (StringUtils.isNotBlank(id)) {
//			return sysRoleService.findById(id);
//		} else {
//			return new SysLocation();
//		}
//	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 粗定位跳转页 
	    * @param @param sysLocation
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysRolet:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysLocation sysLocation, Model model, HttpServletRequest request) {
		return "modules/sys/sysSpLocationList";
	}
	
	/***
	    * @Title: list  
	    * @Description: 查找粗定位信息
	    * @param @param sysLocation
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(SysLocation sysLocation,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		
		SpLocation sl = new SpLocation(terminalActivityService, terminalHistoryService);
		List<SysLocation> list =  new ArrayList<SysLocation>();
		if (!StringUtils.isBlank(sysLocation.getTelnos())) {
			list = sl.spCallList(sysLocation.getTelnos());
			
			//测试list
			String []telnos = sysLocation.getTelnos().split(",");
			for (int i = 0; i < telnos.length; i++) {
				SysLocation record = new SysLocation();
				record.setResult(i+"");
				record.setLocationtime(new Date());
//				sysLocation.setHeadString(headString);
				record.setsTotalString("粗定位测试xml" + i);
				record.setType("1");
				record.setTelno(telnos[i]);
				record.setTelnos(sysLocation.getTelnos());
				record.setAddress("粗定位测试地址"+(i+1));
				list.add(record);
			}
			//测试list
		} 
		
		model.addAttribute("list", list);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(list.size());

		return result;
	}
	
	/***
	    * @Title: list  
	    * @Description: 查找粗定位信息
	    * @param @param sysLocation
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "location", method = RequestMethod.POST)
	@ResponseBody
	public CommonJsonResult location(@RequestParam(value = "tel", required = false, defaultValue = "") String tel, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		CommonJsonResult commonJsonResult = null;
		
		try {
			LzLocation lzLocation = new LzLocation();
			TerLocationRes res;
			res = lzLocation.spcallByRes(tel);
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("定位成功");
			commonJsonResult.setData(res);
		} catch (MalformedURLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		return commonJsonResult;
	}
}
