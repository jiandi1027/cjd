package com.rowell.sifa.web.servlet;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.pojo.investigate.Investigate;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.terminal.TerminalLocation;
import com.rowell.sifa.service.homepage.WorkRemindService;
import com.rowell.sifa.service.investigate.InvestigateService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.web.terminal.LocationUtil;
import com.rowell.sifa.web.terminal.SpLocation;
import com.rowell.sifa.service.statistics.CulpritStatusTjService;
import com.rowell.sifa.service.statistics.CulpritWorkTjService;
import com.rowell.sifa.service.sys.IfaceRecordService;

@SuppressWarnings("serial")
public class InitializeServlet extends HttpServlet {

	private static Logger logger = Logger.getLogger(InitializeServlet.class);

	public InitializeServlet() {
		super();
	}

	@Override
	public void destroy() {
		super.destroy();
	}

	@Override
	public void init() throws ServletException {
		try {
			ServletContext servletContext = this.getServletContext();
			WebApplicationContext wac = WebApplicationContextUtils
					.getRequiredWebApplicationContext(servletContext);
			
			InvestigateService investigateService = (InvestigateService)wac.getBean("investigateService");
			TerminalService terminalService = (TerminalService)wac.getBean("terminalService");
//			TerminalActivityService terminalActivityService = (TerminalActivityService)wac.getBean("terminalActivityService");
//			TerminalHistoryService terminalHistoryService = (TerminalHistoryService)wac.getBean("terminalHistoryService");
//			TerminalAreaService terminalAreaService = (TerminalAreaService)wac.getBean("terminalAreaService");
//			SfAreaService sfAreaService = (SfAreaService)wac.getBean("sfAreaService");
//			OverAlarmService overAlarmService = (OverAlarmService)wac.getBean("overAlarmService");
			CulpritStatusTjService culpritStatusTjService = (CulpritStatusTjService)wac.getBean("culpritStatusTjService");
			CulpritWorkTjService culpritWorkTjService = (CulpritWorkTjService)wac.getBean("culpritWorkTjService");
			IfaceRecordService ifaceRecordService = (IfaceRecordService)wac.getBean("ifaceRecordService");
			WorkRemindService workRemindService=(WorkRemindService)wac.getBean("workRemindService");
			/*   定时器     start        */
			
			long currentTime = new Date().getTime();		
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, 1);
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			long nextTime = calendar.getTimeInMillis();  	//第二天零点
			
			// 审前调查上报超时定时器
			Timer timer = new Timer();
			timer.schedule(new InvestigateTemp(investigateService), (nextTime - currentTime), 24l * 60l * 60l * 1000l);		//周期一天
//			timer.schedule(new InvestigateTemp(investigateService), 10 * 1000l, 60l * 1000l);		//测试10S后启动

//			Timer timer2 = new Timer();
//			SpLocation spLocation = new SpLocation(terminalActivityService, terminalHistoryService, "2");	//定位
//			timer2.schedule(new LocationTemp(spLocation, terminalService), 30l * 1000l, 30l * 60l * 1000l);		//周期一天

			//自动生成社区矫正人员统计报表(月报)
			Timer timer3 = new Timer();
			timer3.schedule(new CulpritStatusTjTemp(culpritStatusTjService), 20l * 1000l, 1000 * 60 * 60 * 24);//每1天执行操作
			//timer3.schedule(new CulpritStatusTjTemp(culpritStatusTjService), 10 * 1000l, 60l * 1000l);//测试10S后启动
			
			//自动生成社区工作人员统计报表(季报)
			Timer timer4 = new Timer();
			timer4.schedule(new CulpritWorkTjTemp(culpritWorkTjService), 10l * 1000l, 1000l * 60l* 60l * 24l);//每1月执行操作
			//timer4.schedule(new CulpritWorkTjTemp(culpritWorkTjService), 10 * 1000l, 60l * 1000l);//测试10S后启动
			Timer timer5 = new Timer();
			timer5.schedule(new CulpritReportTjTemp(ifaceRecordService), 10l * 1000l, 1000l * 60l);//每1月执行操作

//			//柳州定位定时器
//			Timer timer6 = new Timer();
//			timer6.schedule(new LzLocationTemp(terminalService, terminalActivityService, terminalHistoryService, terminalAreaService, sfAreaService, overAlarmService, 0), 30l * 1000l, 15l * 60l * 1000l);		//周期一天
			
			//柳州定位定时器
			Timer timer6 = new Timer();
			timer6.schedule(new LzLocationTemp(terminalService, 0), 5l * 1000l, 5l * 60l * 1000l);		//周期一天
			
			//待处理定时器
			Timer timer7 = new Timer();
			timer7.schedule(new WorkRemindTemp(workRemindService), 10l * 1000l, 1000 * 60 * 60*12 );//每12小时执行操作
			/*   定时器     end        */

		} catch (Exception e) {
			logger.error(e);
		}
	}
}




