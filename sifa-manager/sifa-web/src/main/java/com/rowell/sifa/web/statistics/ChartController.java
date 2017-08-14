package com.rowell.sifa.web.statistics;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.web.base.BaseController;
//import com.sun.tools.extcheck.Main;
@Controller
@RequestMapping(value = "/statistics")
public class ChartController extends BaseController{
	@Autowired
	CulpritService culpritService;
	@RequestMapping(value = "chart", method = RequestMethod.GET)
	public String forList(Model model, HttpServletRequest request) {
		return "modules/statistics/chart";
	}
	@RequestMapping(value = "sex", method = RequestMethod.POST)
	@ResponseBody
	public List<String> sex(Model model, HttpServletRequest request) {
		List<Map<String,String>> sexMap = culpritService.groupBySex();
		Object s11 =sexMap.get(0).get("count");
		String s =s11.toString();
		Object s22 =sexMap.get(1).get("count");
		String s2 = s22.toString();
		List<String> list = new ArrayList<String>();
		list.add(s);
		list.add(s2);
		return list;
	}
	@RequestMapping(value = "age", method = RequestMethod.POST)
	@ResponseBody
	public List<String> age(Model model, HttpServletRequest request) {
		List<Map<String,String>> ageMap = culpritService.groupByAge();
		Object s11 =ageMap.get(0).get("count1");
		Object s22 =ageMap.get(0).get("count2");
		Object s33 =ageMap.get(0).get("count3");
		Object s44 =ageMap.get(0).get("count4");
		String s1 = s11.toString();
		String s2 = s22.toString();
		String s3 = s33.toString();
		String s4 = s44.toString();
		List<String> list = new ArrayList<String>();
		list.add(s1);
		list.add(s2);
		list.add(s3);
		list.add(s4);
		return list;
	}
}
