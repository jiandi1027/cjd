package com.rowell.sifa.web.homepage;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import com.rowell.sifa.pojo.homepage.Sender;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.homepage.SenderService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: AskLeaveController
 * @Description: 收件(这里用一句话描述这个类的作用)
 * @author yxb
 * @date 2017年3月1日
 * 
 */
@Controller
@RequestMapping(value = "/homepage/receipt")
public class ReceiptController extends BaseController {
	@Autowired
	SenderService senderService;
	@Autowired
	SysGroupService sysGroupService;
	@Autowired
	private SysFileService sysFileService;

	@ModelAttribute("receipt")
	public Sender get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return senderService.findById(id);
		} else {
			return new Sender();
		}
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Sender sender, Model model, HttpServletRequest request) {
		
		return "/modules/homepage/receipt/receiptList";
	}

	@RequestMapping(value = { "list", "" })
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
		
		if( "全部".equals(sender.getState1()) ) {
			sender.setState1( "" ) ;
		}
		
		if( sender.getDocumentTitle() != null && sender.getDocumentTitle() != "" ) {
			sender.setDocumentTitle( "%" + sender.getDocumentTitle() + "%" ) ;
		}
		
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
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("receipt") Sender sender, Model model) {
		sender.setState1("已读");
		senderService.updateById(sender);
		model.addAttribute("receipt", sender);
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(sender.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/homepage/receipt/receiptDetail";
	}

}
