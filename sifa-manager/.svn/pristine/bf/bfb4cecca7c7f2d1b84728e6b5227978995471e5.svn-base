package com.rowell.sifa.service.monitoring;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.mapper.monitoring.TerminalMapper;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.monitoring.TerminalActivity;
import com.rowell.sifa.pojo.monitoring.TerminalHistory;
import com.rowell.sifa.service.base.CrudService;

import net.sf.json.JSONObject;

@Service
@Transactional(readOnly = true)
public class TerminalService  extends CrudService<TerminalMapper, Terminal> { 
	@Autowired
	private TerminalActivityService terminalActivityService;
	@Autowired
	private TerminalHistoryService terminalHistoryService;
//	@Autowired
//	private TerminalActivityService terminalActivityService;
	
	
	@Transactional(readOnly = false)
	public void deleteMore(Terminal terminal){
		if (terminal != null) {
			TerminalActivity terminalActivity = new TerminalActivity();
			terminalActivity.setTerminalId(terminal.getId());
			List<TerminalActivity> list = terminalActivityService.findAll(terminalActivity);
			if (list.size() > 0) {
				terminalActivityService.deleteById(list.get(0).getId());
			}
			
			super.deleteById(terminal.getId());
		}
	}
	
	public List<Terminal> findTerminalListByLocation(int count){
		List<Terminal> list = new ArrayList<Terminal>();
		Terminal record = new Terminal();
		record.setType("手机");
		try {
			record.setIntervalTime("5分钟/次");
			List<Terminal> list1 = super.findAll(record);
			list.addAll(list1);
			if (count%2 == 0) {
				record.setIntervalTime("10分钟/次");
				List<Terminal> list2 = super.findAll(record);
				list.addAll(list2);
			}
			if (count%6 == 0) {
				record.setIntervalTime("30分钟/次");
				List<Terminal> list3 = super.findAll(record);
				list.addAll(list3);
			}
			if (count%12 == 0) {
				record.setIntervalTime("1小时/次");
				List<Terminal> list4 = super.findAll(record);
				list.addAll(list4);
			}
			if (count%24 == 0) {
				record.setIntervalTime("2小时/次");
				List<Terminal> list5 = super.findAll(record);
				list.addAll(list5);
			}
			if (count%144 == 0) {
				record.setIntervalTime("12小时/次");
				List<Terminal> list6 = super.findAll(record);
				list.addAll(list6);
			}
			if (count%288 == 0) {
				record.setIntervalTime("24小时/次");
				List<Terminal> list7 = super.findAll(record);
				list.addAll(list7);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			//e.getMessage();
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//暂时测试用
	public void updateTerminal(JSONObject xml){
		try {
			System.out.println(xml);
			JSONObject locResult = xml.getJSONObject("locResults").getJSONObject("locResult");
			String mobileNumber = locResult.getString("MDN");
			String errorCode = locResult.getString("result");
			String lon = locResult.getString("longitude");
			String lat = locResult.getString("latitude");
			String location = locResult.getString("locDesc");
			String gpstime = locResult.getString("locTime");
			Terminal terminal = new Terminal();
			terminal.setMobileNumber(mobileNumber);
			List<Terminal> terminallist = this.findAll(terminal);
			if (terminallist != null && terminallist.size() > 0) {
				String terminalId = terminallist.get(0).getId();
				
				TerminalHistory terminalHistory = new TerminalHistory();
				terminalHistory.setTerminalId(terminalId);
				terminalHistory.setMobileNumber(mobileNumber);
				terminalHistory.setErrorCode(errorCode);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					terminalHistory.setGpstime(sdf.parse(gpstime));
				} catch (Exception e) {
					// TODO: handle exception
					logger.info("定位时间转换出错");
				}
				terminalHistory.setLocation(location);
				terminalHistory.setIsLive(getIsLive(errorCode));
				terminalHistory.setLocationType(Constants.LOCATIONTYPE_JZDW);
				if (StringUtils.isBlank(lon)) {
					terminalHistory.setLon(Float.valueOf(lon));
				}
				if (StringUtils.isBlank(lat)) {
					terminalHistory.setLon(Float.valueOf(lat));
				}
				terminalHistoryService.insertSelective(terminalHistory);
				
				
				TerminalActivity terminalActivity = new TerminalActivity();
				terminalActivity.setMobileNumber(mobileNumber);
				List<TerminalActivity> terminalActivitieList = terminalActivityService.findAll(terminalActivity);
				
				terminalActivity.setTerminalId(terminalId);
				terminalActivity.setErrorCode(errorCode);
				try {
					terminalActivity.setGpstime(sdf.parse(gpstime));
				} catch (Exception e) {
					// TODO: handle exception
					logger.info("定位时间转换出错");
				}
				terminalActivity.setLocation(location);
				terminalActivity.setIsLive(getIsLive(errorCode));
				terminalActivity.setLocationType(Constants.LOCATIONTYPE_JZDW);
				if (StringUtils.isBlank(lon)) {
					terminalActivity.setLon(Float.valueOf(lon));
				}
				if (StringUtils.isBlank(lat)) {
					terminalActivity.setLon(Float.valueOf(lat));
				}
				if (terminalActivitieList != null && terminalActivitieList.size() > 0) {
					terminalActivity.setId(terminalActivitieList.get(0).getId());
					
					terminalActivityService.updateByIdSelective(terminalActivity);
				}
				else {
					terminalActivityService.insertSelective(terminalActivity);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public String getIsLive(String errorCode){
		String isLive = "";
		if (errorCode.equals("0")) {
			isLive = "在线";
		}
		else {
			isLive = "掉线";
		}
		return isLive;
	}
}
