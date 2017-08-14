package com.rowell.sifa.web.information;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rowell.sifa.pojo.endcorrect.OutOf;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: verbalWarningController  
    * @Description: 短信群发Controller
    * @author ybx 
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="information/groupMessaging")
public class GroupMessagingfController extends BaseController{
	
	
	
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(OutOf outof, Model model, HttpServletRequest request) {
		return "/modules/information/groupMessaging/groupMessagingList";
	}
	


}
