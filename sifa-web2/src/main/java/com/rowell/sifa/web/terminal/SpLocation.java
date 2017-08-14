package com.rowell.sifa.web.terminal;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.pojo.sys.SysBxOidd;
import com.rowell.sifa.pojo.sys.SysLocation;
import com.rowell.sifa.service.monitoring.OverAlarmService;
import com.rowell.sifa.service.monitoring.SfAreaService;
import com.rowell.sifa.service.monitoring.TerminalActivityService;
import com.rowell.sifa.service.monitoring.TerminalAreaService;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.web.servlet.InitializeServlet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SpLocation {
	
	private static Logger logger = Logger.getLogger(InitializeServlet.class);
	
	/**
	 * 粗定位url
	 */
	private static String ipAddress = "http://42.99.16.82:80/a.lif";

	private TerminalActivityService terminalActivityService;

	private TerminalHistoryService terminalHistoryService;

	private TerminalService terminalService;
	
	private String type;
	
	public SpLocation(TerminalActivityService terminalActivityService, TerminalHistoryService terminalHistoryService){
		this.terminalActivityService = terminalActivityService;
		this.terminalHistoryService = terminalHistoryService;
		this.type = "0";
	}
//	public SpLocation(TerminalActivityService terminalActivityService, TerminalHistoryService terminalHistoryService){
//		ServletContext servletContext = super.getServletContext();
//		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
//		this.terminalActivityService = (TerminalActivityService)wac.getBean("terminalActivityService");
//		this.terminalHistoryService = terminalHistoryService;
//		this.type = "0";
//	}
	
	public SpLocation(TerminalActivityService terminalActivityService, TerminalHistoryService terminalHistoryService, String type){
		this.terminalActivityService = terminalActivityService;
		this.terminalHistoryService = terminalHistoryService;
		this.type = type;
	}
	
	public List<SysLocation> spCallList(String telnos){
		String[] mobileArr1 = telnos.split(",");
		List<SysLocation> list = new ArrayList<SysLocation>();
		HttpURLConnection con = null;
		for (String telno : mobileArr1) {
			try {
				BxOiddBean bxOidd = new BxOiddBean();
				SysBxOidd record = bxOidd.oiddByTelno(telno);
				if (record != null) {
					if (record.getActiveStatus().equals("1") && record.getAccountStatus().equals("0")
							&& record.getForwardStatus().equals("0")) {						//开机且未停机且无呼叫转移
						
//						String req = CreateXML.getLIR_XML("12110040", "654321", mobileArr1);
						String[] mobileArrtemp = {telno};
						String req = CreateXML.getLIR_XML("12110040", "654321", mobileArrtemp);
						//URL url = new URL("http://124.126.120.52:2233/a.lif");
						URL url = new URL(ipAddress);
						con = (HttpURLConnection) url.openConnection();
						con.setDoOutput(true);
						con.setDoInput(true);
						con.setConnectTimeout(60000);
						con.setReadTimeout(60000);
						OutputStream out = con.getOutputStream();
						out.write(req.getBytes());
						out.flush();
						InputStream is = con.getInputStream();
						
					
						// 读取响应内容
						String sCurrentLine = "";
						String sTotalString = "";
						BufferedReader reader = new BufferedReader(
								new InputStreamReader(is));
						while ((sCurrentLine = reader.readLine()) != null) {
							if (sCurrentLine.length() > 0) {
								sTotalString = sTotalString + sCurrentLine.trim();
							}
						}
						logger.info("*****" + sTotalString + "\n");
						if (sTotalString.length() > 0) {

							List<SysLocation> templist = parseCdwLocationsListXml(sTotalString, type, record);
							list.addAll(templist);
//							list = parseCdwLocationsListXml(sTotalString, type);
						}
						is.close();
						out.close(); 
						
					}
					else {
						
					}
				}
				
				con.disconnect();
				return list;
			} catch (Exception e) {
				e.printStackTrace();
				if (con != null)
					con.disconnect();
				logger.error("号码：" + telnos.toString() + "，调用粗定位接口错误" + e + "\n");
			}
			return null;
		}
		return list;
		
	}
	
	public void spCall(String telnos){
		String[] mobileArr1 = telnos.split(",");
		HttpURLConnection con = null;
		for (String telno : mobileArr1) {
			try {
				BxOiddBean bxOidd = new BxOiddBean();
				SysBxOidd record = bxOidd.oiddByTelno(telno);
				if (record != null) {
					if (record.getActiveStatus().equals("1") && record.getAccountStatus().equals("0")
							&& record.getForwardStatus().equals("0")) {						//开机且未停机且无呼叫转移
						
						String[] mobileArrtemp = {telno};
						String req = CreateXML.getLIR_XML("12110040", "654321", mobileArrtemp);
						URL url = new URL(ipAddress);
						con = (HttpURLConnection) url.openConnection();
						con.setDoOutput(true);
						con.setDoInput(true);
						con.setConnectTimeout(60000);
						con.setReadTimeout(60000);
						OutputStream out = con.getOutputStream();
						out.write(req.getBytes());
						out.flush();
						InputStream is = con.getInputStream();
					
						// 读取响应内容
						String sCurrentLine = "";
						String sTotalString = "";
						BufferedReader reader = new BufferedReader(
								new InputStreamReader(is));
						while ((sCurrentLine = reader.readLine()) != null) {
							if (sCurrentLine.length() > 0) {
								sTotalString = sTotalString + sCurrentLine.trim();
							}
						}
						logger.info("*****" + sTotalString + "\n");
						if (sTotalString.length() > 0) {

							parseCdwLocationsListXml(sTotalString, type, record);
						}
						is.close();
						out.close(); 
					}
					else {
						
					}
				}
				
				con.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
				if (con != null)
					con.disconnect();
				logger.error("号码：" + telnos.toString() + "，调用粗定位接口错误" + e + "\n");
			}
		}
	}
	
	
	/**
	 * 转换xml信息，将定位信息存入数据库
	 * @param xml
	 * @return
	 * @throws DocumentException
	 */
//	private void parseCdwLocationsXml(String xml, String type) throws DocumentException {
//
//		if (xml.indexOf("<LCSCLIENTID>") < 0) {
////			return null;
//		} else {
////			Map model = new HashMap();
//			Document doc = DocumentHelper.parseText(xml.trim());
//			Element root = doc.getRootElement();
//			Element element_lia = root.element("LIA");
//
//			if (element_lia.element("RESULT").getStringValue().equals("0")) {		//xml中result为0,成功
//				Element element_posinfos = element_lia.element("POSINFOS");
//				// List list = element_posinfos.elementIterator("POSINFO");
//				for (Iterator it = element_posinfos.elementIterator("POSINFO"); it.hasNext();) {
//					Element element_posinfo = (Element) it.next();
//					String mobile = element_posinfo.element("MSID")
//							.getStringValue();
//					mobile = mobile.length() > 11 ? mobile.substring(2)
//							: mobile.trim();
//					String status = element_posinfo.element("POSITIONRESULT")
//							.getStringValue();
//					Long errorCode = Long.valueOf(status);
//					String localtime = element_posinfo.element("LOCALTIME") == null ? ""
//							: element_posinfo.element("LOCALTIME")
//									.getStringValue().trim();
//					String time = "";
//					if (localtime.length() > 0) {
//						time = localtime.substring(0, 4) + "-"
//								+ localtime.substring(4, 6) + "-"
//								+ localtime.substring(6, 8) + " "
//								+ localtime.substring(8, 10) + ":"
//								+ localtime.substring(10, 12) + ":"
//								+ localtime.substring(12, 14);
//					} else {
////						 logger.info("返回数据：" + xml + "\n");
//					}
//					Date date = null;
//					try {
//						DateFormat fmt = new SimpleDateFormat(
//								"yyyy-MM-dd HH:mm:ss");
//						if (time.length() > 0) {
//							date = fmt.parse(time);
//						} else
//							date = new Date();
//					} catch (Exception e) {
//						logger.info("号码:" + mobile + ",cdw定位时，时间转化出错" + "\n");
//					}
//					//errorCode == 2 定位成功，其他全是定位异常
//					if (errorCode ==2) {
//						String longitude = element_posinfo.element("LONGITUDE")
//								.getStringValue().trim();
//						Double lon = Double.valueOf(longitude);
//						//lon = lon / 10000;
//						String latitude = element_posinfo.element("LATITUDE")
//								.getStringValue().trim();
//						Double lat = Double.valueOf(latitude);
//						//lat = lat / 10000;
////						String radius = element_posinfo.element("RADUIS")//半径
////								.getStringValue().trim();
////						String posour = element_posinfo.element("POSOUR")//
////								.getStringValue().trim();
//						//需要收费，mapbarLoc停用，改用String addr
//						//com.acestek.lbs.mapbar.Location mapbarLoc = null;
//						
////						String addr = null;
////						try {
////							//由于收费太贵，公司无力出资，所以停用
////							//mapbarLoc = mapbarApi.getLocation("" + lat, "" + lon);
////							addr = getMapBarAddr(lon+"", lat+"")==null?"":getMapBarAddr(lon+"", lat+"");
////							int count = 0;
////							while ("".equals(addr)) {
////								if (count == 3) {
////									break;
////								}
////								count++;
////								//由于收费太贵，公司无力出资，所以停用
////								//mapbarLoc = mapbarApi.getLocation("" + latitude, "" + longitude);
////								addr = getMapBarAddr(""+longitude,""+latitude)==null?"":getMapBarAddr(""+longitude,""+latitude);
////								
////								Thread.sleep(1000);
////							}
////						} catch (Exception e) {
////							logger.error("mapbar加密经纬度请求失败：" + e + "\n");
////						}
//						
//						TerminalActivity record = new TerminalActivity();
//						record.setMobileNumber(mobile);
//						List<TerminalActivity> terminalActivityList = terminalActivityService.findAll(record);
//						//更新位置监控实时轨迹		start
//						if (terminalActivityList != null && terminalActivityList.size() > 0) {	
//							TerminalActivity terminalActivity = (TerminalActivity) terminalActivityList.get(0);
//							terminalActivity.setLon(lon.floatValue());
//							terminalActivity.setLat(lat.floatValue());
//							terminalActivity.setGpstime(date);
////							terminalActivity.setLocation(addr);
//							terminalActivity.setErrorCode("0");
//							terminalActivity.setIsLive(aa);
//							terminalActivity.setLocationType("基站定位");
//							terminalActivity.setMobileNumber(mobile);
////							terminalActivity.setTerminalId(terminalId);
//							if (type.equals("2")) {
//								Terminal Terminalrecord = new Terminal();
//								Terminalrecord.setMobileNumber(mobile);
//								List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
//								
//								if (terminalList != null && terminalList.size() > 0) {
//									Terminal terminal = terminalList.get(0);
//									
//									if (!StringUtils.isBlank(terminal.getIntervalTime())) {
//										Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
//										if ((new Date().getTime() - terminalActivity.getUpdated().getTime())/1000l > dwtime) {
//											terminalActivityService.updateByIdSelective(terminalActivity);
//										}
//									}
//								}
//							}
//							else terminalActivityService.updateByIdSelective(terminalActivity);
//						}
//						//更新位置监控实时轨迹		end
//						
//						//更新历史位置监控实时轨迹	start
//						TerminalHistory terminalHistory = new TerminalHistory();
//						terminalHistory.setLon(lon.floatValue());
//						terminalHistory.setLat(lat.floatValue());
//						terminalHistory.setGpstime(date);
//						terminalHistory.setLocation(addr);
//						terminalHistory.setErrorCode("0");
//						terminalHistory.setMobileNumber(mobile);
////						terminalHistory.setTerminalId(terminalId);
//						if (type.equals("2")) {
//							Terminal Terminalrecord = new Terminal();
//							Terminalrecord.setMobileNumber(mobile);
//							List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
//							
//							if (terminalList != null && terminalList.size() > 0) {
//								Terminal terminal = terminalList.get(0);
//								
//								if (!StringUtils.isBlank(terminal.getIntervalTime())) {
//									Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
//									
//									TerminalHistory terminalHistoryRecord = new TerminalHistory();
//									terminalHistoryRecord.setMobileNumber(mobile);
//									terminalHistoryRecord.setOrderStr("updated desc");
//									List<TerminalHistory> terminalHistoryList = terminalHistoryService.findAll(terminalHistoryRecord);
//									if (terminalHistoryList != null && terminalHistoryList.size() > 0) {
//										TerminalHistory terminalHistory2 = terminalHistoryList.get(0);
//										if ((new Date().getTime() - terminalHistory2.getUpdated().getTime())/1000l > dwtime) {
//											terminalHistoryService.insert(terminalHistory);
//										}
//									}
//									else terminalHistoryService.insert(terminalHistory);
//								}
//							}
//						}
//						else terminalHistoryService.insert(terminalHistory);
//						//更新历史位置监控实时轨迹	end
//						
////						LocationInfo locInfo = new LocationInfo();
////						locInfo.setGpsDatetime(new Date());
////						locInfo.setNowDatetime(new Date());
////						locInfo.setTime("");
////						locInfo.setNewtime("");
////						locInfo.setMobilenumber(mobile);
////						locInfo.setLatitude(Double.valueOf(latitude));
////						//由于收费太贵，公司无力出资，所以停用
////						//locInfo.setLongiandlati(mapbarLoc.getMapbarlonglat());
////						//locInfo.setInfo(mapbarLoc.getInfo());
////						locInfo.setLongiandlati(longitude.trim()+","+latitude.trim());
////						locInfo.setInfo(addr);
////						
////						locInfo.setLongitude(Double.valueOf(longitude));
////						locInfo.setErrorcode(0l);
////						model.put("locInfo", locInfo);
////						//由于收费太贵，公司无力出资，所以停用
////						logger.info(mobile + ",longitude:" + longitude + ",latitude:"
////								+ latitude + ",lonlat:" + mapbarLoc.getMapbarlonglat()
////								+ ",info:" + mapbarLoc.getInfo() + "\n");
//						logger.info("定位成功-----" + mobile + ",longitude:" + longitude + ",latitude:"
//								+ latitude + ",lonlat:" +""
//								+ ",info:" + addr + "\n");
//						
////						model.put("error", "0");
//						
//					} else {	//定位不成功--status 就是xml中的POSITIONRESULT
//						TerminalActivity record = new TerminalActivity();
//						record.setMobileNumber(mobile);
//						List<TerminalActivity> terminalActivityList = terminalActivityService.findAll(record);
//						if (terminalActivityList != null && terminalActivityList.size() > 0) {
//							TerminalActivity terminalActivity = (TerminalActivity) terminalActivityList.get(0);
//							
//							String errCodeLong = status;
//							if (status.equalsIgnoreCase("4")){
//								errCodeLong = "102";
//							}
//							else if (status.equalsIgnoreCase("226")){
//								errCodeLong = "130";
//							}
//							else if (status.equalsIgnoreCase("136")){
//								errCodeLong = "105";
//							}
//							else if (status.equalsIgnoreCase("238")){
//								errCodeLong = "105";
//							}
//							else if (status.equalsIgnoreCase("245")){
//								errCodeLong = "147";
//							}
//							else if (status.equalsIgnoreCase("207")){
//								errCodeLong = "128";
//							}
//
//							//更新位置监控实时轨迹		start
//							terminalActivity.setErrorCode(errCodeLong);
//							if (type.equals("2")) {
//								Terminal Terminalrecord = new Terminal();
//								Terminalrecord.setMobileNumber(mobile);
//								List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
//								
//								if (terminalList != null && terminalList.size() > 0) {
//									Terminal terminal = terminalList.get(0);
//									
//									if (!StringUtils.isBlank(terminal.getIntervalTime())) {
//										Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
//										if ((new Date().getTime() - terminalActivity.getUpdated().getTime())/1000l > dwtime) {
//											terminalActivityService.updateByIdSelective(terminalActivity);
//										}
//									}
//								}
//							}
//							else terminalActivityService.updateByIdSelective(terminalActivity);
//							//更新位置监控实时轨迹		end
////							model.put("error", errCodeLong.toString());
//							
//							//更新历史位置监控实时轨迹	start
//							TerminalHistory terminalHistory = new TerminalHistory();
//							terminalHistory.setGpstime(date);
//							terminalHistory.setErrorCode(errCodeLong);
//							terminalHistory.setMobileNumber(mobile);
////							terminalHistory.setTerminalId(terminalId);
//							if (type.equals("2")) {
//								Terminal Terminalrecord = new Terminal();
//								Terminalrecord.setMobileNumber(mobile);
//								List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
//								
//								if (terminalList != null && terminalList.size() > 0) {
//									Terminal terminal = terminalList.get(0);
//									
//									if (!StringUtils.isBlank(terminal.getIntervalTime())) {
//										Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
//										
//										TerminalHistory terminalHistoryRecord = new TerminalHistory();
//										terminalHistoryRecord.setMobileNumber(mobile);
//										terminalHistoryRecord.setOrderStr("updated desc");
//										List<TerminalHistory> terminalHistoryList = terminalHistoryService.findAll(terminalHistoryRecord);
//										if (terminalHistoryList != null && terminalHistoryList.size() > 0) {
//											TerminalHistory terminalHistory2 = terminalHistoryList.get(0);
//											if ((new Date().getTime() - terminalHistory2.getUpdated().getTime())/1000l > dwtime) {
//												terminalHistoryService.insert(terminalHistory);
//											}
//										}
//										else terminalHistoryService.insert(terminalHistory);
//									}
//								}
//							}
//							else terminalHistoryService.insert(terminalHistory);
//							//更新历史位置监控实时轨迹	end
//							
//							logger.info("定位失败-----号码：" + mobile + "cdw定位,返回结果:" + status
//									+ ",时间：" + time + "\n");
//						}
//					}
//
//				}
//			} else {	//xml中result不为0,失败
//				String errCodeLong = element_lia.element("RESULT").getStringValue();
//				Element element_posinfos = element_lia.element("POSINFOS");
//				for (Iterator it = element_posinfos.elementIterator("POSINFO"); it.hasNext();) {
//					Element element_posinfo = (Element) it.next();
//					String mobile = element_posinfo.element("MSID").getStringValue();
//					mobile = mobile.length() > 11 ? mobile.substring(2): mobile.trim();
//					String status = element_posinfo.element("POSITIONRESULT").getStringValue();
//					String localtime = element_posinfo.element("LOCALTIME") == null ? ""
//							: element_posinfo.element("LOCALTIME")
//									.getStringValue().trim();
//					String time = "";
//					if (localtime.length() > 0) {
//						time = localtime.substring(0, 4) + "-"
//								+ localtime.substring(4, 6) + "-"
//								+ localtime.substring(6, 8) + " "
//								+ localtime.substring(8, 10) + ":"
//								+ localtime.substring(10, 12) + ":"
//								+ localtime.substring(12, 14);
//					} else {
//						// logger.info("返回数据：" + xml + "\n");
//					}
//					Date date = null;
//					try {
//						DateFormat fmt = new SimpleDateFormat(
//								"yyyy-MM-dd HH:mm:ss");
//						if (time.length() > 0) {
//							date = fmt.parse(time);
//						} else
//							date = new Date();
//					} catch (Exception e) {
//						logger.info("号码:" + mobile + ",cdw定位时，时间转化出错" + "\n");
//					}
////					model.put("error", errCodeLong.toString());
//
//					TerminalActivity record = new TerminalActivity();
//					record.setMobileNumber(mobile);
//					List<TerminalActivity> terminalActivityList = terminalActivityService.findAll(record);
//					if (terminalActivityList != null && terminalActivityList.size() > 0) {
//						//更新位置监控实时轨迹		start
//						TerminalActivity terminalActivity = terminalActivityList.get(0);
//						terminalActivity.setErrorCode(errCodeLong);
//						if (type.equals("2")) {
//							Terminal Terminalrecord = new Terminal();
//							Terminalrecord.setMobileNumber(mobile);
//							List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
//							
//							if (terminalList != null && terminalList.size() > 0) {
//								Terminal terminal = terminalList.get(0);
//								
//								if (!StringUtils.isBlank(terminal.getIntervalTime())) {
//									Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
//									if ((new Date().getTime() - terminalActivity.getUpdated().getTime())/1000l > dwtime) {
//										terminalActivityService.updateByIdSelective(terminalActivity);
//									}
//								}
//							}
//						}
//						else terminalActivityService.updateByIdSelective(terminalActivity);
//						//更新位置监控实时轨迹		end
//						
//						//更新历史位置监控实时轨迹	start
//						TerminalHistory terminalHistory = new TerminalHistory();
//						terminalHistory.setGpstime(date);
//						terminalHistory.setErrorCode(errCodeLong);
//						terminalHistory.setMobileNumber(mobile);
////						terminalHistory.setTerminalId(terminalId);
//						if (type.equals("2")) {
//							Terminal Terminalrecord = new Terminal();
//							Terminalrecord.setMobileNumber(mobile);
//							List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
//							
//							if (terminalList != null && terminalList.size() > 0) {
//								Terminal terminal = terminalList.get(0);
//								
//								if (!StringUtils.isBlank(terminal.getIntervalTime())) {
//									Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
//									
//									TerminalHistory terminalHistoryRecord = new TerminalHistory();
//									terminalHistoryRecord.setMobileNumber(mobile);
//									terminalHistoryRecord.setOrderStr("updated desc");
//									List<TerminalHistory> terminalHistoryList = terminalHistoryService.findAll(terminalHistoryRecord);
//									if (terminalHistoryList != null && terminalHistoryList.size() > 0) {
//										TerminalHistory terminalHistory2 = terminalHistoryList.get(0);
//										if ((new Date().getTime() - terminalHistory2.getUpdated().getTime())/1000l > dwtime) {
//											terminalHistoryService.insert(terminalHistory);
//										}
//									}
//									else terminalHistoryService.insert(terminalHistory);
//								}
//							}
//						}
//						else terminalHistoryService.insert(terminalHistory);
//						//更新历史位置监控实时轨迹	end
//						logger.info("号码：" + mobile + "cdw定位,返回结果:" +errCodeLong+",posErr"+ status
//								+ ",时间：" + time + "\n");
//					}
//				}
//				// model.put("result","LONE请求返回失败");
//			}
////			return model;
//		}
//	}
	
	/**
	 * 转换xml信息，将定位信息存入数据库
	 * @param xml
	 * @return
	 * @throws DocumentException
	 */
	private List<SysLocation> parseCdwLocationsListXml(String xml, String type, SysBxOidd sysBxOidd) throws DocumentException {
		String isLive = "在线";
		if (sysBxOidd.getActiveStatus().equals("0")) {
			isLive = "关机";
		}
		else if (sysBxOidd.getAccountStatus().equals("1")) {
			isLive = "停机";
		}
		else if (sysBxOidd.getForwardStatus().equals("1")) {
			isLive = "呼叫转移";
		}
		List<SysLocation> list = new ArrayList<SysLocation>();
		
		if (xml.indexOf("<LCSCLIENTID>") < 0) {
//			return null;
		} else {
			Document doc = DocumentHelper.parseText(xml.trim());
			Element root = doc.getRootElement();
			Element element_lia = root.element("LIA");

			if (element_lia.element("RESULT").getStringValue().equals("0")) {		//xml中result为0,成功
				Element element_posinfos = element_lia.element("POSINFOS");
				// List list = element_posinfos.elementIterator("POSINFO");
				
				for (Iterator it = element_posinfos.elementIterator("POSINFO"); it.hasNext();) {
					Element element_posinfo = (Element) it.next();
					String mobile = element_posinfo.element("MSID")
							.getStringValue();
					mobile = mobile.length() > 11 ? mobile.substring(2)
							: mobile.trim();
					String status = element_posinfo.element("POSITIONRESULT")
							.getStringValue();
					Long errorCode = Long.valueOf(status);
					String localtime = element_posinfo.element("LOCALTIME") == null ? ""
							: element_posinfo.element("LOCALTIME")
									.getStringValue().trim();
					String time = "";
					if (localtime.length() > 0) {
						time = localtime.substring(0, 4) + "-"
								+ localtime.substring(4, 6) + "-"
								+ localtime.substring(6, 8) + " "
								+ localtime.substring(8, 10) + ":"
								+ localtime.substring(10, 12) + ":"
								+ localtime.substring(12, 14);
					} else {
//						 logger.info("返回数据：" + xml + "\n");
					}
					Date date = null;
					try {
						DateFormat fmt = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						if (time.length() > 0) {
							date = fmt.parse(time);
						} else
							date = new Date();
					} catch (Exception e) {
						logger.info("号码:" + mobile + ",cdw定位时，时间转化出错" + "\n");
					}
					
					SysLocation sysLocation = new SysLocation();
					sysLocation.setResult(status);
					sysLocation.setLocationtime(date);
//					sysLocation.setHeadString(headString);
					sysLocation.setsTotalString(xml);
					sysLocation.setType("1");
					
					sysLocation.setTelno(mobile);
					sysLocation.setTelnos(root.element("ORID").getStringValue());
					
					//errorCode == 2 定位成功，其他全是定位异常
					//errorCode=2 start
					if (errorCode ==2) {
						String longitude = element_posinfo.element("LONGITUDE")
								.getStringValue().trim();
						Double lon = Double.valueOf(longitude);
						//lon = lon / 10000;
						String latitude = element_posinfo.element("LATITUDE")
								.getStringValue().trim();
						Double lat = Double.valueOf(latitude);

						sysLocation.setLatitude(latitude);
						sysLocation.setLongitude(longitude);
						
						TerminalActivity record = new TerminalActivity();
						record.setMobileNumber(mobile);
						List<TerminalActivity> terminalActivityList = terminalActivityService.findAll(record);
						//更新位置监控实时轨迹		start
						TerminalActivity terminalActivity = new TerminalActivity();
						if (terminalActivityList != null && terminalActivityList.size() > 0) {	
							terminalActivity = (TerminalActivity) terminalActivityList.get(0);
						}
						terminalActivity.setLon(lon.floatValue());
						terminalActivity.setLat(lat.floatValue());
						terminalActivity.setGpstime(date);
						terminalActivity.setIsLive(isLive);
						terminalActivity.setLocationType("基站定位");
						terminalActivity.setErrorCode("0");
						terminalActivity.setMobileNumber(mobile);
						if (StringUtils.isBlank(terminalActivity.getTerminalId())) {
							Terminal Terminalrecord = new Terminal();
							Terminalrecord.setMobileNumber(mobile);
							List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
							
							if (terminalList != null && terminalList.size() > 0) {
								Terminal terminal = terminalList.get(0);
								terminalActivity.setTerminalId(terminal.getId());
							}
						}
						if (type.equals("2")) {
							Terminal Terminalrecord = new Terminal();
							Terminalrecord.setMobileNumber(mobile);
							List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
							
							if (terminalList != null && terminalList.size() > 0) {
								Terminal terminal = terminalList.get(0);
								
								if (!StringUtils.isBlank(terminal.getIntervalTime())) {
									Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
									if ((new Date().getTime() - terminalActivity.getUpdated().getTime())/1000l > dwtime) {
										terminalActivityService.saveOrUpdate(terminalActivity);
									}
								}
							}
						}
						else terminalActivityService.saveOrUpdate(terminalActivity);
						//更新位置监控实时轨迹		end
						
						//更新历史位置监控实时轨迹	start
						TerminalHistory terminalHistory = new TerminalHistory();
						terminalHistory.setLon(lon.floatValue());
						terminalHistory.setLat(lat.floatValue());
						terminalHistory.setGpstime(date);
						terminalActivity.setIsLive(isLive);
						terminalActivity.setLocationType("基站定位");
						terminalHistory.setErrorCode("0");
						terminalHistory.setMobileNumber(mobile);
						
						Terminal Terminaltemp = new Terminal();
						Terminaltemp.setMobileNumber(mobile);
						List<Terminal> terminaltempList = terminalService.findAll(Terminaltemp);
						if (terminaltempList != null && terminaltempList.size() > 0) {
							Terminal terminal = terminaltempList.get(0);
							terminalHistory.setTerminalId(terminal.getId());
						}
						
						if (type.equals("2")) {
							Terminal Terminalrecord = new Terminal();
							Terminalrecord.setMobileNumber(mobile);
							List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
							
							if (terminalList != null && terminalList.size() > 0) {
								Terminal terminal = terminalList.get(0);
								
								if (!StringUtils.isBlank(terminal.getIntervalTime())) {
									Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
									
									TerminalHistory terminalHistoryRecord = new TerminalHistory();
									terminalHistoryRecord.setMobileNumber(mobile);
									terminalHistoryRecord.setOrderStr("updated desc");
									List<TerminalHistory> terminalHistoryList = terminalHistoryService.findAll(terminalHistoryRecord);
									if (terminalHistoryList != null && terminalHistoryList.size() > 0) {
										TerminalHistory terminalHistory2 = terminalHistoryList.get(0);
										if ((new Date().getTime() - terminalHistory2.getUpdated().getTime())/1000l > dwtime) {
											terminalHistoryService.insert(terminalHistory);
										}
									}
									else terminalHistoryService.insert(terminalHistory);
								}
							}
						}
						else terminalHistoryService.insert(terminalHistory);
						//更新历史位置监控实时轨迹	end
						
						//越界警告		start
						OverAlarmService overAlarmService = SpringContextHolder.getBean(OverAlarmService.class);
						TerminalAreaService terminalAreaService = SpringContextHolder.getBean(TerminalAreaService.class);
						SfAreaService sfAreaService = SpringContextHolder.getBean(SfAreaService.class);
						
						String msg = LocationAlarmUtil.isPointInPolygon(longitude, longitude, mobile, terminalService, terminalAreaService, sfAreaService);
						overAlarmService.judgeOverAlarm(longitude, longitude, mobile, terminalHistory.getId(), msg);
						//越界警告		end
						
					} else {	//定位不成功--status 就是xml中的POSITIONRESULT

						//更新历史位置监控实时轨迹	start
						TerminalActivity record = new TerminalActivity();
						record.setMobileNumber(mobile);
						List<TerminalActivity> terminalActivityList = terminalActivityService.findAll(record);

						TerminalActivity terminalActivity = new TerminalActivity();
						if (terminalActivityList != null && terminalActivityList.size() > 0) {
							terminalActivity = (TerminalActivity) terminalActivityList.get(0);
						}
						String errCodeLong = status;
						if (status.equalsIgnoreCase("4")){
							errCodeLong = "102";
						}
						else if (status.equalsIgnoreCase("226")){
							errCodeLong = "130";
						}
						else if (status.equalsIgnoreCase("136")){
							errCodeLong = "105";
						}
						else if (status.equalsIgnoreCase("238")){
							errCodeLong = "105";
						}
						else if (status.equalsIgnoreCase("245")){
							errCodeLong = "147";
						}
						else if (status.equalsIgnoreCase("207")){
							errCodeLong = "128";
						}
						
						terminalActivity.setErrorCode(errCodeLong);
						if (type.equals("2")) {
							Terminal Terminalrecord = new Terminal();
							Terminalrecord.setMobileNumber(mobile);
							List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
							
							if (terminalList != null && terminalList.size() > 0) {
								Terminal terminal = terminalList.get(0);
								
								if (!StringUtils.isBlank(terminal.getIntervalTime())) {
									Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
									if ((new Date().getTime() - terminalActivity.getUpdated().getTime())/1000l > dwtime) {
										terminalActivityService.saveOrUpdate(terminalActivity);
									}
								}
							}
						}
						else terminalActivityService.saveOrUpdate(terminalActivity);
						//更新位置监控实时轨迹		end
						
						//更新历史位置监控实时轨迹	start
						TerminalHistory terminalHistory = new TerminalHistory();
						terminalHistory.setGpstime(date);
						terminalHistory.setErrorCode(errCodeLong);
						terminalHistory.setMobileNumber(mobile);

						Terminal Terminaltemp = new Terminal();
						Terminaltemp.setMobileNumber(mobile);
						List<Terminal> terminaltempList = terminalService.findAll(Terminaltemp);
						if (terminaltempList != null && terminaltempList.size() > 0) {
							Terminal terminal = terminaltempList.get(0);
							terminalHistory.setTerminalId(terminal.getId());
						}
						
						if (type.equals("2")) {
							Terminal Terminalrecord = new Terminal();
							Terminalrecord.setMobileNumber(mobile);
							List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
							
							if (terminalList != null && terminalList.size() > 0) {
								Terminal terminal = terminalList.get(0);
								
								if (!StringUtils.isBlank(terminal.getIntervalTime())) {
									Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
									
									TerminalHistory terminalHistoryRecord = new TerminalHistory();
									terminalHistoryRecord.setMobileNumber(mobile);
									terminalHistoryRecord.setOrderStr("updated desc");
									List<TerminalHistory> terminalHistoryList = terminalHistoryService.findAll(terminalHistoryRecord);
									if (terminalHistoryList != null && terminalHistoryList.size() > 0) {
										TerminalHistory terminalHistory2 = terminalHistoryList.get(0);
										if ((new Date().getTime() - terminalHistory2.getUpdated().getTime())/1000l > dwtime) {
											terminalHistoryService.insert(terminalHistory);
										}
									}
									else terminalHistoryService.insert(terminalHistory);
								}
							}
						}
						else terminalHistoryService.insert(terminalHistory);
						//更新历史位置监控实时轨迹	end
					}
					//errorCode=2 end
					
					list.add(sysLocation);
				}
			} else {	//xml中result不为0,失败
				String errCodeLong = element_lia.element("RESULT").getStringValue();
				Element element_posinfos = element_lia.element("POSINFOS");
				for (Iterator it = element_posinfos.elementIterator("POSINFO"); it.hasNext();) {
					Element element_posinfo = (Element) it.next();
					String mobile = element_posinfo.element("MSID").getStringValue();
					mobile = mobile.length() > 11 ? mobile.substring(2): mobile.trim();
					String status = element_posinfo.element("POSITIONRESULT").getStringValue();
//					String localtime = element_posinfo.element("LOCALTIME") == null ? ""
//							: element_posinfo.element("LOCALTIME")
//									.getStringValue().trim();
//					String time = "";
//					if (localtime.length() > 0) {
//						time = localtime.substring(0, 4) + "-"
//								+ localtime.substring(4, 6) + "-"
//								+ localtime.substring(6, 8) + " "
//								+ localtime.substring(8, 10) + ":"
//								+ localtime.substring(10, 12) + ":"
//								+ localtime.substring(12, 14);
//					} else {
//						// logger.info("返回数据：" + xml + "\n");
//					}
//					Date date = null;
//					try {
//						DateFormat fmt = new SimpleDateFormat(
//								"yyyy-MM-dd HH:mm:ss");
//						if (time.length() > 0) {
//							date = fmt.parse(time);
//						} else
//							date = new Date();
//					} catch (Exception e) {
//						logger.info("号码:" + mobile + ",cdw定位时，时间转化出错" + "\n");
//					}

					SysLocation sysLocation = new SysLocation();
					sysLocation.setResult(status);
					sysLocation.setsTotalString(xml);
					sysLocation.setType("1");
					sysLocation.setTelno(mobile);
					sysLocation.setTelnos(root.element("ORID").getStringValue());
					list.add(sysLocation);

					TerminalActivity record = new TerminalActivity();
					record.setMobileNumber(mobile);
					List<TerminalActivity> terminalActivityList = terminalActivityService.findAll(record);
					//更新位置监控实时轨迹		start
					TerminalActivity terminalActivity = new TerminalActivity();
					if (terminalActivityList != null && terminalActivityList.size() > 0) {
						terminalActivity = terminalActivityList.get(0);
					}
					terminalActivity.setMobileNumber(mobile);
					terminalActivity.setIsLive(isLive);
					terminalActivity.setLocationType("基站定位");
					terminalActivity.setErrorCode(errCodeLong);
					if (StringUtils.isBlank(terminalActivity.getTerminalId())) {
						Terminal Terminalrecord = new Terminal();
						Terminalrecord.setMobileNumber(mobile);
						List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
						
						if (terminalList != null && terminalList.size() > 0) {
							Terminal terminal = terminalList.get(0);
							terminalActivity.setTerminalId(terminal.getId());
						}
					}
					
					if (type.equals("2")) {
						Terminal Terminalrecord = new Terminal();
						Terminalrecord.setMobileNumber(mobile);
						List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
						
						if (terminalList != null && terminalList.size() > 0) {
							Terminal terminal = terminalList.get(0);
							
							if (!StringUtils.isBlank(terminal.getIntervalTime())) {
								Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
								if ((new Date().getTime() - terminalActivity.getUpdated().getTime())/1000l > dwtime) {
									terminalActivityService.saveOrUpdate(terminalActivity);
								}
							}
						}
					}
					else terminalActivityService.saveOrUpdate(terminalActivity);
					//更新位置监控实时轨迹		end
					
					//更新历史位置监控实时轨迹	start
					TerminalHistory terminalHistory = new TerminalHistory();
					terminalHistory.setErrorCode(errCodeLong);
					terminalHistory.setMobileNumber(mobile);
					
					Terminal Terminalrecord = new Terminal();
					Terminalrecord.setMobileNumber(mobile);
					List<Terminal> terminalList = terminalService.findAll(Terminalrecord);
					if (terminalList != null && terminalList.size() > 0) {
						Terminal terminal = terminalList.get(0);
						terminalHistory.setTerminalId(terminal.getId());
					}
					
					if (type.equals("2")) {
						Terminal Terminaltemprecord = new Terminal();
						Terminaltemprecord.setMobileNumber(mobile);
						List<Terminal> terminaltempList = terminalService.findAll(Terminaltemprecord);
						
						if (terminaltempList != null && terminaltempList.size() > 0) {
							Terminal terminal = terminaltempList.get(0);
							
							if (!StringUtils.isBlank(terminal.getIntervalTime())) {
								Integer dwtime = Integer.valueOf(terminal.getIntervalTime()) * 60 - 10;	//间隔减去10分钟，减少特殊情况出现
								
								TerminalHistory terminalHistoryRecord = new TerminalHistory();
								terminalHistoryRecord.setMobileNumber(mobile);
								terminalHistoryRecord.setOrderStr("updated desc");
								List<TerminalHistory> terminalHistoryList = terminalHistoryService.findAll(terminalHistoryRecord);
								if (terminalHistoryList != null && terminalHistoryList.size() > 0) {
									TerminalHistory terminalHistory2 = terminalHistoryList.get(0);
									if ((new Date().getTime() - terminalHistory2.getUpdated().getTime())/1000l > dwtime) {
										terminalHistoryService.insert(terminalHistory);
									}
								}
								else terminalHistoryService.insert(terminalHistory);
							}
						}
					}
					else terminalHistoryService.insert(terminalHistory);
					//更新历史位置监控实时轨迹	end
				}
			}
		}

		return list;
	}
	
	/**
	 * 将经纬度转换为地点
	 * @param lon
	 * @param lat
	 * @return
	 */
	public static String getMapBarAddr(String lon,String lat){
  		double[] aaa = OffsetUtil.transformGPS2MapABC(Double.parseDouble(lat), Double.parseDouble(lon));
  		System.out.println("aaa:" + aaa + "\n");
  		lon = aaa[1]+"";
  		lat = aaa[0]+"";
  		//返回51地图的地址信息，json格式,纠偏之后的经纬度返回正确的地址信息
  		//String url = String.format("http://rgc.vip.51ditu.com/rgc?pos=%s,%s&amp;type=1", lon,lat);
  		//120.813416-27.918598浙江省温州市龙湾区永定路辅路向北17米嘉年华游乐园往东南方向59米
  		String url = "http://restapi.amap.com/v3/geocode/regeo?output=json&location="+lon+","+lat+"&key=09a5f5f23571a160e00e2660f4a63d30&roadlevel=1&radius=1000&extensions=all";//&coord_type=1
  		URL myURL = null;
  		URLConnection httpsConn = null;
  		try { 
  			myURL = new URL(url); 
  		} catch (MalformedURLException e) { 
  			e.printStackTrace(); 
  			return null; 
  		} 
  		try {
  			httpsConn = myURL.openConnection(); 
  			if (httpsConn != null) {
  				InputStreamReader insr = new InputStreamReader(httpsConn.getInputStream(), "utf-8"); 
  				BufferedReader br = new BufferedReader(insr); 
  				String data = null; 
  				String str = "";
  				while ((data = br.readLine()) != null) {
  					str+=data;
  				}

  				JSONObject json = JSONObject.fromObject(str);

  				StringBuffer addr = new StringBuffer();
  				if(json.getString("status").equals("1")){
  					//地址数据拼接
  					//JSONObject ad_info = json.getJSONObject("result").getJSONObject("ad_info");
  					JSONObject regeocode = json.getJSONObject("regeocode");
  					addr.append(regeocode.getString("formatted_address"));//具体地址
  					JSONArray roadinters = regeocode.getJSONArray("roadinters");//所有道路list
  					//JSONObject street = ad_reference.getJSONObject("street");
  					if(roadinters.size()>0){
  						JSONObject roadinter = roadinters.getJSONObject(0);
  						addr.append(","+roadinter.getString("first_name")+"跟"+roadinter.getString("second_name")+"向");
  						addr.append(roadinter.getString("direction")+"方向"+roadinter.getString("distance")+"米");//交叉路名
  					}
  				}else{
  					addr.append("");
  					//addr.append(json.getString("info")+"，请稍后再发起请求");
  				}
  				url = addr.toString();
  				insr.close(); 
  			} 
  		} catch (IOException e) {
  			e.printStackTrace(); 
  			//geocodeAddr(lon,lat);
  			return null; 
  		} 
  		return url;
  	}
	
//	public static void main(String[] args) {
//		// TODO 自动生成的方法存根
//		
//		SpLocation call = new SpLocation();   
//	    String result2 = call.spCall("18142071036");
//		System.out.println("result2:" + result2);
//	}

}
