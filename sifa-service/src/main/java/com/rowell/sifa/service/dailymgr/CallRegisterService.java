
/**    
* @Title: CallRegisterService.java  
* @Package com.rowell.sifa.service.dailymgr  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年2月28日  
* @version V1.0    
*/

package com.rowell.sifa.service.dailymgr;

import java.io.IOException;
import java.util.List;

//import org.ksoap2.SoapEnvelope;
//import org.ksoap2.SoapFault;
//import org.ksoap2.serialization.SoapObject;
//import org.ksoap2.serialization.SoapSerializationEnvelope;
//import org.ksoap2.transport.HttpTransportSE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
//import org.xmlpull.v1.XmlPullParserException;

import com.rowell.common.utils.IdGen;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.dailymgr.CallRegisterMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.CallRegister;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;

/**
 * @ClassName: CallRegisterService
 * @Description: 声纹注册service
 * @author xiaoguang
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class CallRegisterService extends CrudService<CallRegisterMapper, CallRegister> {
//	@Autowired
//	private CulpritService culpritService;
//	
//	/**
//	 * 声纹注册认证
//	 * @param uuid		声纹标识id，唯一
//	 * @param culpritId	矫正人员id
//	 * @param extion	扩展参数0声纹注册，1声纹认证
//	 * @return
//	 */
//	public String startRegister(String uuid, String culpritId, String extion){
//		try {
//			Culprit culprit = culpritService.findById(culpritId);
//			String telno = culprit.getShortNumber();
//			if (telno != null) {
//				String operateid = IdGen.uuid();
//				String NAMESPACE = "http://service.talentedsoft.com";
//				String URL = "http://192.168.8.21:8089/voiceservice/services/VoiceprintService?wsdl";
//				String METHODNAME = "TS_CallupAndIdentify";
//				String show = null;
//				SoapObject request = new SoapObject(NAMESPACE, METHODNAME);
//				System.out.println("传入的参数：operateid=" + operateid);
//				System.out.println("传入的参数：telno=" + telno);
//				System.out.println("传入的参数：extion=" + extion);
//				request.addProperty("operateid", operateid);
//				request.addProperty("telno", telno);
//				request.addProperty("extion", extion);
//				SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
//						SoapEnvelope.VER10);
//				envelope.dotNet = true;
//				envelope.setOutputSoapObject(request);
//				HttpTransportSE transport = new HttpTransportSE(URL);
//				try {
//					transport.call(null, envelope);
//					SoapObject result = (SoapObject) envelope.bodyIn;
//
//					show = (String) result.getProperty(0).toString();
//					System.out.println("show:" + show);
//				} catch (SoapFault e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (XmlPullParserException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				if (show.equals("true")) {
//					return "true";
//				} else {
//					return "false";
//				}
//			} else {
//				return "notelno";
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			return "true";
//		}
//	}
//	
//	/**
//	 * 添加声纹注册信息
//	 * @param operateid
//	 * @param telno
//	 * @param fileurl
//	 * @param dicRegisterId
//	 */
//	public void addRegister(String operateid, String telno, String fileurl, String dicRegisterId){
//		CallRegister callRegister = new CallRegister();
//		callRegister.setLogicId(operateid);
//		callRegister.setCallee(telno);
//		callRegister.setFilepath(fileurl);
//		callRegister.setDicRegisterId(dicRegisterId);
//		
//		Culprit culprit = new Culprit();
//		culprit.setMobileNumber(telno);
//		List<Culprit> list = culpritService.findAll(culprit);
//		if (list.size() > 0) {
//			Culprit record = list.get(0);
//			callRegister.setCulpritId(record.getId());
//		}
//		
//		super.insert(callRegister);
//	}
//	
//	
//	/**
//	 * 是否已注册声纹
//	 * @param telno
//	 * @return
//	 */
//	public Boolean isRegister(String telno){
//		boolean flag = false;
//		
//		Culprit culprit = new Culprit();
//		culprit.setShortNumber(telno);
//		List<Culprit> list = culpritService.findAll(culprit);
//		if (list.size() > 0) {
//			Culprit record = list.get(0);
//			if (!StringUtils.isBlank(record.getDicRegisterId())) {
//				if (record.getDicRegisterId().equals(Constants.CALLREGISTER_STATE_YZC)) {//已注册
//					flag = true;
//				}
//			}
//		}
//		
//		return flag;
//	}
//	
//	
//	
}
