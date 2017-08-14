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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.Talk;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.TalkService;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;


/**  
 * @ClassName: InterviewController  
 * @Description: TODO(谈话教育控制层)  
 * @author FWY  
 * @date 2017年4月7日  
 */
@Controller
@RequestMapping(value = "/dailymgr/talk")
public class TalkController extends BaseController{
	
	@Autowired
	private TalkService talkService;
	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private SysFileService sysFileService;
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Talk talk, Model model, HttpServletRequest request) {
		return "modules/dailymgr/talk/talkList";
	}

	/**
	 * 
	 * @Title: list  
	 * @Description: 谈话教育列表  
	 * @param parole
	 * @param page
	 * @param request
	 * @param response
	 * @param model
	 * @return EUDataGridResult    返回类型  
	 * @throws
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Talk talk,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(talk.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(talk.getOrderStr());
		}
		if(StringUtils.isBlank(talk.getGroupId())){
			talk.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}

		List<Talk> list = talkService.findAll(talk);
		/*//填充实体类
		for(Talk talkEntity:list){
			String s  = talkEntity.getPlace();
			 String[] str=s.split(",");
			 if(str.length>3){
				 talkEntity.setAddressPro(str[0]);
				 talkEntity.setAddressCity(str[1]);
				 talkEntity.setAddressCountry(str[2]);
				 talkEntity.setAddressStreet(str[3]);
			 }
			 if(str.length>4){
				 talkEntity.setAddressDetail(str[4]);
			 }
			 
			talkEntity=talkService.addCulpritToTalk(talkEntity);
	       }*/
		//地址转换
		for(Talk talkEntity:list){
			//talkService.Areaformate(talkEntity);
			
			String accountIds=talkEntity.getTalkor();
			String[] accountId=accountIds.split(",");
			String talkor="";
			for(int i=0;i<=accountId.length-1;i++){
				SysAccount sysAccount1=sysAccountService.findById(accountId[i]);
				if(sysAccount1!=null){
					talkor=talkor+sysAccountService.findById(accountId[i]).getAccountname() + ",";
				}
			}
			if(!StringUtils.isBlank(talkor)){
				talkor=talkor.substring(0,talkor.length()-1);
			}
			talkEntity.setTalkor(talkor);
		}
		
		PageInfo<Talk> pageInfo = new PageInfo<Talk>(list);

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
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "add")
	public String add(Talk talk, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(talk.getId())) {
			Talk talk1 = talkService.findById(talk.getId());
			if(talk1!=null){
				SysFile sysFile = new SysFile();
				sysFile.setTableName(Constants.FILE_TABLE_TALK);
				sysFile.setTableId(talk1.getId());
				sysFile.setFileType(Constants.FILE_TALK);
				List<SysFile> fileList=sysFileService.findAll(sysFile);
				model.addAttribute("fileList",fileList);
			}
			/*String s  = talk1.getPlace();
			String[] str=s.split(",");
			talk1.setAddressPro(str[0]);
			talk1.setAddressCity(str[1]);
			talk1.setAddressCountry(str[2]);
			if(str.length>=4){
				talk1.setAddressStreet(str[3]);
			}
			if(str.length>=5){
				talk1.setAddressDetail(str[4]);
			}*/
			model.addAttribute("talk", talk1);
		}
		return "modules/dailymgr/talk/talkAdd";
		
	}
	
	/**
	 * 跳转到详情页面
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "detail")
	public String detail(Talk talk, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(talk.getId())) {
			Talk talk1 = talkService.findById(talk.getId());
			//talkService.Areaformate(talk1);
			String accountIds=talk1.getTalkor();
			String[] accountId=accountIds.split(",");
			String talkor="";
			for(int i=0;i<=accountId.length-1;i++){
				SysAccount sysAccount1=sysAccountService.findById(accountId[i]);
				if(sysAccount1!=null){
					talkor=talkor+sysAccountService.findById(accountId[i]).getAccountname() + ",";
				}
			}
			if(!StringUtils.isBlank(talkor)){
				talkor=talkor.substring(0,talkor.length()-1);
			}
			talk1.setTalkor(talkor);
			if(talk1!=null){
				SysFile sysFile = new SysFile();
				sysFile.setTableName(Constants.FILE_TABLE_TALK);
				sysFile.setTableId(talk1.getId());
				sysFile.setFileType(Constants.FILE_TALK);
				List<SysFile> fileList=sysFileService.findAll(sysFile);
				model.addAttribute("fileList",fileList);
			}
			model.addAttribute("talk", talk1);
		}
		return "modules/dailymgr/talk/talkDetail";
		
	}
	
	/**
	 * 新增谈话记录
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Talk talk, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,Integer reportType1) {
		CommonJsonResult commonJsonResult = null;
		//String s = talk.getAddressPro()+","+talk.getAddressCity()+","+talk.getAddressCountry()+","+talk.getAddressStreet()+","+talk.getAddressDetail();
		//talk.setPlace(s);
		try {
			if (!beanValidator(model, talk)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			talkService.saveOrUpdate(talk);

				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				String str=request.getParameter("finshInfo2");
			if(str!=null){
				//首次报道修改状态
				Integer finshInfo2=Integer.parseInt(str);
				if(finshInfo2==1){
					Culprit culprit=new Culprit();
					culprit.setId(talk.getCulpritId());
					culprit.setFinshInfo2(finshInfo2);
					culpritService.updateByIdSelective(culprit);
				}
			}
			List<SysFile> fileList=getSysFiles(); 
			sysFileService.saveFiles(fileList, Constants.FILE_TABLE_TALK, talk.getId(), Constants.FILE_TALK);
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");

			return commonJsonResult;
		}
	}
	/**
	 * 删除谈话记录
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Talk talk, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			
			talkService.batchDelete(talk.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	
	/**
	 * 删除谈话记录
	 * @param Talk
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Talk talk, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			
			talkService.deleteById(talk.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	
	//档案返回谈话教育页面
	@RequestMapping(value = "talkDoclist", method = RequestMethod.GET)
	public String talkDoclist(Talk talk, Model model, HttpServletRequest request) {
		model.addAttribute("talk", talk);	
		model.addAttribute("culprit", culpritService.findById(talk.getCulpritId()));
		return "modules/dailymgr/documentManage/talkDoc";
	}
	
	// 查看首次谈话记录
	@RequestMapping(value = "printfirstTalk")
	public String printfirstTalk(Talk talk, Model model, HttpServletRequest request) {
		if (!StringUtils.isBlank(talk.getId())) {
			Talk talk1 = talkService.findById(talk.getId());
			talkService.Areaformate(talk1);
			String accountIds=talk1.getTalkor();
			String[] accountId=accountIds.split(",");
			String talkor="";
			for(int i=0;i<=accountId.length-1;i++){
				SysAccount sysAccount1=sysAccountService.findById(accountId[i]);
				if(sysAccount1!=null){
					talkor=talkor+sysAccountService.findById(accountId[i]).getAccountname() + ",";
				}
			}
			if(!StringUtils.isBlank(talkor)){
				talkor=talkor.substring(0,talkor.length()-1);
			}
			talk1.setTalkor(talkor);
			model.addAttribute("talk", talk1);
			model.addAttribute("culprit", culpritService.findById(talk1.getCulpritId()));
		}else{//文档管理查看
			if("0".equals(talk.getIsFirstTalk())){
				List<Talk> list = talkService.findAll(talk);
				if(!list.isEmpty()){
					model.addAttribute("talk", list.get(0));
					model.addAttribute("culprit", culpritService.findById(list.get(0).getCulpritId()));
				}
			}
		}
		return "modules/dailymgr/documentManage/docPrint/firstTalk";
	}
	
}
