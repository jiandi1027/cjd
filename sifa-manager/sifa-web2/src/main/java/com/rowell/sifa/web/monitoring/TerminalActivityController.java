package com.rowell.sifa.web.monitoring;

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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.monitoring.TerminalActivityService;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.sys.utils.OffsetUtil;
import com.rowell.sifa.web.base.BaseController;
import com.rowell.sifa.web.terminal.SpLocation;

/**
 * @ClassName: TerminalActivityController
 * @Description: TODO(实时定位Controller)
 * @author fwy
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/terminalActivity")
public class TerminalActivityController extends BaseController{
	@Autowired
	private TerminalActivityService terminalActivityService;
	@Autowired
	private TerminalHistoryService terminalHistoryService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private TerminalService terminalService;
	
	@ModelAttribute("culprit")
	public Culprit get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritService.findById(id);
		} else {
			return new Culprit();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(TerminalActivity terminalActivity, Model model, HttpServletRequest request) {
		return "modules/monitoring/terminalList";
	}
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Terminal terminal,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(terminal.getGroupId())) {
			terminal.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		if (StringUtils.isBlank(terminal.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(terminal.getOrderStr());
		}
		
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		/*List<Culprit> list = culpritService.findCulpritBySysAccount(sysAccount.getGroupId()+"");*/
		List<Terminal> list = terminalService.findAll(terminal);
//		List<Terminal> list2 = new ArrayList<Terminal>();
//		for(Terminal t :list){
//			if(t.getIsLive()!=null&&!t.getIsLive().equals("")){
//				list2.add(t);
//			}
//			
//		}
		
		PageInfo<Terminal> pageInfo = new PageInfo<Terminal>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	@RequestMapping(value = { "findTerminalActivity", "" })
	@ResponseBody
	public TerminalActivity findTerminalActivity(TerminalActivity terminalActivity,
			@RequestParam(value = "mobileNumber", required = false) String mobileNumber,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		try {
			//SpLocation sl = new SpLocation(terminalActivityService, terminalHistoryService);
			//String result = sl.spCall(mobileNumber);
			//System.out.println("result:" + result);
			
			if(mobileNumber!=null&&mobileNumber!=""){
				terminalActivity.setMobileNumber(mobileNumber);
				List<TerminalActivity> list = terminalActivityService.findAll(terminalActivity);
				if(list.size()==1){
					String s = list.get(0).getTerminalId();
					Terminal t = terminalService.findById(s);
					if (t == null) {
						return null;
					}
					terminalActivity=list.get(0);
					double[] offset = OffsetUtil.transformGPS2MapABC(terminalActivity.getLat(), terminalActivity.getLon());
					terminalActivity.setLatReal(Float.parseFloat(offset[0]+""));
					terminalActivity.setLonReal(Float.parseFloat(offset[1]+""));
					terminalActivity.setCulpritId(t.getCulpritId());
//					terminalActivity.setLocation(OffsetUtil.getMapBarAddr(terminalActivity.getLonReal()+"",terminalActivity.getLatReal()+""));
					terminalActivity.setLocation(OffsetUtil.getMapBarAddr(terminalActivity.getLon()+"",terminalActivity.getLat()+""));
					return terminalActivity;
				}else{
					return null;
				}
			}else{
				return null;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}

	@RequestMapping(value = { "findActivity", "" })
	@ResponseBody
	public EUDataGridResult findActivity(TerminalActivity terminalActivity,
			@RequestParam(value = "mobileNumbers", required = false) String mobileNumbers,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		try {
			String[] mlist = null;
			if(mobileNumbers!=null&&!mobileNumbers.equals("")){
//				mobileNumbers = mobileNumbers.substring(0,mobileNumbers.length()-1);
				 mlist = mobileNumbers.split(",");	
			}
			
			List<TerminalActivity> actlist = new ArrayList<TerminalActivity> ();
			//SpLocation sl = new SpLocation(terminalActivityService, terminalHistoryService);
			if(mlist!=null&&mlist.length>0){
			for(String str:mlist){
				TerminalActivity ter = new TerminalActivity();
				ter.setMobileNumber(str);
				List<TerminalActivity> list = terminalActivityService.findAll(ter);
				if(list.size()==1){
					ter=list.get(0);
					double[] offset = OffsetUtil.transformGPS2MapABC(ter.getLat(), ter.getLon());
					ter.setLatReal(Float.parseFloat(offset[0]+""));
					ter.setLonReal(Float.parseFloat(offset[1]+""));
					actlist.add(ter);
				}
			}
			}
			PageInfo<TerminalActivity> pageInfo = new PageInfo<TerminalActivity>(actlist);
			model.addAttribute("pager", pageInfo);

			// 创建一个返回值对象
			EUDataGridResult result = new EUDataGridResult();
			result.setRows(actlist);
			// 取记录总条数
			result.setTotal(pageInfo.getTotal());

			return result;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	@RequestMapping("splocation")
	public void splocation(TerminalActivity terminalActivity,String telnos, Model model, HttpServletRequest request) {
		try {
			SpLocation sl = new SpLocation(terminalActivityService, terminalHistoryService);
			sl.spCall(telnos);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = { "list1", "" })
	@ResponseBody
	public List<Terminal> list1(Terminal terminal,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if(!StringUtils.isBlank(request.getParameter("q"))){
			terminal.setCulpritName(request.getParameter("q"));
		}
		
		if (StringUtils.isBlank(terminal.getGroupId())) {
			terminal.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		List<Terminal> list = terminalService.findAll(terminal);
		
		return list;
	}
	@RequestMapping(value = { "listm", "" })
	@ResponseBody
	public List<Terminal> listm(Terminal terminal,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if(!StringUtils.isBlank(request.getParameter("q"))){
			terminal.setMobileNumber(request.getParameter("q"));
		}
		
		terminal.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		List<Terminal> list = terminalService.findAll(terminal);
		
		return list;
	}
	
	@RequestMapping(value = "piaoyi")
	public String piaoyi(TerminalActivity terminalActivity, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(terminalActivity.getId())) {
			TerminalActivity record = terminalActivityService.findById(terminalActivity.getId());
			model.addAttribute("terminalActivity", record);
		}
		
		return "modules/monitoring/piaoyi";
	}
	@RequestMapping(value = { "showactlocation", " "})
	@ResponseBody
	public String showactlocation(
			@RequestParam(value = "latReal", required = false,defaultValue = "") String latReal,
			@RequestParam(value = "lonReal", required = false,defaultValue = "") String lonReal,
			 HttpServletRequest request,
			HttpServletResponse response, Model model){
		double[] offset = OffsetUtil.transformMapABC2GPS(Double.valueOf(latReal), Double.valueOf(lonReal));
		
		String s = OffsetUtil.getMapBarAddr(offset[1]+"", offset[0]+"");
		return s;
	}
}
