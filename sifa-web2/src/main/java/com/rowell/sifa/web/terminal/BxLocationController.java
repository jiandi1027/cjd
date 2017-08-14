package com.rowell.sifa.web.terminal;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.sys.SysBxOidd;
import com.rowell.sifa.web.base.BaseController;

/**
 *  北向定位Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/bxLocation")
public class BxLocationController extends BaseController {

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
	    * @Description: 北向定位跳转页 
	    * @param @param sysLocation
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysRolet:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysBxOidd sysBxOidd, Model model, HttpServletRequest request) {
		return "modules/sys/sysBxLocationList";
	}
	
	/***
	    * @Title: list  
	    * @Description: 查找北向定位信息
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
	public EUDataGridResult list(SysBxOidd sysBxOidd,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		
		List<SysBxOidd> list =  new ArrayList<SysBxOidd>();
		if (!StringUtils.isBlank(sysBxOidd.getTelnos())) {
//			BxOiddBean bxOidd = new BxOiddBean();
			
			//测试list
			String []telnos = sysBxOidd.getTelnos().split(",");
			for (int i = 0; i < telnos.length; i++) {
//				SysBxOidd record = bxOidd.oiddByTelno(telnos[i]);
						
				SysBxOidd record = new SysBxOidd();
				record.setTelnos(sysBxOidd.getTelnos());
				record.setResultCode(testi(i));
				record.setTelno(telnos[i]);
				record.setForwardStatus(testi(i));
				record.setForwardNumber("");
				record.setActiveStatus(testi(i));
				record.setAccountStatus(testi(i));
				record.setSearchTime(new Date());
				
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
	
	public String testi(int i){
		if (i%2 == 0) {
			return "1";
		}
		else return "0";
	}
	
}
