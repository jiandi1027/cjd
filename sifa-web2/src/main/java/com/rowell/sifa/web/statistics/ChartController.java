package com.rowell.sifa.web.statistics;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.sys.utils.SysDicUtils;
import com.rowell.sifa.web.base.BaseController;
//import com.sun.tools.extcheck.Main;

@Controller
@RequestMapping(value = "/statistics/chart")
public class ChartController extends BaseController{
	@Autowired
	CulpritService culpritService;
	@Autowired
	private SysGroupService sysGroupService;
	@RequestMapping(value = "manage", method = RequestMethod.GET)
	public String forList(Model model, HttpServletRequest request) {
		return "modules/statistics/chart/chartManage";
	}
	/**
	 * 
	    * @Title: 按照性别统计 
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param model
	    * @param @param request
	    * @param @param groupId
	    * @param @param searchEndDate
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "sex")
	public String sex(Model model, HttpServletRequest request,
			String groupId,String dicStatusKey,String searchStartDate,String searchEndDate) {
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchStartDate", searchStartDate);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("dicStatusKey", dicStatusKey);
		return "modules/statistics/chart/sex/sex";
	}
	
	//刑罚类型统计图
	@RequestMapping(value = "sexMap")
	public String sexMap(Model model, HttpServletRequest request,
			String groupId,String dicStatusKey,String searchStartDate,String searchEndDate) {
		if(groupId==null || "".equals(groupId)){
			groupId=SysAccountUtils.getSysAccount().getGroupId();
		}
		if(searchEndDate==null || "".equals(searchEndDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			searchEndDate= sdf.format(new Date());
		}
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("searchStartDate", searchStartDate);
		String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
		if("".equals(status)){
			status="全部";
		}
		model.addAttribute("status", status);
		model.addAttribute("dicStatusKey", dicStatusKey);
		model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
		return "modules/statistics/chart/sex/sexMap";
	}
	//刑罚类型统计表
	@RequestMapping(value = "sexBook")
	public String sexBook(Model model, HttpServletRequest request,
			String groupId,String dicStatusKey,String searchStartDate,String searchEndDate) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		if(groupId==null || "".equals(groupId)){
			groupId=sysAccount.getGroupId();
		}
		model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
		model.addAttribute("sysAccount",sysAccount);
		Date startDate=null; 
		Date endDate=null; 
		if(searchStartDate!=null && !"".equals(searchStartDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate =  sdf.parse(searchStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if(searchEndDate==null || "".equals(searchEndDate)){
			endDate=new Date();
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				endDate =  sdf.parse(searchEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
		if("".equals(status)){
			status="全部";
		}
		model.addAttribute("status", status);
		model.addAttribute("endDate", endDate);
		model.addAttribute("startDate", startDate);
		List<Map<String,String>> sexMap = culpritService.groupBySex(groupId,dicStatusKey, startDate,endDate);
		model.addAttribute("sexMap", sexMap);
		Integer total=0;
		Double totalPercent=0.00;
		for(Map<String,String> map:sexMap ){
			Object ob1=map.get("COUNT");
			Object ob2=map.get("PERCENT");
			String PERCENT=ob2.toString();
			PERCENT=PERCENT.substring(0, PERCENT.length()-1);//去掉%
			totalPercent+=Double.parseDouble(PERCENT);
			total+=Integer.parseInt(ob1.toString());
		}
		model.addAttribute("total", total);
		totalPercent=Double.parseDouble(String.format("%.2f", totalPercent));
		model.addAttribute("totalPercent", totalPercent+"%");
		return "modules/statistics/chart/sex/sexBook";
	}
		
		//性别数据
		@RequestMapping(value = "getSex")
		@ResponseBody
		public List<Map<String,String>> getSex(Model model, HttpServletRequest request,
				String groupId,String dicStatusKey,String searchStartDate,String searchEndDate) {
			if(groupId==null || "".equals(groupId)){
				groupId=SysAccountUtils.getSysAccount().getGroupId();
			}
			Date startDate=null;
			Date endDate=null; 
			if(searchStartDate!=null && !"".equals(searchStartDate)){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					startDate =  sdf.parse(searchStartDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			
			
			if(searchEndDate==null || "".equals(searchEndDate)){
				endDate=new Date();
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					endDate =  sdf.parse(searchEndDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}

			List<Map<String,String>> sexMap = culpritService.groupBySex(groupId,dicStatusKey,startDate,endDate);
			return sexMap;
		}
	

	/**
	 * 
	    * @Title: 按照年龄统计
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "age")
	public String age(Model model, HttpServletRequest request,String groupId,
			String dicStatusKey,String searchStartDate,String searchEndDate) {
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchStartDate", searchStartDate);
		model.addAttribute("dicStatusKey", dicStatusKey);
		model.addAttribute("searchEndDate", searchEndDate);
		return "modules/statistics/chart/age/age";
	}
	
	
	//年龄统计图
	@RequestMapping(value = "ageMap")
	public String ageMap(Model model, HttpServletRequest request,String groupId,
			String dicStatusKey,String searchStartDate,String searchEndDate) {
		if(groupId==null || "".equals(groupId)){
			groupId=SysAccountUtils.getSysAccount().getGroupId();
		}
		if(searchEndDate==null || "".equals(searchEndDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			searchEndDate= sdf.format(new Date());
		}
		
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("searchStartDate", searchStartDate);
		String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
		if("".equals(status)){
			status="全部";
		}
		model.addAttribute("status", status);
		model.addAttribute("dicStatusKey", dicStatusKey);
		model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
		return "modules/statistics/chart/age/ageMap";
	}
	//年龄统计表
	@RequestMapping(value = "ageBook")
	public String ageBook(Model model, HttpServletRequest request,String groupId,
			String dicStatusKey,String searchStartDate,String searchEndDate) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		if(groupId==null || "".equals(groupId)){
			groupId=sysAccount.getGroupId();
		}
		model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
		model.addAttribute("sysAccount",sysAccount);
		Date startDate=null; 
		Date endDate=null; 
		if(searchStartDate!=null && !"".equals(searchStartDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate =  sdf.parse(searchStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if(searchEndDate==null || "".equals(searchEndDate)){
			endDate=new Date();
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				endDate =  sdf.parse(searchEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
		if("".equals(status)){
			status="全部";
		}
		model.addAttribute("status", status);
		model.addAttribute("endDate", endDate);
		model.addAttribute("startDate", startDate);
		List<Map<String,String>> ageMap = culpritService.groupByAge(groupId,dicStatusKey,startDate,endDate);
		Double totalPercent=0.00;//总的百分比
		if(ageMap.size()>0){
			Map<String,String> map=ageMap.get(0);
			Object ob1=map.get("PERCENT18");
			Object ob2=map.get("PERCENT45");
			Object ob3=map.get("PERCENT60");
			Object ob4=map.get("PERCENTUP");
			String percent18=ob1.toString();
			String percent45=ob2.toString();
			String percent60=ob3.toString();
			String percentUp=ob4.toString();
			percent18=percent18.substring(0, percent18.length()-1);//去掉%
			percent45=percent45.substring(0, percent45.length()-1);//去掉%
			percent60=percent60.substring(0, percent60.length()-1);//去掉%
			percentUp=percentUp.substring(0, percentUp.length()-1);//去掉%
			totalPercent=Double.parseDouble(percent18)+Double.parseDouble(percent45)+Double.parseDouble(percent60)+Double.parseDouble(percentUp);
			totalPercent=Double.parseDouble(String.format("%.2f", totalPercent));//保留2位小数
			map.put("totalPercent", totalPercent+"%");
		}
		model.addAttribute("ageMap", ageMap);
		model.addAttribute("totalPercent", totalPercent+"%");
		return "modules/statistics/chart/age/ageBook";
	}
		
		//年龄数据
		@RequestMapping(value = "getAge")
		@ResponseBody
		public List<Map<String,String>> getAge(Model model, HttpServletRequest request,
				String groupId,String dicStatusKey,String searchStartDate,String searchEndDate) {
			if(groupId==null || "".equals(groupId)){
				groupId=SysAccountUtils.getSysAccount().getGroupId();
			}
			Date startDate=null;
			Date endDate=null; 
			if(searchStartDate!=null && !"".equals(searchStartDate)){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					startDate =  sdf.parse(searchStartDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			
			
			if(searchEndDate==null || "".equals(searchEndDate)){
				endDate=new Date();
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					endDate =  sdf.parse(searchEndDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}

			List<Map<String,String>> ageMap = culpritService.groupByAge(groupId,dicStatusKey,startDate,endDate);
			return ageMap;
		}
	
	
	
	
	/**
	 * 
	    * @Title: 刑罚类型统计
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param model
	    * @param @param request
	    * @param @param groupId
	    * @param @param searchEndDate
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "penalType")
	public String penalType(Model model, HttpServletRequest request,String groupId,
			String dicStatusKey,String searchStartDate,String searchEndDate) {
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("searchStartDate", searchStartDate);
		model.addAttribute("dicStatusKey", dicStatusKey);
		return "modules/statistics/chart/penalType/penalType";
	}
	
	//刑罚类型统计图
		@RequestMapping(value = "penalTypeMap")
		public String penalTypeMap(Model model, HttpServletRequest request,String groupId,
				String dicStatusKey,String searchStartDate,String searchEndDate) {
			if(groupId==null || "".equals(groupId)){
				groupId=SysAccountUtils.getSysAccount().getGroupId();
			}
			if(searchEndDate==null || "".equals(searchEndDate)){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				searchEndDate= sdf.format(new Date());
			}
			model.addAttribute("groupId", groupId);
			model.addAttribute("searchEndDate", searchEndDate);
			model.addAttribute("searchStartDate", searchStartDate);
			String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
			if("".equals(status)){
				status="全部";
			}
			model.addAttribute("status", status);
			model.addAttribute("dicStatusKey", dicStatusKey);
			model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
			return "modules/statistics/chart/penalType/penalTypeMap";
		}
		//刑罚类型统计表
		@RequestMapping(value = "penalTypeBook")
		public String penalTypeBook(Model model, HttpServletRequest request,String groupId,
				String dicStatusKey,String searchStartDate,String searchEndDate) {
			SysAccount sysAccount=SysAccountUtils.getSysAccount();
			if(groupId==null || "".equals(groupId)){
				groupId=sysAccount.getGroupId();
			}
			model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
			model.addAttribute("sysAccount",sysAccount);
			Date startDate=null; 
			Date endDate=null; 
			if(searchStartDate!=null && !"".equals(searchStartDate)){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					startDate =  sdf.parse(searchStartDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			
			if(searchEndDate==null || "".equals(searchEndDate)){
				endDate=new Date();
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					endDate =  sdf.parse(searchEndDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			
			String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
			if("".equals(status)){
				status="全部";
			}
			model.addAttribute("status", status);
			model.addAttribute("endDate", endDate);
			model.addAttribute("startDate", startDate);
			List<Map<String,String>> penalTypeMap = culpritService.groupByPenalType(groupId,dicStatusKey,startDate,endDate);
			model.addAttribute("penalTypeMap", penalTypeMap);
			Integer total=0;
			Double totalPercent=0.00;
			for(Map<String,String> map:penalTypeMap ){
				Object ob1=map.get("COUNT");
				Object ob2=map.get("PERCENT");
				String PERCENT=ob2.toString();
				PERCENT=PERCENT.substring(0, PERCENT.length()-1);//去掉%
				totalPercent+=Double.parseDouble(PERCENT);
				total+=Integer.parseInt(ob1.toString());
			}
			model.addAttribute("total", total);
			totalPercent=Double.parseDouble(String.format("%.2f", totalPercent));
			model.addAttribute("totalPercent", totalPercent+"%");
			return "modules/statistics/chart/penalType/penalTypeBook";
		}
	
	//刑罚类型图标数据
	@RequestMapping(value = "getPenalType")
	@ResponseBody
	public List<Map<String,String>> getPenalType(Model model, HttpServletRequest request,
			String dicStatusKey,String groupId,String searchStartDate,String searchEndDate) {
		if(groupId==null || "".equals(groupId)){
			groupId=SysAccountUtils.getSysAccount().getGroupId();
		}
		Date startDate=null;
		Date endDate=null; 
		if(searchStartDate!=null && !"".equals(searchStartDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate =  sdf.parse(searchStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		
		if(searchEndDate==null || "".equals(searchEndDate)){
			endDate=new Date();
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				endDate =  sdf.parse(searchEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		List<Map<String,String>> penalTypeMap = culpritService.groupByPenalType(groupId,dicStatusKey,startDate,endDate);
		return penalTypeMap;
	}
	
	/**
	 * 
	    * @Title: 户籍类型 
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param model
	    * @param @param request
	    * @param @param groupId
	    * @param @param searchEndDate
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "hjlx")
	public String hklx(Model model, HttpServletRequest request,String groupId,
			String dicStatusKey,String searchStartDate,String searchEndDate) {
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("searchStartDate", searchStartDate);
		model.addAttribute("dicStatusKey", dicStatusKey);
		return "modules/statistics/chart/hjlx/hjlx";
	}
	
	
	//户籍类型统计图
	@RequestMapping(value = "hjlxMap")
	public String hjlxMap(Model model, HttpServletRequest request,
			String dicStatusKey,String groupId,String searchStartDate,String searchEndDate) {
		if(groupId==null || "".equals(groupId)){
			groupId=SysAccountUtils.getSysAccount().getGroupId();
		}
		if(searchEndDate==null || "".equals(searchEndDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			searchEndDate= sdf.format(new Date());
		}
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("searchStartDate", searchStartDate);
		String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
		if("".equals(status)){
			status="全部";
		}
		model.addAttribute("status", status);
		model.addAttribute("dicStatusKey", dicStatusKey);
		model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
		return "modules/statistics/chart/hjlx/hjlxMap";
	}
	//犯罪类型统计表
	@RequestMapping(value = "hjlxBook")
	public String hjlxBook(Model model, HttpServletRequest request,String groupId,
			String dicStatusKey,String searchStartDate,String searchEndDate) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		if(groupId==null || "".equals(groupId)){
			groupId=sysAccount.getGroupId();
		}
		model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
		model.addAttribute("sysAccount",sysAccount);
		Date startDate=null; 
		Date endDate=null; 
		if(searchStartDate!=null && !"".equals(searchStartDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate =  sdf.parse(searchStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if(searchEndDate==null || "".equals(searchEndDate)){
			endDate=new Date();
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				endDate =  sdf.parse(searchEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
		if("".equals(status)){
			status="全部";
		}
		model.addAttribute("status", status);
		model.addAttribute("endDate", endDate);
		model.addAttribute("startDate", startDate);
		List<Map<String,String>> hjlxMap = culpritService.groupByHklx(groupId,dicStatusKey,startDate,endDate);
		model.addAttribute("hjlxMap", hjlxMap);
		Integer total=0;
		Double totalPercent=0.00;
		for(Map<String,String> map:hjlxMap ){
			Object ob1=map.get("COUNT");
			Object ob2=map.get("PERCENT");
			String PERCENT=ob2.toString();
			PERCENT=PERCENT.substring(0, PERCENT.length()-1);//去掉%
			totalPercent+=Double.parseDouble(PERCENT);
			total+=Integer.parseInt(ob1.toString());
		}
		model.addAttribute("total", total);
		totalPercent=Double.parseDouble(String.format("%.2f", totalPercent));
		model.addAttribute("totalPercent", totalPercent+"%");
		return "modules/statistics/chart/hjlx/hjlxBook";
	}
	
	//统计图获取数据
	@RequestMapping(value = "getHjlx")
	@ResponseBody
	public List<Map<String,String>> getHjlx(Model model, HttpServletRequest request,
			String dicStatusKey,String searchStartDate,String groupId,String searchEndDate) {
		if(groupId==null || "".equals(groupId)){
			groupId=SysAccountUtils.getSysAccount().getGroupId();
		}
		Date startDate=null;
		Date endDate=null; 
		if(searchStartDate!=null && !"".equals(searchStartDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate =  sdf.parse(searchStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		
		if(searchEndDate==null || "".equals(searchEndDate)){
			endDate=new Date();
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				endDate =  sdf.parse(searchEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		List<Map<String,String>> hjlxMap = culpritService.groupByHklx(groupId,dicStatusKey,startDate,endDate);
		return hjlxMap;
	}
	
	
	
	/**
	 * 
	    * @Title: 犯罪类型统计
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param model
	    * @param @param request
	    * @param @param groupId
	    * @param @param searchEndDate
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "crimeInfo")
	public String crimeInfo(Model model, HttpServletRequest request,String groupId,
			String dicStatusKey,String searchStartDate,String searchEndDate) {
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("searchStartDate", searchStartDate);
		model.addAttribute("dicStatusKey", dicStatusKey);
		return "modules/statistics/chart/crimeInfo/crimeInfo";
	}
	
	//犯罪类型统计图
	@RequestMapping(value = "crimeInfoMap")
	public String crimeInfoMap(Model model, HttpServletRequest request,String groupId,
			String dicStatusKey,String searchStartDate,String searchEndDate) {
		if(groupId==null || "".equals(groupId)){
			groupId=SysAccountUtils.getSysAccount().getGroupId();
		}
		if(searchEndDate==null || "".equals(searchEndDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			searchEndDate= sdf.format(new Date());
		}
		model.addAttribute("groupId", groupId);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("searchStartDate", searchStartDate);
		String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
		if("".equals(status)){
			status="全部";
		}
		model.addAttribute("status", status);
		model.addAttribute("dicStatusKey", dicStatusKey);
		model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
		return "modules/statistics/chart/crimeInfo/crimeInfoMap";
	}
	//犯罪类型统计表
	@RequestMapping(value = "crimeInfoBook")
	public String crimeInfoBook(Model model, HttpServletRequest request,
			String dicStatusKey,String groupId,String searchStartDate,String searchEndDate) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();
		if(groupId==null || "".equals(groupId)){
			groupId=sysAccount.getGroupId();
		}
		model.addAttribute("groupName", sysGroupService.findById(groupId).getName());
		model.addAttribute("sysAccount",sysAccount);
		Date startDate=null; 
		Date endDate=null; 
		if(searchStartDate!=null && !"".equals(searchStartDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate =  sdf.parse(searchStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		if(searchEndDate==null || "".equals(searchEndDate)){
			endDate=new Date();
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				endDate =  sdf.parse(searchEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		String status=SysDicUtils.getSysDicValueByKey("common_table", "dicStatusKey", dicStatusKey, "");
		if("".equals(status)){
			status="全部";
		}
		model.addAttribute("status", status);
		model.addAttribute("endDate", endDate);
		model.addAttribute("startDate", startDate);
		List<Map<String,String>> crimeMap = culpritService.groupByCrimeType(groupId,dicStatusKey,startDate,endDate);
		model.addAttribute("crimeMap", crimeMap);
		Integer total=0;
		Double totalPercent=0.00;
		for(Map<String,String> map:crimeMap ){
			Object ob1=map.get("COUNT");
			Object ob2=map.get("PERCENT");
			String PERCENT=ob2.toString();
			PERCENT=PERCENT.substring(0, PERCENT.length()-1);//去掉%
			totalPercent+=Double.parseDouble(PERCENT);
			total+=Integer.parseInt(ob1.toString());
		}
		model.addAttribute("total", total);
		totalPercent=Double.parseDouble(String.format("%.2f", totalPercent));
		model.addAttribute("totalPercent", totalPercent+"%");
		return "modules/statistics/chart/crimeInfo/crimeInfoBook";
	}
	
	//统计图获取数据
	@RequestMapping(value = "getCrimeInfo")
	@ResponseBody
	public List<Map<String,String>> getCrimeInfo(Model model, HttpServletRequest request,
			String dicStatusKey,String groupId,String searchStartDate,String searchEndDate) {
		if(groupId==null || "".equals(groupId)){
			groupId=SysAccountUtils.getSysAccount().getGroupId();
		}
		Date startDate=null;
		Date endDate=null; 
		if(searchStartDate!=null && !"".equals(searchStartDate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate =  sdf.parse(searchStartDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		
		if(searchEndDate==null || "".equals(searchEndDate)){
			endDate=new Date();
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				endDate =  sdf.parse(searchEndDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		List<Map<String,String>> crimeMap = culpritService.groupByCrimeType(groupId,dicStatusKey,startDate,endDate);
		return crimeMap;
	}
	
}
