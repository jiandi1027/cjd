package com.rowell.sifa.web.terminal;

import java.net.MalformedURLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;

import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.pojo.terminal.LocResult;
import com.rowell.sifa.pojo.terminal.TerLocationRes;
import com.rowell.sifa.service.monitoring.OverAlarmService;
import com.rowell.sifa.service.monitoring.SfAreaService;
import com.rowell.sifa.service.monitoring.TerminalActivityService;
import com.rowell.sifa.service.monitoring.TerminalAreaService;
import com.rowell.sifa.service.monitoring.TerminalHistoryService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.sys.utils.HttpUtil;
import com.rowell.sifa.web.terminal.DxLocation.locRes.LocationResponseRequest;

public class LzLocation {
	private static Logger logger = Logger.getLogger(LzLocation.class);
	
//	http://111.235.156.35:58082/location/once/d261e2d07aa24275b48a722e0897103e/15057596388/2?options=3
	private static String locationUrl = "http://111.235.156.35:58082/location/once";	//定位地址
	
	private static String key = "d261e2d07aa24275b48a722e0897103e";						//柳州key
	
	private static String locType = "2";	//定位类型	1：精定位	2：粗定位 	3：精转粗定位
	
	private static String options = "3";	//0：返回原始经纬度，无地址解析1：返回偏移经纬度，无地址解析2：返回原始经纬度，有地址解析3：返回偏移经纬度，有地址解析

	private TerminalService terminalService;

	private TerminalActivityService terminalActivityService;

	private TerminalHistoryService terminalHistoryService;

	private TerminalAreaService terminalAreaService;

	private SfAreaService sfAreaService;

	private OverAlarmService overAlarmService;
	
	public LzLocation(TerminalService terminalService, TerminalActivityService terminalActivityService, TerminalHistoryService terminalHistoryService,
			TerminalAreaService terminalAreaService, SfAreaService sfAreaService, OverAlarmService overAlarmService) {
		// TODO 自动生成的构造函数存根
		this.terminalService = terminalService;
		this.terminalActivityService = terminalActivityService;
		this.terminalHistoryService = terminalHistoryService;
		this.terminalAreaService = terminalAreaService;
		this.sfAreaService = sfAreaService;
		this.overAlarmService = overAlarmService;
	}
	
	/**
	 * 没用，测试时用
	 */
	public LzLocation() {
		// TODO 自动生成的构造函数存根
	}
	
	/**
	 * 定位,无返回定位响应实体
	 * @param tel
	 * @throws MalformedURLException
	 */
	public void spcall(String tel) throws MalformedURLException{
		try {
			TerLocationRes res = new TerLocationRes();
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, String> params = new HashMap<>();
			params.put("options", options);
			String url = locationUrl+"/"+key+"/"+tel+"/"+locType;
//			System.out.println(url);
			String result = HttpUtil.get(url, params);
//			System.out.println("ter location result:" + result);
			res = mapper.readValue(result, TerLocationRes.class);
//			System.out.println(res);
//			if (res.getLocResult() != null) {
//				System.out.println(res.getLocResult().getInfo());
//			}
			parseCdwLocationsJson(res, tel);
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.info(e.getMessage());
		}
	}
	
	/**
	 * 定位,有返回定位响应实体TerLocationRes
	 * @param tel
	 * @return
	 * @throws MalformedURLException
	 */
	public TerLocationRes spcallByRes(String tel) throws MalformedURLException{
		try {
			TerLocationRes res = new TerLocationRes();
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, String> params = new HashMap<>();
			params.put("options", options);
			String url = locationUrl+"/"+key+"/"+tel+"/"+locType;
//			System.out.println(url);
			String result = HttpUtil.get(url, params);
//			System.out.println("ter location result:" + result);
			res = mapper.readValue(result, TerLocationRes.class);
//			System.out.println(res);
//			if (res.getLocResult() != null) {
//				System.out.println(res.getLocResult().getInfo());
//			}
			parseCdwLocationsJson(res, tel);
			return res;
		} catch (Exception e) {
			// TODO: handle exception
			logger.info(e.getMessage());
			return null;
		}
	}
	
	public static void main(String[] args) throws MalformedURLException {
	// TODO 自动生成的方法存根
//		String tel = "15057596388";
//		String tel = "18957751796";
//		LzLocation lz = new LzLocation();
//		lz.spcall(tel);
		HashMap<String, String> params = new HashMap<String, String>();
//		params.
		LocationResponseRequest locationResponseRequest = new LocationResponseRequest("123456", null);
		params.put("locationResponseRequest", locationResponseRequest.toString());
		HttpUtil.get("http://localhost:9000/cxfdemo/locationResponse", params);
	}
	
