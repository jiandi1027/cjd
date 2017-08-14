package com.rowell.sifa.web.endcorrect;

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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.Recidivism;
import com.rowell.sifa.pojo.endcorrect.RecidivismPerhaps;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.RecidivismPerhapsService;
import com.rowell.sifa.service.endcorrect.RecidivismService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: verbalWarningController  
    * @Description: 口头警告Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/endcorrect/recidivismPerhaps")
public class RecidivismPerhapsController extends BaseController{
	@Autowired
	private RecidivismPerhapsService recidivismPerhapsService;
	@Autowired
	private RecidivismService recidivismService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private SysFileService sysFileService;
	
	@ModelAttribute("recidivismPerhaps")
	public RecidivismPerhaps get(@RequestParam( value="id",required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return recidivismPerhapsService.findById(id);
		}else{
			return new RecidivismPerhaps();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RecidivismPerhaps recidivismPerhaps, Model model, HttpServletRequest request) {
		return "modules/endcorrect/recidivismPerhaps/recidivismPerhapsList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(RecidivismPerhaps recidivismPerhaps,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(recidivismPerhaps.getGroupId())){
			recidivismPerhaps.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(recidivismPerhaps.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(recidivismPerhaps.getOrderStr());
		}
		List<RecidivismPerhaps> list = recidivismPerhapsService.findAll(recidivismPerhaps);
		for(RecidivismPerhaps recidivismPerhap:list){
			if(!StringUtils.isBlank(recidivismPerhap.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(recidivismPerhap);
			}
		}
		PageInfo<RecidivismPerhaps> pageInfo = new PageInfo<RecidivismPerhaps>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
		//跳转到增加页面
		@RequestMapping(value = "add")
		public String forAdd(RecidivismPerhaps recidivismPerhaps, Model model, HttpServletRequest request) {
			return "modules/endcorrect/recidivismPerhaps/recidivismPerhapsAdd";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			RecidivismPerhaps recidivismPerhaps=recidivismPerhapsService.findById(id);
			model.addAttribute("recidivismPerhaps",recidivismPerhaps);
			if(!StringUtils.isBlank(recidivismPerhaps.getProcessInstanceId())){
				model.addAttribute("processDetails", processDetailService.findByProcessInsId(recidivismPerhaps.getProcessInstanceId()));
			}
			Culprit culprit=culpritService.findById(recidivismPerhaps.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/recidivismPerhaps/recidivismPerhapsDetail";
		}
		
		
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(RecidivismPerhaps recidivismPerhaps, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				List<SysFile> fileList=getSysFiles(); 
				if (!beanValidator(model, recidivismPerhaps)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				recidivismPerhapsService.insert(recidivismPerhaps);
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				if(!StringUtils.isBlank(recidivismPerhaps.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(recidivismPerhaps);
				}
				ProcessDetail processDetail = new ProcessDetail();
				recidivismPerhapsService.updateByIdSelective(recidivismPerhaps);
				recidivismPerhapsService.saveRecidivismPerhapsAuditStatus(sysAccount.getRoleId(),recidivismPerhaps,processDetail);
				if(!StringUtils.isBlank(recidivismPerhaps.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(recidivismPerhaps);
				}
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_RECIDIVISM_PERHAPS, recidivismPerhaps.getId(), Constants.FILE_RECIDIVISM_PERHAPS_UNGUILTY);
				//behaviorManageService.save(recidivismPerhaps.getProcessInstanceId(), recidivismPerhaps.getId(), recidivismPerhaps.getCulpritId(), recidivismPerhaps.getIsEnd(), Constants.BEH_MAN_TYPE_RECIDIVISM_PERHAPS);
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}

		
		@RequestMapping(value = "forCheck", method = RequestMethod.GET)
		public String forCheck(String id, Model model,String auditType, HttpServletRequest request) {
			RecidivismPerhaps recidivismPerhaps=recidivismPerhapsService.findById(id);
			recidivismPerhaps.setAuditType(auditType);
			model.addAttribute("recidivismPerhaps",recidivismPerhaps);
			Culprit culprit=culpritService.findById(recidivismPerhaps.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/recidivismPerhaps/recidivismPerhapsCheck";
		}
		
		@RequestMapping(value = "check")
		@ResponseBody
		public CommonJsonResult check(RecidivismPerhaps recidivismPerhaps, String opinion,String dicDecideType,HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, recidivismPerhaps)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				if(!StringUtils.isBlank(recidivismPerhaps.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(recidivismPerhaps);
				}
				ProcessDetail processDetail = new ProcessDetail();
				processDetail.setOpinion(opinion);
				processDetail.setDicDecideType(dicDecideType);
				recidivismPerhapsService.updateByIdSelective(recidivismPerhaps);
				recidivismPerhapsService.saveRecidivismPerhapsAuditStatus(sysAccount.getRoleId(),recidivismPerhaps,processDetail);
				if(!StringUtils.isBlank(recidivismPerhaps.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(recidivismPerhaps);
				}
				//behaviorManageService.save(recidivismPerhaps.getProcessInstanceId(), recidivismPerhaps.getId(), recidivismPerhaps.getCulpritId(), recidivismPerhaps.getIsEnd(), Constants.BEH_MAN_TYPE_RECIDIVISM_PERHAPS);
				if(recidivismPerhaps.getIsEnd()==1){
					Culprit culprit=culpritService.findById(recidivismPerhaps.getCulpritId());
					Recidivism recidivism=new Recidivism();
					recidivism.setCulpritId(recidivismPerhaps.getCulpritId());
					recidivism.setNewCrime(recidivismPerhaps.getNewCrime());
					recidivism.setRegisterUnit(recidivismPerhaps.getRegisterUnit());
					recidivism.setRegisterTime(recidivismPerhaps.getRegisterTime());
					recidivism.setDicGraspTypeKey(recidivismPerhaps.getDicGraspTypeKey());
					recidivism.setGraspTime(recidivismPerhaps.getGraspTime());
					recidivismService.insert(recidivism,culprit);
				}
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("审批成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "审批失败", true);
				return commonJsonResult;
			}
		}
		
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(RecidivismPerhaps recidivismPerhaps,Model model){
			try {
				ProcessUtils.endProcess("endevent1", recidivismPerhaps.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
			}
		}
		
		@RequestMapping(value = "forProcessDetail")
		public String forProcessDetail(@ModelAttribute("recidivismPerhaps") RecidivismPerhaps recidivismPerhaps, Model model){
			model.addAttribute("recidivismPerhaps", recidivismPerhaps);
			return "modules/endcorrect/recidivismPerhaps/recidivismPerhapsProcessDetail";
		}

}
