package com.rowell.sifa.web.datacenter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**  
    * @ClassName: SystemFile  
    * @Description: 制度文件控制层
    * @author Administrator  
    * @date 2017年4月6日  
    *    
    */
@Controller
@RequestMapping(value="/datacenter/systemFile")
public class SystemFile {
	
	@RequestMapping
	public String forList(Model model, HttpServletRequest request){
		
		return "/modules/datacenter/systemFile/systemFileList";
	}
}
