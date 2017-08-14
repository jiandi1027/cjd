package com.rowell.sifa.web.information;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rowell.common.pojo.EasyUITreeNode;
import com.rowell.sifa.pojo.endcorrect.OutOf;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: verbalWarningController  
    * @Description: 工作人员短信群发Controller
    * @author ybx 
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="information/staffGroupMessaging")
public class StaffGroupMessagingController extends BaseController{
	@Autowired
	private SysAccountService sysAccountService;
	
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(OutOf outof, Model model, HttpServletRequest request) {
		return "/modules/information/staffGroupMessaging/staffGroupMessagingList";
	}
	
	@RequestMapping(value = "tree")
	@ResponseBody
	public List<EasyUITreeNode> loadGroupTree(HttpServletResponse response){  
	        //得到所有角色  
		List<EasyUITreeNode> list = sysAccountService.getSysGroupTreeJson();  
	      
 

	    return list;  
	}  
}