class InvestigateTemp extends TimerTask {
	private static Logger logger = Logger.getLogger(InvestigateTemp.class);
	private InvestigateService investigateService;
	
	public InvestigateTemp(InvestigateService investigateService) {
		this.investigateService = investigateService;
	}
	
	public void run() {
		try {
			logger.info("**********审前调查上报定时器启动:" + new Date() + "**********");
			
			List<Investigate> list = investigateService.findAll(new Investigate());
			for (Investigate investigate : list) {
				if (investigate.getApplyUnLock() != null) {
					if (investigate.getApplyUnLock() == 0 && investigate.getLockTime() != null) {	
						if (DateUtils.getDistanceOfDayTwoDate(investigate.getLockTime(), new Date()) >= Constants.INVESTIGATE_TIMEOUT) {//上报已超时
							try {
								investigate.setApplyUnLock(2);//设置上报状态处于待上报解锁状态

								investigate.setCurrentSysUser(new SysAccount());
								investigateService.updateByIdSelective(investigate);
							} catch (Exception e) {
								// TODO: handle exception
								e.printStackTrace();
							}
						}
					}
				}
			}
			
			logger.info("**********审前调查上报定时器结束-----成功:" + new Date() + "**********");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.info("**********审前调查上报定时器结束-----失败:" + new Date() + "**********");
		}
	}
}



//CulpritStatusTj实体类自动生成列表数据
class CulpritStatusTjTemp extends TimerTask {
	private CulpritStatusTjService culpritStatusTjService;
	
