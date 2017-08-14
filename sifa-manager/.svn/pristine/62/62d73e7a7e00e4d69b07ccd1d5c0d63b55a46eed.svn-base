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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.Recidivism;
import com.rowell.sifa.pojo.endcorrect.RecidivismPerhaps;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.RecidivismPerhapsService;
import com.rowell.sifa.service.endcorrect.RecidivismService;
import com.rowell.sifa.service.flow.ProcessDetailService;
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
		

		@RequestMapping(value = { "save"}, method = RequestMethod.POST)
		public String save(RecidivismPerhaps recidivismPerhaps, Model model, HttpServletRequest request) {
			//recidivismPerhapsService.saveOrUpdate(recidivismPerhaps);
			recidivismPerhapsService.insert(recidivismPerhaps);
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			if(!StringUtils.isBlank(recidivismPerhaps.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(recidivismPerhaps);
			}
			ProcessDetail processDetail = new ProcessDetail();
			recidivismPerhapsService.updateByIdSelective(recidivismPerhaps);
			recidivismPerhapsService.saveRecidivismPerhapsAuditStatus(sysAccount.getRoleId(),recidivismPerhaps,processDetail);
			
			return "modules/endcorrect/recidivismPerhaps/recidivismPerhapsList";
		}
		
		@RequestMapping(value = "check", method = RequestMethod.GET)
		public String forCheck(String id, Model model,String auditType, HttpServletRequest request) {
			RecidivismPerhaps recidivismPerhaps=recidivismPerhapsService.findById(id);
			recidivismPerhaps.setAuditType(auditType);
			model.addAttribute("recidivismPerhaps",recidivismPerhaps);
			Culprit culprit=culpritService.findById(recidivismPerhaps.getCulpritId());
			model.addAttribute("culprit",culprit);
			return "modules/endcorrect/recidivismPerhaps/recidivismPerhapsCheck";
		}
		
		@RequestMapping(value = { "check"}, method = RequestMethod.POST)
		public String check(RecidivismPerhaps recidivismPerhaps, Model model, String opinion,String dicDecideType,HttpServletRequest request) {
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			if(!StringUtils.isBlank(recidivismPerhaps.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(recidivismPerhaps);
			}
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setOpinion(opinion);
			processDetail.setDicDecideType(dicDecideType);
			recidivismPerhapsService.updateByIdSelective(recidivismPerhaps);
			recidivismPerhapsService.saveRecidivismPerhapsAuditStatus(sysAccount.getRoleId(),recidivismPerhaps,processDetail);
			if(recidivismPerhaps.getAuditType().equals("workerPrint")){
				Recidivism recidivism=new Recidivism();
				recidivism.setCulpritId(recidivismPerhaps.getCulpritId());
				recidivism.setNewCrime(recidivismPerhaps.getNewCrime());
				recidivism.setRegisterUnit(recidivismPerhaps.getRegisterUnit());
				recidivism.setRegisterTime(recidivismPerhaps.getRegisterTime());
				recidivism.setDicGraspTypeKey(recidivismPerhaps.getDicGraspTypeKey());
				recidivism.setGraspTime(recidivismPerhaps.getGraspTime());
				recidivismService.insert(recidivism);
			}
			return "modules/endcorrect/recidivismPerhaps/recidivismPerhapsList";
		}
	
}
