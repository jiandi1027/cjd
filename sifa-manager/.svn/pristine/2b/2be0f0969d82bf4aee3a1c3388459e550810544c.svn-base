package com.rowell.sifa.service.dailymgr;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.DateUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.culpritinfo.CulpritMapper;
import com.rowell.sifa.mapper.dailymgr.DailyReportLastMapper;
import com.rowell.sifa.mapper.dailymgr.DailyReportMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.DailyReport;
import com.rowell.sifa.pojo.dailymgr.DailyReportLast;
import com.rowell.sifa.service.base.CrudService;

@Service
@Transactional(readOnly = true)
public class DailyReportLastService extends CrudService<DailyReportLastMapper, DailyReportLast> {
	@Autowired
	private CulpritMapper culpritMapper;
	@Autowired
	private DailyReportMapper dailyReportMapper;
	@Autowired
	private DailyReportLastMapper dailyReportLastMapper;
	@Autowired
	private DailyReportService dailyReportService;
	@Transactional(readOnly = false)
	public void save(Culprit culprit){
		//Culprit culprit=culpritMapper.selectByPrimaryKey(dailyReport.getCulpritId());
		//String dicOldMonitorGradeKey=culprit.getDicOldMonitorGradeKey();
		Date nextShouldReportDate=null;
		Date shouldReportDate=null;
		Date reportDate=culprit.getReportDate();
		String reportStatusKey="0";
//		if("27004".equals(dicOldMonitorGradeKey)||nowDate.getDate()>15){
			nextShouldReportDate=DateUtils.parseDate(DateUtils.getLastDay());
//		}else{
//			nextShouldReportDate=DateUtils.parseDate((nowDate.getYear()+1900)+"-"+(nowDate.getMonth()+1)+"-15");
//		}
		nextShouldReportDate =new Date(reportDate.getTime()+15*24*60*60*1000);
		
		DailyReportLast dailyReportLast=new DailyReportLast();
		dailyReportLast.setCulpritId(culprit.getId());
		List<DailyReportLast> dailyReportLastList=dailyReportLastMapper.selectAll(dailyReportLast);
		if(dailyReportLastList!=null&&!dailyReportLastList.isEmpty()&&dailyReportLastList.get(0)!=null){
			dailyReportLast=(DailyReportLast)dailyReportLastList.get(0);
			if(DateUtils.getDateYmd(reportDate).getTime()<=DateUtils.getDateYmd(dailyReportLast.getNextShouldReportDate()).getTime()){
				reportStatusKey=Constants.DAILY_REPORT_ON_TIME;
			}else{
				reportStatusKey=Constants.DAILY_REPORT_NOT_ON_TIME;
			}
			dailyReportLast.setDicReportStatusKey(reportStatusKey);
			shouldReportDate=dailyReportLast.getNextShouldReportDate();
			dailyReportLast.setShouldReportDate(shouldReportDate);
			//dailyReportLast.setDicOnscheduleKey(dailyReport.getDicOnscheduleKey());
			dailyReportLast.setReportDate(culprit.getReportDate());
			dailyReportLast.setDicTypeKey("50201");
			dailyReportLast.setNextShouldReportDate(nextShouldReportDate);
			dailyReportLastMapper.updateByPrimaryKeySelective(dailyReportLast);
		}else{
			dailyReportLast=new DailyReportLast();
			dailyReportLast.setCulpritId(culprit.getId());
			//dailyReportLast.setDicOnscheduleKey(dailyReport.getDicOnscheduleKey());
			dailyReportLast.setReportDate(culprit.getReportDate());
			dailyReportLast.setDicReportStatusKey(Constants.DAILY_REPORT_ON_TIME);
			dailyReportLast.setDicTypeKey("50201");
			dailyReportLast.setNextShouldReportDate(nextShouldReportDate);
			dailyReportLast.setCurrentSysUser(SysAccountUtils.getSysAccount());
			this.insert(dailyReportLast);
		}
		DailyReport dailyReport=new DailyReport();
		dailyReport.setReportDate(culprit.getReportDate());
		if(shouldReportDate!=null){
			dailyReport.setShouldReportDate(shouldReportDate);
		}
		dailyReport.setCulpritId(culprit.getId());
		dailyReport.setDicTypeKey("50201");
		dailyReport.setDicReportStatusKey(reportStatusKey);
		dailyReportService.saveOrUpdate(dailyReport);
	}
	
	/**
	 * 7天报到的人数
	 * @param culprit
	 * @return
	 */
	public int getNextReporCounttBy7Day(){
		return dao.getNextReporCounttBy7Day();
	}
	

}
	
	