	public CulpritStatusTjTemp(CulpritStatusTjService culpritStatusTjService) {
		this.culpritStatusTjService = culpritStatusTjService;
	}
	public void run() {
		try {
			Calendar calendar = Calendar.getInstance();
			int day=calendar.get(Calendar.DAY_OF_MONTH);
			if(day==1){//每月1号执行
				culpritStatusTjService.timerInsert();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


//WorkRemind实体类自动生成待处理数据
class WorkRemindTemp extends TimerTask {
	private WorkRemindService workRemindService;
	
	public WorkRemindTemp(WorkRemindService workRemindService) {
		this.workRemindService = workRemindService;
	}
	public void run() {
		try {
			workRemindService.insertWorkRemind();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

class CulpritReportTjTemp extends TimerTask {
	private IfaceRecordService ifaceRecordService;
	
	public CulpritReportTjTemp(IfaceRecordService ifaceRecordService) {
		this.ifaceRecordService = ifaceRecordService;
	}
	public void run() {
		try {
			ifaceRecordService.ifaceRecordJob();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

//class LocationTemp extends TimerTask {
//	private static Logger logger = Logger.getLogger(LocationTemp.class);
//	
//	private SpLocation spLocation;
//	
//	private TerminalService terminalService;
//	
//	public LocationTemp(SpLocation spLocation, TerminalService terminalService) {
//		this.spLocation = spLocation;
//		this.terminalService = terminalService;
//	}
//	
//	public void run() {
//		try {
//			logger.info("**********定位定时器开始:" + new Date() + "**********");
//			
//			String str = "";
//			Terminal record = new Terminal();
//			List<Terminal> list = terminalService.findAll(record);
//			for (Iterator iter = list.iterator(); iter.hasNext();) {
//				Terminal terminal = (Terminal) iter.next();
//				if (!StringUtils.isBlank(terminal.getMobileNumber())) {
//					if (str == "") {
//						str += terminal.getMobileNumber();
//					}
//					else str += "," + terminal.getMobileNumber();
//				}
//			}
//			System.out.println("telno:" + str);
//			spLocation.spCall(str);
//			
//			logger.info("**********定位定时器结束-----成功:" + new Date() + "**********");
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			logger.info("**********定位定时器结束-----失败:" + new Date() + "**********");
//		}
//	}
//}


//自动生成社区工作人员统计报表
class CulpritWorkTjTemp extends TimerTask {
	private CulpritWorkTjService culpritWorkTjService;
	
	public CulpritWorkTjTemp(CulpritWorkTjService culpritWorkTjService) {
		this.culpritWorkTjService = culpritWorkTjService;
	}
	public void run() {
		try {
			Calendar calendar = Calendar.getInstance();
			int day=calendar.get(Calendar.DAY_OF_MONTH);
			int month = calendar.get(Calendar.MONTH) + 1;
			if(day==1){//每月1号执行
				if(month==1 || month==4 || month==7 || month==10){//1,4,7,10月执行一次	
					culpritWorkTjService.timerInsert();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


//class LzLocationTemp extends TimerTask {
//	private static Logger logger = Logger.getLogger(LzLocationTemp.class);
//
//	private TerminalService terminalService;
//
//	private TerminalActivityService terminalActivityService;
//
//	private TerminalHistoryService terminalHistoryService;
//
//	private TerminalAreaService terminalAreaService;
//
//	private SfAreaService sfAreaService;
//
//	private OverAlarmService overAlarmService;
//	
//	private int count;
//	
//	public LzLocationTemp(TerminalService terminalService, TerminalActivityService terminalActivityService, TerminalHistoryService terminalHistoryService,
//			TerminalAreaService terminalAreaService, SfAreaService sfAreaService, OverAlarmService overAlarmService, int count) {
//		this.terminalService = terminalService;
//		this.terminalActivityService = terminalActivityService;
//		this.terminalHistoryService = terminalHistoryService;
//		this.terminalAreaService = terminalAreaService;
//		this.sfAreaService = sfAreaService;
//		this.overAlarmService = overAlarmService;
//		this.count = count;
//	}
//	
//	public void run() {
//		try {
//			logger.info("**********定位定时器开始:" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "**********");
//
//			count ++;
//			if (count > 24 * 12) {
//				count = count - 24 * 12;
//			}
//			List<Terminal> list = terminalService.findTerminalListByLocation(count);
//			logger.info("此次共有"+list.size()+"终端需要定位,时间：" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
//			LzLocation lz = new LzLocation(terminalService, terminalActivityService, terminalHistoryService, terminalAreaService, sfAreaService, overAlarmService);
//			for (Terminal terminal : list) {
//				if (!StringUtils.isBlank(terminal.getMobileNumber())) {
//					try {
//						lz.spcall(terminal.getMobileNumber());
//					} catch (Exception e) {
//						// TODO: handle exception
//						logger.info("定位号码："+terminal.getMobileNumber()+"定位失败，时间：" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
//						logger.info(e.getMessage());
//					}
//				}
//			}
//			
//			logger.info("**********定位定时器结束-----成功:" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "**********");
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			logger.info("**********定位定时器结束-----失败:" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "**********");
//		}
//	}
//	
//	public String formatDate(Date date, String pattern) {
//		if (pattern == null || pattern.equals("") || pattern.equals("null")) {
//			pattern = "yyyy-MM-dd";
//		}
//		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(pattern);
//		return sdf.format(date);
//	}
//}

class LzLocationTemp extends TimerTask {
	private static Logger logger = Logger.getLogger(LzLocationTemp.class);

	private TerminalService terminalService;
	
	private int count;
	
	public LzLocationTemp(TerminalService terminalService, int count) {
		this.terminalService = terminalService;
		this.count = count;
	}
	
	public void run() {
		try {
			logger.info("**********定位定时器开始:" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "**********");

			count ++;
			if (count > 24 * 12) {
				count = count - 24 * 12;
			}
			List<Terminal> list = terminalService.findTerminalListByLocation(count);
			logger.info("此次共有"+list.size()+"终端需要定位,时间：" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
//			LzLocation lz = new LzLocation(terminalService, terminalActivityService, terminalHistoryService, terminalAreaService, sfAreaService, overAlarmService);
			for (Terminal terminal : list) {
				if (!StringUtils.isBlank(terminal.getMobileNumber())) {
					try {
//						lz.spcall(terminal.getMobileNumber());
						List<TerminalLocation> terminals = new ArrayList<TerminalLocation>();
						TerminalLocation record = new TerminalLocation();
						record.setMdn(terminal.getMobileNumber());
						record.setTuTpye("1");
						terminals.add(record);
						LocationUtil.getLocation(terminals, 3, 3, 2);
					} catch (Exception e) {
						// TODO: handle exception
						logger.info("定位号码："+terminal.getMobileNumber()+"定位失败，时间：" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
						logger.info(e.getMessage());
					}
				}
			}
			
			logger.info("**********定位定时器结束-----成功:" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "**********");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.info("**********定位定时器结束-----失败:" + formatDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "**********");
		}
	}
	
	public String formatDate(Date date, String pattern) {
		if (pattern == null || pattern.equals("") || pattern.equals("null")) {
			pattern = "yyyy-MM-dd";
		}
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(pattern);
		return sdf.format(date);
	}
}
