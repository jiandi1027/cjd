package com.rowell.sifa.web.homepage;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.rowell.sifa.commons.shiro.ShiroUser;
import com.rowell.sifa.pojo.homepage.Announcement;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.homepage.AnnouncementService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: AskLeaveController
 * @Description: 公告管理(这里用一句话描述这个类的作用)
 * @author yxb
 * @date 2017年3月1日
 * 
 */
@Controller
@RequestMapping(value = "/homepage/announcement")
public class AnnouncementController extends BaseController {
	@Autowired
	AnnouncementService announcementService;
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private SysFileService sysFileService;

	@ModelAttribute("receipt")
	public Announcement get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return announcementService.findById(id);
		} else {
			return new Announcement();
		}
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Announcement announcement, Model model, HttpServletRequest request) {
		
		return "/modules/homepage/announcement/announcementList";
	}

	@RequestMapping(value = { "list", "" },method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Announcement announcement,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		
		if( StringUtils.isBlank(announcement.getOrderStr()) ) {
			PageHelper.orderBy("t.RELEASE_DATE desc");
		} 
		else {
			PageHelper.orderBy(announcement.getOrderStr());
		}
		
		if( announcement.getAnnouncementTopic() != null && announcement.getAnnouncementTopic() != "" ) {
			announcement.setAnnouncementTopic( "%" + announcement.getAnnouncementTopic() + "%" ) ;
		}

		if( announcement.getSearchEndDate() != null ) {
			String searchEndDate = new SimpleDateFormat("yyyy-MM-dd").format(announcement.getSearchEndDate()) + " 23:59:59" ;
			try{
				announcement.setSearchEndDate( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(searchEndDate) ) ;
			}catch (Exception e) {
			}
		}
		
		List<Announcement> list = announcementService.findAll(announcement);
		PageInfo<Announcement> pageInfo = new PageInfo<Announcement>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = "form", method = RequestMethod.GET)
	public String add(@ModelAttribute("announcement")Announcement announcement, Model model, HttpServletRequest request) {
		
		return "/modules/homepage/announcement/announcementForm";
	}
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Announcement announcement, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, announcement)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(announcement.getId())) {
				announcement.setPlaceTheUnit(sysGroupService.findById(announcement.getPlaceTheUnit()).getName());
				ShiroUser activeUser = SysAccountUtils.getPrincipal();
				announcement.setReleasePeople(activeUser.getLoginName());
				announcement.setReleaseDate(new Date());
				announcementService.insert(announcement);
				List<SysFile> fileList = getSysFiles();
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_COMMEND, announcement.getId(), Constants.FILE_COMMEND_BY_PATH);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "保存失败！");
			commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("announcement")Announcement announcement, Model model) {
		model.addAttribute("announcement", announcementService.findById(announcement.getId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(announcement.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/homepage/announcement/announcementDetail";
	}

}
