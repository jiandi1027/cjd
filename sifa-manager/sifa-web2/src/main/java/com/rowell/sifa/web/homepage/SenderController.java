package com.rowell.sifa.web.homepage;


import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.homepage.Sender;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.homepage.SenderService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: AskLeaveController
 * @Description: 发件(这里用一句话描述这个类的作用)
 * @author yxb
 * @date 2017年3月1日
 * 
 */
@Controller
@RequestMapping(value = "/homepage/sender")
public class SenderController extends BaseController {
	@Autowired
	SenderService senderService;
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private SysFileService sysFileService;


	@ModelAttribute("seceipt")
	public Sender get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return senderService.findById(id);
		} else {
			return new Sender();
		}
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Sender sender, Model model, HttpServletRequest request) {
		return "/modules/homepage/sender/senderList";
	}

	@RequestMapping(value = { "list", "" },method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Sender sender,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		sender.setReceiverUnit(SysAccountUtils.getSysAccount().getGroupName());
		sender.setState("已发送");
		
		if( StringUtils.isBlank(sender.getOrderStr()) ) {
			PageHelper.orderBy( "TAKE_TIME desc" ) ;
		} 
		else {
			PageHelper.orderBy(sender.getOrderStr());
		}
		
		if( sender.getSearchEndDate() != null ) {
			String searchEndDate = new SimpleDateFormat("yyyy-MM-dd").format(sender.getSearchEndDate()) + " 23:59:59" ;
			try{
				sender.setSearchEndDate( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(searchEndDate) ) ;
			}catch (Exception e) {
			}
		}
		
		if( "未发送".equals(request.getParameter("state")) ) {
			sender.setState( request.getParameter("state") ) ;
		}
		
		if( sender.getDocumentTitle() != null && sender.getDocumentTitle() != "" ) {
			sender.setDocumentTitle( "%" + sender.getDocumentTitle() + "%" ) ;
		}
		
		sender.setSendUnit(SysAccountUtils.getSysAccount().getGroupName());
		sender.setReceiverUnit( "" ) ;
		System.out.println( "发件单位：" + sender.getSendUnit() ) ;
		System.out.println( "收件单位：" + sender.getReceiverUnit() ) ;
		
		List<Sender> list = senderService.findAll(sender);
		PageInfo<Sender> pageInfo = new PageInfo<Sender>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = "form", method = RequestMethod.GET)
	public String add(@ModelAttribute("sender")Sender sender, Model model, HttpServletRequest request) {
		
		return "/modules/homepage/sender/senderForm";
	}
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Sender sender, HttpServletRequest request,String mark, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, sender)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(sender.getId())) {
				
				sender.setReceiverUnit( sysGroupService.findById(sender.getReceiverUnit()).getName() ) ;
				sender.setSendUnit( SysAccountUtils.getSysAccount().getGroupName() ) ;
				//sender.setReceiverUnit();
				sender.setTakeTime(new Date());
				if("draft".equals(sender.getMark())){
					sender.setFlle3("草稿");
					senderService.insert(sender);
					List<SysFile> fileList = getSysFiles();
					sysFileService.saveFiles(fileList, Constants.FILE_TABLE_COMMEND, sender.getId(), Constants.FILE_COMMEND_BY_PATH);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setMsg("保存成功");
				}else{
					sender.setState("已发送");
					sender.setState1("未读");
					List<SysFile> fileList = getSysFiles();
					sysFileService.saveFiles(fileList, Constants.FILE_TABLE_COMMEND, sender.getId(), Constants.FILE_COMMEND_BY_PATH);
					senderService.insert(sender);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setMsg("发送成功");
				}
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if("draft".equals(sender.getMark())){
				commonJsonResult = CommonJsonResult.build(505, "保存失败！" ) ;
			} else {
				commonJsonResult = CommonJsonResult.build(505, "发送失败！") ;
			}
			
			commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("sender") Sender sender, Model model) {
		model.addAttribute("sender", senderService.findById(sender.getId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(sender.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/homepage/sender/senderDetail";
	}

}
