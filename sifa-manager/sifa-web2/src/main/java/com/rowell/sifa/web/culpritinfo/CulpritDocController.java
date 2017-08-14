package com.rowell.sifa.web.culpritinfo;

import java.util.Date;
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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritDoc;
import com.rowell.sifa.pojo.culpritinfo.CulpritFamily;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.culpritinfo.CulpritResume;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritDocService;
import com.rowell.sifa.service.culpritinfo.CulpritFamilyService;
import com.rowell.sifa.service.culpritinfo.CulpritLawService;
import com.rowell.sifa.service.culpritinfo.CulpritResumeService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;
import com.rowell.sifa.common.utils.Constants;
/**
 *  文档Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/culpritDoc")
public class CulpritDocController extends BaseController {

	@Autowired
	private CulpritDocService culpritDocService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private CulpritLawService culpritLawService;
	@Autowired
	private CulpritResumeService culpritResumeService;
	@Autowired
	private CulpritFamilyService culpritFamilyService;
	@Autowired
	private SysFileService sysFileService;
	@ModelAttribute("culpritDoc")
	public CulpritDoc get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritDocService.findById(id);
		} else {
			return new CulpritDoc();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 文档跳转页 
	    * @param @param culpritDoc
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoct:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CulpritDoc culpritDoc, Model model, HttpServletRequest request) {
		return "modules/sys/culpritDocList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找文档
	    * @param @param culpritDoc
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
	public EUDataGridResult list(CulpritDoc culpritDoc,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritDoc.getOrderStr())) {
			PageHelper.orderBy("update_date desc");
		} else {
			PageHelper.orderBy(culpritDoc.getOrderStr());
		}

		List<CulpritDoc> list = culpritDocService.findAll(culpritDoc);

		PageInfo<CulpritDoc> pageInfo = new PageInfo<CulpritDoc>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:culpritDoc:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {

		return "modules/sys/culpritDocForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑文档  
	    * @param @param culpritDoc
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(CulpritDoc culpritDoc, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, culpritDoc)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			//安置帮教协议书（办理入矫时增加）
			List<SysFile> fileList=getSysFiles("legalDocs");
			commonJsonResult=culpritDocService.saveCulpritDoc(culpritDoc, fileList);
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritDoc.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存文档"+culpritDoc.getName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改文档"+culpritDoc.getName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除文档  
	    * @param @param culpritDoc
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(CulpritDoc culpritDoc, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritDocService.deleteById(culpritDoc.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除文档成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除文档失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除文档  
	    * @param @param culpritDoc
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(CulpritDoc culpritDoc, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritDocService.batchDelete(culpritDoc.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除文档成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除文档失败！", true);
		}
		return commonJsonResult;
	}
	
	@RequestMapping(value = "bjxy")
	public String bjxy(Culprit culprit, Model model) {
		culprit=culpritService.findById(culprit.getId());
		model.addAttribute("culprit", culprit);
		//安置帮教协议书
		SysFile azbj = new SysFile();
		azbj.setOrderStr("created asc");
		azbj.setTableId(culprit.getId());
		azbj.setFileType(Constants.FILE_CULPRIT_DOC_AZBJ);
		List<SysFile> azbjList = sysFileService.findAll(azbj);
		model.addAttribute("azbjList", azbjList);
		return "modules/culprit/bjxy";
	}
	
	@RequestMapping(value = "docManager")
	public String docManager(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {
		model.addAttribute("culprit", culpritService.findById(culpritDoc.getCulpritId()));
		return "modules/dailymgr/documentManage/culpritDoc";
	}
	
	// 查看服刑人员基本信息
		@RequestMapping(value = "printJBXX")
		public String printJBXX(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {
			model.addAttribute("culprit", culpritService.findById(culpritDoc.getCulpritId()));
			model.addAttribute("nowDate", new Date());
			CulpritLaw culpritLaw = new CulpritLaw();//法律文书
			culpritLaw.setCulpritId(culpritDoc.getCulpritId());
			List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
			if (list.size() > 0) {
				model.addAttribute("culpritLaw",list.get(0));
			}
			CulpritResume culpritResume=new CulpritResume();//个人简历
			culpritResume.setCulpritId(culpritDoc.getCulpritId());
			List<CulpritResume> list1=culpritResumeService.findAll(culpritResume);
			model.addAttribute("culpritResumeList",list1);
			
			CulpritFamily culpritFamily=new CulpritFamily();
			culpritFamily.setCulpritId(culpritDoc.getCulpritId());
			List<CulpritFamily> list2=culpritFamilyService.findAll(culpritFamily);
			model.addAttribute("culpritFamilyList",list2);
			
			return "modules/dailymgr/documentManage/docPrint/sqfxryjbxxb";
		}
	
	// 查看矫正报到通知
	@RequestMapping(value = "printJZBDTZ")
	public String printJZBDTZ(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {
		model.addAttribute("culprit", culpritService.findById(culpritDoc.getCulpritId()));
		model.addAttribute("nowDate", new Date());
		return "modules/dailymgr/documentManage/docPrint/sqfxryjzbdtz";
	}	
	
	// 查看社区服刑人员报到通知书
		@RequestMapping(value = "printBDTZS")
		public String printBDTZS(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {
			model.addAttribute("culprit", culpritService.findById(culpritDoc.getCulpritId()));
			CulpritLaw culpritLaw=new CulpritLaw();
			culpritLaw.setCulpritId(culpritDoc.getCulpritId());
			List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
			if (list.size() > 0) {
				for(CulpritLaw c:list){
					if(c.getIndictmentNum()!=null){
						model.addAttribute("culpritLaw",c);
					}
				}
			}
			model.addAttribute("nowDate", new Date());
			return "modules/dailymgr/documentManage/docPrint/sqfxrybdtzs";
		}	
		
		//社区服刑人员档案查阅审批表
		@RequestMapping(value = "printDocSearchTable")
		public String printDocSearchTable(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {
			model.addAttribute("culprit", culpritService.findById(culpritDoc.getCulpritId()));
			model.addAttribute("nowDate", new Date());
			return "modules/dailymgr/documentManage/docPrint/docSearchTable";
		}				
		
		//社区服刑人员电子定位监控管理告知书
		@RequestMapping(value = "dingwei")
		public String dingwei(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {
			model.addAttribute("culprit", culpritService.findById(culpritDoc.getCulpritId()));
			model.addAttribute("nowDate", new Date());
			return "modules/dailymgr/documentManage/docPrint/dingwei";
		}		
		
		//文档管理多文档列表	
		@RequestMapping(value = "viewList")
		public String viewInvestigate(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model,String type) {
			model.addAttribute("culprit", culpritService.findById(culpritDoc.getCulpritId()));
			String path="";
			if("48002".equals(type)){
				path="modules/dailymgr/documentManage/docList/investigateList";
			}else if("48007".equals(type)){//居住地变更审批表
				path="modules/dailymgr/documentManage/docList/moveInList1";
			}else if("48008".equals(type)){//社区服刑人员居住地变更证明
				path="modules/dailymgr/documentManage/docList/moveInList2";
			}else if("48009".equals(type)){//特定场所
				path="modules/dailymgr/documentManage/docList/specialList";
			}else if("48010".equals(type)){//社区矫正人员警告审批表
				path="modules/dailymgr/documentManage/docList/warning1";
			}else if("48011".equals(type)){//违反社区矫正规定警告决定书（存根）
				path="modules/dailymgr/documentManage/docList/warning2";
			}else if("48012".equals(type)){//治安管理处罚建议书
				path="modules/dailymgr/documentManage/docList/securitPunishmentList1";
			}else if("48013".equals(type)){//提请撤销缓刑
				path="modules/dailymgr/documentManage/docList/revokeProbationList";
			}else if("48014".equals(type)){//提请撤销假释
				path="modules/dailymgr/documentManage/docList/revokeParoleList";
			}else if("48015".equals(type)){//收监执行建议书
				path="modules/dailymgr/documentManage/docList/imprisonList";
			}else if("48016".equals(type)){//收监执行建议书
				path="modules/dailymgr/documentManage/docList/reducePenaltyList";
			}else if("48017".equals(type)){//提请治安管理处罚
				path="modules/dailymgr/documentManage/docList/securitPunishmentList2";
			}else if("48018".equals(type)){//解除社区矫正证明书
				path="modules/dailymgr/documentManage/docList/finishRedressList1";
			}else if("48019".equals(type)){//解除社区矫正通知书
				path="modules/dailymgr/documentManage/docList/finishRedressList2";
			}else if("48020".equals(type)){//社区服刑人员死亡通知书
				path="modules/dailymgr/documentManage/docList/securitPunishmentList2";
			}else if("49007".equals(type)){//矫正方案
				path="modules/dailymgr/documentManage/docList/schemePlanList";
			}else if("49008".equals(type)){//社区服刑人员个别教育记录表
				path="modules/dailymgr/documentManage/docList/securitPunishmentList2";
			}else if("49018".equals(type)){//社区服刑人员矫正期满鉴定表
				path="modules/dailymgr/documentManage/docList/finishRedressList3";
			}else if("49019".equals(type)){//解除社区矫正宣告书
				path="modules/dailymgr/documentManage/docList/finishRedressList4";
			}
			return path;
		}	
		
		
}
