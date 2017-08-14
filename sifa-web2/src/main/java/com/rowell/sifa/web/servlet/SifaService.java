package com.rowell.sifa.web.servlet;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.pojo.sys.SysCallBackmsg;
import com.rowell.sifa.service.dailymgr.CallCheckService;
import com.rowell.sifa.service.dailymgr.CallRegisterService;
import com.rowell.sifa.service.sys.SysCallBackmsgService;

@Path("/sifaWebService")
public class SifaService extends SpringBeanAutowiringSupport {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(SifaService.class);

	private static final long serialVersionUID = 1L;

	@Autowired
	private SysCallBackmsgService sysCallBackmsgService;
	@Autowired
	private CallCheckService callCheckService;
	@Autowired
	private CallRegisterService callRegisterService;

	@POST
	@Produces(MediaType.TEXT_PLAIN)
	public String getNormalInfo(String xmlString) {
		if (xmlString == null || xmlString.length() <= 0) {
			return "error";
		}
		String result = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "<SIFA>";
		String tempStr = "";
		// JSON业务逻辑都写这
		try {
			System.out.println(xmlString);
			JSONObject json = null;
			if (!xmlString.startsWith("<")) {
				json = new JSONObject(xmlString);
			}
			System.out.println(json);
			if (json != null && (json.get("operateid") != null || json.get("telno") != null || json.get("state") != null
					|| json.get("fileurl") != null)) {
				String method = (String) json.get("method");
				String operateid = (String) json.get("operateid");
				String telno = (String) json.get("telno");
				String state = (String) json.get("state");
				String fileurl = (String) json.get("fileurl");
				if (operateid.equals("0")) {	//电话报到
					if (state.equals("0")) {
						System.out.println("用户录音完成！");
					}
					if (state.equals("1")) {
						System.out.println("用户录音中途挂机！");
					}
					if (state.equals("-2")) {
						System.out.println("用户还没有开始录音就挂机！");
					}
//					callCheckService.addPhoneReport(state, telno, fileurl);
//					callCheckService.addPhoneReportHistory(state, telno, fileurl);
				}
				else{							//声纹注册和抽查
					
					if (state.equals("-1")) {
						System.out.println("用户正在振铃！");
					}
					if (state.equals("-3")) {
						System.out.println("用户电话已经接通！");
					}
					if (state.equals("0")) {
						System.out.println("用户认证通过，成功，认证通过很快就会挂机！");
						callCheckService.addCheck(operateid, telno, fileurl, Constants.CALLCHECK_REGISTER_YZTG, "");
					}
					if (state.equals("1")) {
						System.out.println("认证失败1次，认证不通过可能还会继续认证！");
						callCheckService.addCheck(operateid, telno, fileurl, Constants.CALLCHECK_REGISTER_YZSB, Constants.CALL_CHECKSTATE_SBYC);
					}
					if (state.equals("2")) {
						System.out.println("认证失败2次，认证不通过可能还会继续认证！");
						callCheckService.addCheck(operateid, telno, fileurl, Constants.CALLCHECK_REGISTER_YZSB, Constants.CALL_CHECKSTATE_SBEC);
					}
					if (state.equals("3")) {
						System.out.println("认证失败3次，系统最多认证3次！");
						callCheckService.addCheck(operateid, telno, fileurl, Constants.CALLCHECK_REGISTER_YZSB, Constants.CALL_CHECKSTATE_SBSC);
					}
					if (state.equals("10")) {
						System.out.println("用户登记成功！");
//						callRegisterService.addRegister(operateid, telno, fileurl, Constants.CALLREGISTER_STATE_YZC);
					}
					if (state.equals("11")) {
						System.out.println("用户登记失败！");
//						callRegisterService.addRegister(operateid, telno, fileurl, Constants.CALLREGISTER_STATE_ZCSB);
					}
					if (state.equals("12")) {
						System.out.println("录音成功，正在训练声纹！");
					}
					if (state.equals("-2")) {
						System.out.println("用户超时没有接电话！");
//						if (callRegisterService.isRegister(telno)) {
//							callCheckService.addCheck(operateid, telno, fileurl, Constants.CALLCHECK_REGISTER_YZSB, Constants.CALL_CHECKSTATE_YHCS);
//						}
					}
					if (state.equals("-4")) {
						System.out.println("用户还没有的登记，系统没有找到用户的声纹模型，但是web发起了认证的呼叫！");
						callCheckService.addCheck(operateid, telno, fileurl, Constants.CALLCHECK_REGISTER_YZSB, Constants.CALL_CHECKSTATE_SWDJ);
					}
					if (state.equals("-5")) {
						System.out.println("由于没有空闲的外拨线路导致外拨失败！");
					}
					if (state.equals("-6")) {
						System.out.println("认证外拨接通之后，用户认证过程中,中途挂机！");
						callCheckService.addCheck(operateid, telno, fileurl, Constants.CALLCHECK_REGISTER_YZSB, Constants.CALL_CHECKSTATE_ZTGJ);
					}
				}
				
				try {
					SysCallBackmsg sysCallBackmsg = new SysCallBackmsg();
					sysCallBackmsg.setMethod(method);
					sysCallBackmsg.setOperateid(operateid);
					sysCallBackmsg.setTelno(telno);
					sysCallBackmsg.setState(state);
					sysCallBackmsg.setFileurl(fileurl);
					sysCallBackmsgService.insert(sysCallBackmsg);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				return "{\"result\":\"true\"}";
			} else {
				try {
//					Map model = service.getModel(xmlString);
//					String method = (String) model.get("method");
//					logger.info("***************************" + method);
					result += tempStr;
				} catch (Exception e) {
					e.printStackTrace();
					logger.error("接口调用错误qqqq：" + e);
				}
				System.out.println("xml**2" + result);
				return result;
			}
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return tempStr;
	}
}
