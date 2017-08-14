package com.rowell.sifa.web.terminal;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.rowell.sifa.common.config.Global;
import com.rowell.sifa.pojo.terminal.TerminalLocation;
import com.rowell.sifa.web.terminal.DxLocation.location.CancelAutoLocationRequest;
import com.rowell.sifa.web.terminal.DxLocation.location.CancelAutoLocationResponse;
import com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocByScheduleRequest;
import com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocByScheduleResponse;
import com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocationRequest;
import com.rowell.sifa.web.terminal.DxLocation.location.GetAutoLocationResponse;
import com.rowell.sifa.web.terminal.DxLocation.location.GetLastestLocationRequest;
import com.rowell.sifa.web.terminal.DxLocation.location.GetLastestLocationResponse;
import com.rowell.sifa.web.terminal.DxLocation.location.GetLocListByPageRequest;
import com.rowell.sifa.web.terminal.DxLocation.location.GetLocListByPageResponse;
import com.rowell.sifa.web.terminal.DxLocation.location.GetLocationHistoryRequest;
import com.rowell.sifa.web.terminal.DxLocation.location.GetLocationHistoryResponse;
import com.rowell.sifa.web.terminal.DxLocation.location.GetLocationRequest;
import com.rowell.sifa.web.terminal.DxLocation.location.GetLocationResponse;
import com.rowell.sifa.web.terminal.DxLocation.location.LocationServiceStub;
import com.rowell.sifa.web.terminal.DxLocation.location.QueryAutoLocRequest;
import com.rowell.sifa.web.terminal.DxLocation.location.QueryAutoLocResponse;

import net.sf.json.JSONObject;


public class LocationUtil {

	public static int LOCATION_TYPE_GPSONE = 1;
	public static int LOCATION_TYPE_CLIENT = 2;
	public static int LOCATION_TYPE_BASE_STATION = 3;
	public static int LOCATION_TYPE_GPSONE_TO_BS = 4;

	public static int LOCATION_OPTIONS_1 = 1;
	public static int LOCATION_OPTIONS_2 = 2;
	public static int LOCATION_OPTIONS_3 = 3;

	/**
	 * 定位请求
	 * 
	 * @param terminals	终端列表
	 * @param locType	定位类型1：精定位2：客户端定位3：粗定位4：GOTA定位
	 * @param options	可以或运算1：翻译地址2：位置纠偏3：
	 * @param overTime	定位超时时间，单位分钟。正整数（推荐大于2）

	 * @return
	 */
	public static String getLocation(List<TerminalLocation> terminals, int locType,
			int options, int overTime) {

		LogUtil.LogInfo("paras:terminals:" + terminals.toString() + ",locType:"
				+ locType + ",options :" + options + ",overTime:" + overTime,
				"getLocation", LocationUtil.class);
		String result = "";
		try {

			SimpleDateFormat sdf = new SimpleDateFormat();
			Date date = new Date();
			LocationServiceStub stub = new LocationServiceStub();
			// 设置参数
			GetLocationRequest request = new GetLocationRequest();
//			System.out.println(PropertiesUtil.getKey());
			request.setTimeStamp(sdf.format(date));
//			request.setKey("f9babf21e6d4406c9b878169232a3168");
			request.setKey(Global.getConfig("location.key"));
			request.setLocationType(locType);
			request.setOptions(options);
			request.setOvertime(overTime);
			request.setTerminals(XmlUtil.createTerminalsXml(terminals));

			// 定位请求
			GetLocationResponse response = stub.getLocation(request);

			result = response.getGetLocationResponse();
			System.out.println(result);

			LogUtil.LogInfo("result:" + result, "getLocation",
					LocationUtil.class);
		} catch (Exception e) {
			LogUtil.logError("定位请求失败", LocationUtil.class, e);
		}
		return result;
	}
	
	/**
	 * 获取最新定位地址
	 * 
	 * @param terminals
	 * @param options
	 * @return
	 */
	public static String getLastestLocation(List<TerminalLocation> terminals,
			int options) {

		LogUtil.LogInfo("paras:terminals:" + terminals.toString() + ",options:"
				+ options, "getLastestLocation", LocationUtil.class);

		String result = "";
		try {
			LocationServiceStub stub = new LocationServiceStub();

			GetLastestLocationRequest request = new GetLastestLocationRequest();

			// 设置参数
			request.setKey(Global.getConfig("location.key"));
			request.setTerminals(XmlUtil.createTerminalsXml(terminals));
			request.setOptions(1);

			// 获取最新定位地址
			GetLastestLocationResponse response = stub
					.getLastestLocation(request);
			result = response.getGetLastestLocationResponse();

			LogUtil.LogInfo("result:" + result, "getLastestLocation",
					LocationUtil.class);

		} catch (Exception e) {
			LogUtil.logError("获取最新定位地址失败", LocationUtil.class, e);
		}
		return result;
	}

