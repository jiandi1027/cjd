package com.rowell.sifa.web.dailymgr;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.dailymgr.Interview;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.InterviewService;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;


/**  
 * @ClassName: InterviewController  
 * @Description: TODO(走访登记控制层)  
 * @author FWY  
 * @date 2017年4月7日  
 */
@Controller
@RequestMapping(value = "/dailymgr/interview")
public class InterviewController extends BaseController {
	
	@Autowired
	InterviewService interviewService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	SysAccountService sysAccountService;
	@Autowired
	private SysFileService sysFileService;
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(AskLeave askLeave, Model model, HttpServletRequest request) {
		return "modules/dailymgr/interview/interviewList";
	}
	/**
	 * 
	 * @Title: list  
	 * @Description: 走访登记列表  
	 * @param page
	 * @param request
	 * @param response
	 * @param model
	 * @return EUDataGridResult    返回类型  
	 * @throws
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Interview interview,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(interview.getOrderStr())) {
			PageHelper.orderBy("t.updated desc");
		} else {
			PageHelper.orderBy(interview.getOrderStr());
		}

		List<Interview> list = interviewService.findAll(interview);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		for(Interview interviewEntity:list){
			//走访地址查询
			//interviewService.Areaformate(interviewEntity);
			//走访人
			String accountIds=interviewEntity.getInterviewPerson();
			String[] accountId=accountIds.split(",");
			String interviewPerson="";
			for(int i=0;i<=accountId.length-1;i++){
				SysAccount sysAccount1=sysAccountService.findById(accountId[i]);
				if(sysAccount1!=null){
					interviewPerson=interviewPerson+sysAccountService.findById(accountId[i]).getAccountname() + ",";
				}
			}
			if(!StringUtils.isBlank(interviewPerson)){
				interviewPerson=interviewPerson.substring(0,interviewPerson.length()-1);
			}
			interviewEntity.setInterviewPerson(interviewPerson);
		}
		PageInfo<Interview> pageInfo = new PageInfo<Interview>(list);

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
	 * @param Interview
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "add")
	public String add(Interview interview, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(interview.getId())) {
			
			Interview interview1 = interviewService.findById(interview.getId());
			if(interview1!=null){
				SysFile sysFile = new SysFile();
				sysFile.setTableName(Constants.FILE_TABLE_INTERVIEW);
				sysFile.setTableId(interview1.getId());
				sysFile.setFileType(Constants.FILE_INTERVIEW);
				List<SysFile> fileList=sysFileService.findAll(sysFile);
				model.addAttribute("fileList",fileList);
			}
			model.addAttribute("interview", interview1);
		}
		return "modules/dailymgr/interview/interviewAdd";
		
	}
	
	/**
	 * 跳转到详情页面
	 * @param Interview
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "detail")
	public String detail(Interview interview, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(interview.getId())) {
			Interview interview1 = interviewService.findById(interview.getId());
//			String s  = interview1.getInterviewPlace();
//			 String[] str=s.split(",");
//			 interview1.setAddressPro(str[0]);
//			 interview1.setAddressCity(str[1]);
//			 interview1.setAddressCountry(str[2]);
//				if(str.length>=4){
//					interview1.setAddressStreet(str[3]);
//				}
//				if(str.length>=5){
//					interview1.setAddressDetail(str[4]);
//				}
//				
//					//走访地址查询
//					interviewService.Areaformate(interview1);
					//走访人
					String accountIds=interview1.getInterviewPerson();
					String[] accountId=accountIds.split(",");
					String interviewPerson="";
					for(int i=0;i<=accountId.length-1;i++){
						SysAccount sysAccount1=sysAccountService.findById(accountId[i]);
						if(sysAccount1!=null){
							interviewPerson=interviewPerson+sysAccountService.findById(accountId[i]).getAccountname() + ",";
						}
					}
					if(!StringUtils.isBlank(interviewPerson)){
						interviewPerson=interviewPerson.substring(0,interviewPerson.length()-1);
					}
					interview1.setInterviewPerson(interviewPerson);
					if(interview1!=null){
						SysFile sysFile = new SysFile();
						sysFile.setTableName(Constants.FILE_TABLE_INTERVIEW);
						sysFile.setTableId(interview1.getId());
						sysFile.setFileType(Constants.FILE_INTERVIEW);
						List<SysFile> fileList=sysFileService.findAll(sysFile);
						model.addAttribute("fileList",fileList);
					}
			model.addAttribute("interview", interview1);
		}
		return "modules/dailymgr/interview/interviewDetail";
		
	}
	
	/**
	 * 新增走访登记
	 * @param Interview
	 * @param model
	 * @param request
	 * @return
	 */
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Interview interview, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,Integer reportType1) {
		CommonJsonResult commonJsonResult = null;
		//String s = interview.getAddressPro()+","+interview.getAddressCity()+","+interview.getAddressCountry()+","+interview.getAddressStreet()+","+interview.getAddressDetail();
		//interview.setInterviewPlace(s);
		try {
			if (!beanValidator(model, interview)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}else  {
				List<SysFile> fileList=getSysFiles(); 
				interviewService.saveOrUpdate(interview);
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_INTERVIEW, interview.getId(), Constants.FILE_INTERVIEW);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} 
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(interview.getId())) {
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
	 * 删除走访登记
	 * @param interview
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Interview interview, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			
			interviewService.batchDelete(interview.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	/**
	 * 删除走访登记
	 * @param interview
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Interview interview, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			
			interviewService.deleteById(interview.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	//档案返回走访登记页面
	@RequestMapping(value = "inerviewDoclist", method = RequestMethod.GET)
	public String inerviewDoclist(Interview interview, Model model, HttpServletRequest request) {
		model.addAttribute("interview", interview);	
		model.addAttribute("culprit", culpritService.findById(interview.getCulpritId()));
		return "modules/dailymgr/documentManage/interviewDoc";
	}
}

