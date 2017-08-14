package com.rowell.sifa.web.monitoring;

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
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.TerminalArea;
import com.rowell.sifa.pojo.monitoring.SfArea;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.monitoring.OverAlarmService;
import com.rowell.sifa.service.monitoring.SfAreaService;
import com.rowell.sifa.service.monitoring.TerminalActivityService;
import com.rowell.sifa.service.monitoring.TerminalAreaService;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.web.base.BaseController;
import com.rowell.sifa.web.terminal.LzLocation;

/**
 * 
    * @ClassName: TerminalBindingController  
    * @Description: 终端绑定Controller
    * @author pkx  
    * @date 2017年5月16日  
    *
 */
@Controller
@RequestMapping(value="/monitoring/terminal")
public class TerminalController extends BaseController{
	@Autowired
	private TerminalService terminalService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private SfAreaService sfAreaService;
	@Autowired
	private TerminalAreaService terminalAreaService;
	@Autowired
	private OverAlarmService overAlarmService;
	@Autowired
	private TerminalActivityService terminalActivityService;
	@Autowired
	private TerminalHistoryService terminalHistoryService;
	
	@ModelAttribute("culprit")
	public Culprit get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return culpritService.findById(id);
		}else{
			return new Culprit();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Culprit culprit, Model model, HttpServletRequest request) {
		return "modules/monitoring/terminal/terminalList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Culprit culprit, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(culprit.getGroupId())) {
			culprit.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("bindtime desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}

		culprit.setFinshInfo(1);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		List<Culprit> list = culpritService.findAllWithTerminal(culprit);
		
		PageInfo<Culprit> pageInfo = new PageInfo<Culprit>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	
	//get请求跳转页
	@RequestMapping(value = "form", method = RequestMethod.GET)
	public String form(Culprit culprit , Model model, HttpServletRequest request) {
		Terminal termianl  = new Terminal();
		if(!StringUtils.isBlank(culprit.getId())){
			termianl.setCulpritId(culprit.getId());
		}
		
		List<Terminal> list = terminalService.findAll(termianl);
		if(list.size()>0){
			termianl = list.get(0);	
		}
		
		model.addAttribute("culprit", culprit);
		model.addAttribute("terminal", termianl);
		return "modules/dailymgr/terminalBinding/form";
	}
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Terminal termianl, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, termianl)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(termianl.getId())) {
				terminalService.insert(termianl);
			}
			else terminalService.updateByIdSelective(termianl);
			TerminalArea area =new TerminalArea();
			area.setTerminalid(termianl.getId());
			List<TerminalArea> list = terminalAreaService.findAll(area);
			if(list.size()>0){
				area.setId(list.get(0).getId());
				area.setAreaId(termianl.getAreaId());
				terminalAreaService.updateByIdSelective(area);
			}else{
				area.setAreaId(termianl.getAreaId());
				terminalAreaService.insert(area);
			}
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("绑定成功");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}
	
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Terminal termianl, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, termianl)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
		List<Terminal> terminal1 = terminalService.findAll(termianl);
		if(terminal1.size()>=1){
			terminal1.get(0).setDelFlag(1);
			terminalService.deleteMore(terminal1.get(0));
		}
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("解绑成功！");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}
	
	@RequestMapping(value = { "arealist", "" })
	@ResponseBody
	public List<SfArea> arealist(SfArea sfArea,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if(!StringUtils.isBlank(request.getParameter("q"))){
			sfArea.setName(request.getParameter("q"));
		}
		List<SfArea> list = sfAreaService.findAll1(sfArea);
		
		return list;
	}
	
	@RequestMapping(value = { "isbinding", "" })
	@ResponseBody
	public String isbinding(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Terminal terminal = new Terminal();
		terminal.setCulpritId(culprit.getId());
		List<Terminal> t= terminalService.findAll(terminal);
		if(t.size()>0){
			return "已绑定";
		}
		
		return "未绑定";
	}
	
	@RequestMapping(value = "mobile")
	@ResponseBody
	public CommonJsonResult save(@RequestParam(value = "mobile", required = false, defaultValue = "") String mobile, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			Terminal terminal = new Terminal();
			terminal.setMobileNumber(mobile);
			List<Terminal> terminalList= terminalService.findAll(terminal);
			if (terminalList.size() > 0) {
				commonJsonResult = CommonJsonResult.build(505, "该号码已绑定");
			}
			else commonJsonResult = CommonJsonResult.build(200, "");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult = CommonJsonResult.build(505, "该号码有误，请联系管理员");
		}
	}
	
	@RequestMapping(value = "lzLocation")
	@ResponseBody
	public CommonJsonResult lzLocation(@RequestParam(value = "tels", required = false, defaultValue = "") String tels, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			LzLocation lz = new LzLocation(terminalService, terminalActivityService, terminalHistoryService, terminalAreaService, sfAreaService, overAlarmService);
			String [] telStr = tels.split(",");
			for (int i = 0; i < telStr.length; i++) {
				lz.spcall(telStr[i]);
			}
			
			commonJsonResult = CommonJsonResult.build(200, "");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult = CommonJsonResult.build(505, "");
		}
	}
	
}