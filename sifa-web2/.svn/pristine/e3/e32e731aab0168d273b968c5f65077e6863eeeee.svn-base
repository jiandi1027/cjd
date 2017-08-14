package com.rowell.sifa.web.sys;

import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.pojo.sys.SysDicQuery;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.sys.utils.SysDicUtils;
import com.rowell.sifa.web.base.BaseController;

/**
 *  数据字典Controller
 * 
 * @author marcle
 * @version 2017-03-8
 */
@Controller
@RequestMapping(value = "/sys/sysDic")
public class SysDicController extends BaseController {

	@Autowired
	private SysDicService sysDicService;

	@ModelAttribute("sysDic")
	public SysDic get(@RequestParam(required = false) String id) {
		try {
			if (StringUtils.isNotBlank(id)) {
				return sysDicService.findById(id);
			} else {
				return new SysDic();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new SysDic();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 数据字典跳转页 
	    * @param @param sysDic
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysDic sysDic, Model model, HttpServletRequest request) {
		return "modules/sys/sysDicList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找数据字典
	    * @param @param sysDic
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(SysDicQuery sysDic,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(sysDic.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(sysDic.getOrderStr());
		}

		List<SysDic> list = sysDicService.findAll(sysDic);

		PageInfo<SysDic> pageInfo = new PageInfo<SysDic>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = "findSysDicByTabNameAndColumnName")
	@ResponseBody
	public List<SysDic> findSysDicByTabNameAndColumnName(@RequestParam(value = "tabName") String tabName,@RequestParam(value = "columnName") String columnName,@RequestParam(value = "notNeParentId") String notNeParentId){
//		SysDicQuery sysDicQuery = new SysDicQuery();
//		sysDicQuery.setTabName(tabName);
//		sysDicQuery.setColumnName(columnName);
//		sysDicQuery.setNotNeParentId(notNeParentId);
//		
//		List<SysDic> list = sysDicService.findAll(sysDicQuery);
//		SysDicUtils.getSysDicList(tabName, columnName, notNeParentId);
		
		return SysDicUtils.getSysDicList(tabName, columnName, notNeParentId);
	}
	/***
	 * 
	    * @Title: getDicValue  
	    * @Description: 根据key 表名、列名 获取数据字典的值
	    * @param @param tabName
	    * @param @param columnName
	    * @param @param key
	    * @param @return    参数  
	    * @return SysDic    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "getDicValue")
	@ResponseBody
	public String getDicValue(@RequestParam(value = "tabName") String tabName,@RequestParam(value = "columnName") String columnName,@RequestParam(value = "key") String key){
//		SysDicQuery sysDicQuery = new SysDicQuery();
//		sysDicQuery.setTabName(tabName);
//		sysDicQuery.setColumnName(columnName);
//		sysDicQuery.setKey(key);
//		sysDicQuery.setOrderStr("DIC_SORT asc");
//
//		List<SysDic> list = sysDicService.findAll(sysDicQuery);
//		if(list!=null && list.size()>0){
//			return list.get(0);
//		}else{
//			return null;
//		}
		return SysDicUtils.getSysDicValueByKey(tabName, columnName, key, "");
		
	}
	

	/***
	 * 
	    * @Title: getDicValue  
	    * @Description: 根据key 表名、列名 获取数据字典的值
	    * @param @param tabName
	    * @param @param columnName
	    * @param @param key
	    * @param @return    参数  
	    * @return SysDic    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "getDicKey")
	@ResponseBody
	public SysDic getDicKey(@RequestParam(value = "tabName") String tabName,@RequestParam(value = "columnName") String columnName,@RequestParam(value = "value") String value){
		SysDicQuery sysDicQuery = new SysDicQuery();
		sysDicQuery.setTabName(tabName);
		sysDicQuery.setColumnName(columnName);
		sysDicQuery.setValue(value);
		sysDicQuery.setOrderStr("DIC_SORT asc");

		List<SysDic> list = sysDicService.findAll(sysDicQuery);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
		
	}

	
	@RequestMapping(value = "getListByTabColumnName")
	@ResponseBody
	public List<SysDic> getListByTabColumnName(@RequestParam(value = "tabName",required=true) String tabName,@RequestParam(value = "columnName",required=true) String columnName,@RequestParam(value = "showAll",defaultValue="0") Integer showAll){
		List<SysDic> sysDicts = SysDicUtils.getSysDicList(tabName, columnName, "");
		if(sysDicts!=null && sysDicts.size()>0){
			sysDicts.remove(new SysDic("-1"));
			if(showAll==1){
				sysDicts.add(0, new SysDic("-1","","全部"));
			}
		}
		
		return sysDicts;
		
	}

	/**
	 * 
	    * @Title: getDicValueByParent  
	    * @Description: 通过上级key查找 
	    * @param @param  tabName
	    * @param @param columnName
	    * @param @param parentKey
	    * @param @return    参数  
	    * @return SysDic    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "getDicValueByParent")
	@ResponseBody
	public List<SysDic> getDicValueByParent(@RequestParam(value = "tabName") String tabName,@RequestParam(value = "columnName") String columnName,@RequestParam(value = "parentKey") String parentKey,@RequestParam(value = "showAll",defaultValue="0") Integer showAll){
//		SysDicQuery sysDicQuery = new SysDicQuery();
//		sysDicQuery.setTabName(tabName);
//		sysDicQuery.setColumnName(columnName);
//		sysDicQuery.setParentKey(parentKey);
//		sysDicQuery.setOrderStr("dic_sort asc");
//		List<SysDic> list = sysDicService.findAll(sysDicQuery);
//		if(list!=null && list.size()>0){
//			return list;
//		}else{
//			return null;
//		}
		List<SysDic> sysDicts = SysDicUtils.getSysDicList(tabName, columnName, parentKey);
		if(sysDicts!=null && sysDicts.size()>0){
			sysDicts.remove(new SysDic("-1"));
			if(showAll==1){
				sysDicts.add(0, new SysDic("-1","","全部"));
			}
		}
		
		return sysDicts;
		
	}
	@RequestMapping(value = "getDicOnlyByParent")
	@ResponseBody
	public List<SysDic> getDicOnlyByParent(@RequestParam(value = "parentKey") String parentKey,String key){
		SysDicQuery sysDicQuery = new SysDicQuery();
		sysDicQuery.setParentKey(parentKey);
		List<SysDic> list = sysDicService.findAll(sysDicQuery);
		if(list!=null && list.size()>0){
			List<SysDic> regulatoryList = new ArrayList<SysDic>();
			if(key!=null&&key!=""){
				for(int i=0;i<list.size();i++){
					if(!key.equals(list.get(i).getKey())){
						regulatoryList.add(list.get(i));
					}
			}
			return regulatoryList;
		}
   			return list;
		}else{
			return null;
		}
		
	}

	// @RequiresPermissions("sys:sysDic:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("sysDic") SysDic sysDic, Model model) {
		return "modules/sys/sysDicForm";
	}
	
	@RequestMapping(value = "parentForm")
	public String parentForm(@ModelAttribute("sysDic") SysDic sysDic, Model model) {
		return "modules/sys/sysDicParentForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑数据字典  
	    * @param @param sysDic
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDic:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SysDic sysDic, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, sysDic)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(sysDic.getId())) {
				sysDicService.saveOrUpdate(sysDic);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存数据字典"+sysDic.getKey()+"成功");
			} else {
				sysDicService.updateByIdSelective(sysDic);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改数据字典"+sysDic.getKey()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(sysDic.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存数据字典"+sysDic.getKey()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改数据字典"+sysDic.getKey()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除数据字典  
	    * @param @param sysDic
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDic:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(SysDic sysDic, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysDicService.deleteById(sysDic.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除数据字典成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除数据字典失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除数据字典  
	    * @param @param sysDic
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDic:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(SysDic sysDic, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysDicService.batchDelete(sysDic.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除数据字典成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除数据字典失败！", true);
		}
		return commonJsonResult;
	}


}