	/**
	 * 获取历史定位地址
	 * 
	 * @param mdn
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public static String getLocationHistory(String mdn, String startTime,
			String endTime) {

		LogUtil.LogInfo("paras:mdn:" + mdn + ",startTime:" + startTime
				+ ",endTime:" + endTime, "getLocationHistory",
				LocationUtil.class);

		String result = "";
		try {
			LocationServiceStub stub = new LocationServiceStub();

			SimpleDateFormat sdf = new SimpleDateFormat();
			Date date = new Date();

			GetLocationHistoryRequest request = new GetLocationHistoryRequest();

			// 设置参数
			request.setTimeStamp(sdf.format(date));
			request.setKey(Global.getConfig("location.key"));
			request.setMDN(mdn);
			request.setStartTime(startTime);
			request.setEndTime(endTime);

			// 获取历史定位地址
			GetLocationHistoryResponse response = stub
					.getLocationHistory(request);
			result = response.getGetLocationHistoryResponse();

			LogUtil.LogInfo("result:" + result, "getLocationHistory",
					LocationUtil.class);

		} catch (Exception e) {
			LogUtil.logError("获取历史定位地址失败", LocationUtil.class, e);
		}
		return result;
	}

	/**
	 * 连续定位请求
	 * 
	 * @param terminals
	 * @param locType
	 * @param options
	 * @param startDate
	 * @param endDate
	 * @param startTime
	 * @param endTime
	 * @param weekday
	 * @param interval
	 * @param upInterval
	 * @param overTime
	 * @return
	 */
	public static String getAutoLocation(List<TerminalLocation> terminals, int locType,
			int options, String startDate, String endDate, String startTime,
			String endTime, int weekday, int interval, int upInterval,
			int overTime) {

		LogUtil.LogInfo("paras:terminals:" + terminals.toString() + ",locType:"
				+ locType + ",options:" + options + ",startDate:" + startDate
				+ ",endDate:" + endDate + ",startTime:" + startTime
				+ ",endTime:" + endTime + ",weekday:" + weekday + ",interval:"
				+ interval + ",upInterval:" + upInterval, "getAutoLocation",
				LocationUtil.class);
		System.out.println("paras:terminals:" + terminals.toString() + ",locType:"
				+ locType + ",options:" + options + ",startDate:" + startDate
				+ ",endDate:" + endDate + ",startTime:" + startTime
				+ ",endTime:" + endTime );
		String result = "";
		try {
			LocationServiceStub stub = new LocationServiceStub();

			SimpleDateFormat sdf = new SimpleDateFormat();
			Date date = new Date();

			// 连续定位请求
			GetAutoLocationRequest request = new GetAutoLocationRequest();

			request.setTimeStamp(sdf.format(date));
			request.setKey(Global.getConfig("location.key"));
			request.setLocationType(locType);
			request.setOptions(options);
			request.setTerminals(XmlUtil.createTerminalsXml(terminals));
			request.setStartDate(startDate);
			request.setEndDate(endDate);
			request.setStartTime(startTime);
			request.setEndTime(endTime);
			request.setWeekDay(weekday);
			request.setInterval(interval);
			request.setUpInterval(upInterval);
			request.setOvertime(overTime);

			GetAutoLocationResponse response = stub.getAutoLocation(request);
			result = response.getGetAutoLocationResponse();

			LogUtil.LogInfo("result:" + result, "getAutoLocation",
					LocationUtil.class);

		} catch (Exception e) {
			LogUtil.logError("连续定位请求失败", LocationUtil.class, e);
		}
		return result;
	}

	/**
	 * 取消连续定位
	 * 
	 * @param terminals
	 * @return
	 */
	public static String cancelAutoLocation(List<TerminalLocation> terminals) {

		LogUtil.LogInfo("paras:terminals:" + terminals.toString(),
				"cancelAutoLocation", LocationUtil.class);

		String result = "";
		try {
			LocationServiceStub stub = new LocationServiceStub();

			SimpleDateFormat sdf = new SimpleDateFormat();
			Date date = new Date();

			CancelAutoLocationRequest request = new CancelAutoLocationRequest();
			request.setTimeStamp(sdf.format(date));
			request.setKey(Global.getConfig("location.key"));
			request.setTerminals(XmlUtil.createTerminalsXml(terminals));

			CancelAutoLocationResponse response = stub
					.cancelAutoLocation(request);
			result = response.getCancelAutoLocationResponse();

			LogUtil.LogInfo("result:" + result, "cancelAutoLocation",
					LocationUtil.class);

		} catch (Exception e) {
			LogUtil.logError("取消连续定位失败", LocationUtil.class, e);
		}
		return result;
	}

