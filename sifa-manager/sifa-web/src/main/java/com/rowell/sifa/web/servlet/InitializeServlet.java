package com.rowell.sifa.web.servlet;

import java.util.Calendar;
import java.util.Date;
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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.pojo.investigate.Investigate;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.investigate.InvestigateService;

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
			
			/*   定时器     end        */

		} catch (Exception e) {
			logger.error(e);
		}
	}
}




class InvestigateTemp extends TimerTask {
	private InvestigateService investigateService;
	
	public InvestigateTemp(InvestigateService investigateService) {
		this.investigateService = investigateService;
	}
	
	public void run() {
		try {
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
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}