	/**
	 * 解析定位返回json信息
	 * @param line
	 */
	public void parseCdwLocationsJson(TerLocationRes res, String mobileNumber){
		try {
			if (res == null) {
				return;
			}
			String locationCode = res.getCode();
			LocResult locResult = res.getLocResult();
			String longitude = "";
			String latitude = "";
			String info = "";
			String gpstime = "";
			String code = "";
			
			if (locResult != null) {
				mobileNumber = locResult.getMdn();
				longitude = locResult.getLongitude();
				latitude = locResult.getLatitude();
				info = locResult.getInfo();
				gpstime = locResult.getLocTime();
				code = locResult.getCode();
			}
			else if (!locationCode.equals("0")) {
				code = locationCode;
			}
			saveTerminalMsg(code,mobileNumber,longitude,latitude,gpstime,info);

		} catch (Exception e) {
			// TODO: handle exception
			logger.info(e.getMessage());
		}
	}
	
	/**
	 * 保存历史和实时定位信息
	 * @param mobileNumber
	 * @param longitude
	 * @param latitude
	 * @param gpstime
	 * @param info
	 */
	public void saveTerminalMsg(String code, String mobileNumber,String longitude, String latitude, String gpstime, String info){
		try {
			if (StringUtils.isBlank(mobileNumber)) {
				return ;
			}
			
			//定位信息保存	start
			Terminal terminal = new Terminal();
			terminal.setMobileNumber(mobileNumber);
			List<Terminal> list = terminalService.findAll(terminal);
			if(list.size() > 0){
				TerminalHistory history = new TerminalHistory();
				history.setErrorCode(code);
				history.setTerminalId(list.get(0).getId());
				if (!StringUtils.isBlank(longitude)) {
					try {
						history.setLon(Float.valueOf(longitude));
					} catch (Exception e) {
						// TODO: handle exception
						logger.info("经度转换出错");
					}
				}
				if (!StringUtils.isBlank(latitude)) {
					try {
						history.setLat(Float.valueOf(latitude));
					} catch (Exception e) {
						// TODO: handle exception
						logger.info("纬度转换出错");
					}
				}
				if (!StringUtils.isBlank(gpstime)) {
					try {
						Date date = DateUtils.parseDate(gpstime, "yyyy-MM-dd hh:mm:ss");
						history.setGpstime(date);
					} catch (Exception e) {
						// TODO: handle exception
						logger.info("定位时间转换出错");
					}
				}
				history.setLocation(info);
				history.setMobileNumber(mobileNumber);
				history.setIsLive(getIsLive(code));
				terminalHistoryService.insertSelective(history);
				
				//越界警告	start
				String msg = LocationAlarmUtil.isPointInPolygon(history.getLon()+"", history.getLat()+"", history.getMobileNumber(), terminalService, terminalAreaService, sfAreaService);
				overAlarmService.judgeOverAlarm(history.getLon()+"", history.getLat()+"", history.getMobileNumber(), history.getId(), msg);
				//越界警告	end
				
				TerminalActivity activity = new TerminalActivity();
				activity.setMobileNumber(mobileNumber);
				List<TerminalActivity> activityList = terminalActivityService.findAll(activity);
				if (activityList.size() > 0) {
					activity = activityList.get(0);
				}
				else {
				}
				activity.setErrorCode(code);
				activity.setTerminalId(list.get(0).getId());
				if (!StringUtils.isBlank(longitude)) {
					try {
						activity.setLon(Float.valueOf(longitude));
					} catch (Exception e) {
						// TODO: handle exception
						logger.info("经度转换出错");
					}
				}
				if (!StringUtils.isBlank(latitude)) {
					try {
						activity.setLat(Float.valueOf(latitude));
					} catch (Exception e) {
						// TODO: handle exception
						logger.info("纬度转换出错");
					}
				}

				if (!StringUtils.isBlank(gpstime)) {
					try {
						Date date = DateUtils.parseDate(gpstime, "yyyy-MM-dd hh:mm:ss");
						activity.setGpstime(date);
					} catch (Exception e) {
						// TODO: handle exception
						logger.info("定位时间转换出错");
					}
				}
				activity.setLocation(info);
				activity.setMobileNumber(mobileNumber);
				activity.setIsLive(getIsLive(code));
				activity.setLocationType(Constants.LOCATIONTYPE_JZDW);
				if (StringUtils.isBlank(activity.getId())) {
					terminalActivityService.insertSelective(activity);
				}
				else terminalActivityService.updateByIdSelective(activity);
			}
			//定位信息保存	end
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.info(e.getMessage());
		}
	}
	
	/**
	 * 状态
	 * @param code
	 * @return
	 */
	public String getIsLive(String code){
		String isLive = "";
		if (code.equals("0")) {
			isLive = "在线";
		}
		else isLive = "掉线";
		
		return isLive;
	}
}