	/**
	 * 获取定位规则
	 * 
	 * @param terminals
	 * @return
	 */
	public static String queryAutoLoc(List<TerminalLocation> terminals) {

		LogUtil.LogInfo("paras:terminals:" + terminals.toString(),
				"queryAutoLoc", LocationUtil.class);

		String result = "";
		try {
			LocationServiceStub stub = new LocationServiceStub();

			SimpleDateFormat sdf = new SimpleDateFormat();
			Date date = new Date();
			// 获取定位规则
			QueryAutoLocRequest request = new QueryAutoLocRequest();
			request.setTimeStamp(sdf.format(date));
			request.setKey(Global.getConfig("location.key"));
			request.setTerminals(XmlUtil.createTerminalsXml(terminals));

			QueryAutoLocResponse response = stub.queryAutoLoc(request);
			result = response.getQueryAutoLocResponse();

			LogUtil.LogInfo("result:" + result, "queryAutoLoc",
					LocationUtil.class);

		} catch (Exception e) {
			LogUtil.logError("获取定位规则失败", LocationUtil.class, e);
		}
		return result;
	}

	/**
	 * 获取定位地址
	 * 
	 * @param entId
	 * @param locRes
	 * @param terminals
	 * @param startTime
	 * @param endTime
	 * @param nowPage
	 * @param numPerPage
	 * @return
	 */
	public static String getLocListByPage(String entId, int locRes,
			List<TerminalLocation> terminals, String startTime, String endTime,
			int nowPage, int numPerPage) {

		LogUtil.LogInfo("paras:terminals:" + terminals.toString() + ",entId:"
				+ entId + ",locRes:" + locRes + ",startTime:" + startTime
				+ ",endTime:" + endTime + ",nowPage:" + nowPage
				+ ",numPerPage:" + numPerPage, "getLocListByPage",
				LocationUtil.class);

		String result = "";
		try {

			LocationServiceStub stub = new LocationServiceStub();

			// ��ȡ��λ�б�
			GetLocListByPageRequest request = new GetLocListByPageRequest();
			request.setEntId(entId);
			request.setLocRes(locRes);
			request.setTerminals(XmlUtil.createTerminalsXml(terminals));
			request.setStartTime(startTime);
			request.setEndTime(endTime);
			request.setNowPage(nowPage);
			request.setNumPerPage(numPerPage);

			GetLocListByPageResponse response = stub.getLocListByPage(request);
			result = response.getGetLocListByPageResponse();

			LogUtil.LogInfo("result:" + result, "getLocListByPage",
					LocationUtil.class);

		} catch (Exception e) {
			LogUtil.logError("获取定位地址失败", LocationUtil.class, e);
		}
		return result;
	}

	/**
	 * 
	 * @param terminals
	 * @param locType
	 * @param options
	 * @param startDate
	 * @param endDate
	 * @param startTime
	 * @param endTime
	 * @param interval
	 * @param upInterval
	 * @param overTime
	 * @return
	 */
	public static String getAutoLocBySkd(List<TerminalLocation> terminals, int locType,
			int options, String start, String end, int interval,
			int upInterval, int overTime) {

		LogUtil.LogInfo("paras:terminals:" + terminals.toString() + ",locType:"
				+ locType + ",options:" + options + ",start:" + start + ",end:"
				+ end + ",interval:" + interval + ",upInterval:" + upInterval,
				"getAutoLocation", LocationUtil.class);

		String result = "";
		try {
			LocationServiceStub stub = new LocationServiceStub();

			SimpleDateFormat sdf = new SimpleDateFormat();
			Date date = new Date();

			// 连续定位请求
			GetAutoLocByScheduleRequest request = new GetAutoLocByScheduleRequest();

			request.setTimeStamp(sdf.format(date));
			request.setKey(Global.getConfig("location.key"));
			request.setLocationType(locType);
			request.setOptions(options);
			request.setTerminals(XmlUtil.createTerminalsXml(terminals));
			request.setStart(start);
			request.setEnd(end);
			request.setInterval(interval);
			request.setUpInterval(upInterval);
			request.setOvertime(overTime);

			GetAutoLocByScheduleResponse response = stub
					.getAutoLocBySchedule(request);
			result = response.getGetAutoLocByScheduleResponse();

			LogUtil.LogInfo("result:" + result, "getAutoLocation",
					LocationUtil.class);

		} catch (Exception e) {
			LogUtil.logError("连续定位请求失败", LocationUtil.class, e);
		}
		return result;
	}
	
	public static void main(String[] args) {
		try {
			List<TerminalLocation> terminals = new ArrayList<TerminalLocation>();
			TerminalLocation terminal = new TerminalLocation();
			terminal.setMdn("18957751796");
			terminal.setTuTpye("1");
			terminals.add(terminal);
			
			String result = LocationUtil.getLocation(terminals, 3, 3, 2);
			System.out.println(result);
//			String result = LocationUtil.getLastestLocation(terminals, 1);
//			JSONObject json = XmlUtil.xml2Json(result);
//			JSONObject locResult = json.getJSONObject("locResults").getJSONObject("locResult");
//			System.out.println(locResult.toString());
//			json.get("locResults").toString();
//			System.out.println(json.get("locResults").toString());
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String gpstime = locResult.getString("locTime");
//			System.out.println(sdf.parse(gpstime));
			
//			System.out.println("1:"+XmlUtil.xml2Json(result).toString());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}