package com.rowell.sifa.web.sys;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.sifa.pojo.terminal.TerminalLocation;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.web.base.BaseController;

import net.sf.json.JSONObject;

/**
 *  定位测试Controller
 * 
 * @author pkx
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/locationtest")
public class SysLocationController extends BaseController {
	@Autowired
	private TerminalService terminalService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Model model, HttpServletRequest request) {
		return "modules/sys/sysLocationTest";
	}

	@RequestMapping(value = "locReq")
	@ResponseBody
	public CommonJsonResult save(HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			String terminal = request.getParameter("terminal");
			String tuType = request.getParameter("tuType");
			String locType = request.getParameter("locType");
			List<TerminalLocation> terminals = new ArrayList<TerminalLocation>();

			TerminalLocation t = new TerminalLocation();
			t.setMdn(terminal);
			t.setTuTpye(tuType);
			terminals.add(t);

			String xml = com.rowell.sifa.web.terminal.LocationUtil.getLocation(terminals,
					Integer.valueOf(locType), 3, 2);
			String xmlStr = com.rowell.sifa.web.terminal.XmlUtil.xml2Json(xml).toString();
			commonJsonResult = new CommonJsonResult(200, "请求成功", false, xmlStr);
			
			String result = com.rowell.sifa.web.terminal.LocationUtil.getLastestLocation(terminals, 1);
			JSONObject json = com.rowell.sifa.web.terminal.XmlUtil.xml2Json(result);
			terminalService.updateTerminal(json);
			
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "请求失败！");

			return commonJsonResult;
		}
	}
}
