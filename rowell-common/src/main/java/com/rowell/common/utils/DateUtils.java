package com.rowell.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.time.LocalDate;
//import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.time.DateFormatUtils;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 * @author marcle
 * @version 2015-07-8
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {
	
	private static String[] parsePatterns = {
		"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM", 
		"yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM",
		"yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM"};

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDate() {
		return getDate("yyyy-MM-dd");
	}
	/**
	 * <p>
	 * description:取得某个时间前n天
	 * </p>
	 * 
	 * @param date
	 * @param n
	 * @return Date
	 */
	public static Date getNDayDate(Date date, int n) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, n);
		return calendar.getTime();
	}
	/**
	 * <p>
	 * description:取得某个时间前n小时
	 * </p>
	 * 
	 * @param date
	 * @param n
	 * @return Date
	 */
	public static Date getNHourDate(Date date, int n) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.HOUR_OF_DAY, n);
		return calendar.getTime();
	}
	/**
	 * <p>
	 * description:取得某个时间前几分 或者后几分
	 * </p>
	 * 
	 * @param date
	 * @param n
	 * @return Date
	 */
	public static Date getNMinuteDate(Date date, int n) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MINUTE, n);
		return calendar.getTime();
	}
	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String getDate(String pattern) {
		return DateFormatUtils.format(new Date(), pattern);
	}
	
	/**
	 * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String formatDate(Date date, Object... pattern) {
		String formatDate = null;
		if (pattern != null && pattern.length > 0) {
			formatDate = DateFormatUtils.format(date, pattern[0].toString());
		} else {
			formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
		}
		return formatDate;
	}
	
	/**
	 * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String formatDateTime(Date date) {
		return formatDate(date, "yyyy-MM-dd HH:mm:ss");
	}
	
	public static String formatYMD(Date date){
		return formatDate(date, "yyyy-MM-dd");
	}

	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime() {
		return formatDate(new Date(), "HH:mm:ss");
	}

	/**
	 * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String getDateTime() {
		return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到当前年份字符串 格式（yyyy）
	 */
	public static String getYear() {
		return formatDate(new Date(), "yyyy");
	}

	/**
	 * 得到当前月份字符串 格式（MM）
	 */
	public static String getMonth() {
		return formatDate(new Date(), "MM");
	}

	/**
	 * 得到当天字符串 格式（dd）
	 */
	public static String getDay() {
		return formatDate(new Date(), "dd");
	}

	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static String getWeek() {
		return formatDate(new Date(), "E");
	}
	
	/**
	 * 日期型字符串转化为日期 格式
	 * { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", 
	 *   "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm",
	 *   "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm" }
	 */
	public static Date parseDate(Object str) {
		if (str == null){
			return null;
		}
		try {
			return parseDate(str.toString(), parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 获取过去的天数
	 * @param date
	 * @return
	 */
	public static long pastDays(Date date) {
		long t = new Date().getTime()-date.getTime();
		return t/(24*60*60*1000);
	}

	/**
	 * 获取过去的小时
	 * @param date
	 * @return
	 */
	public static long pastHour(Date date) {
		long t = new Date().getTime()-date.getTime();
		return t/(60*60*1000);
	}
	
	/**
	 * 获取过去的分钟
	 * @param date
	 * @return
	 */
	public static long pastMinutes(Date date) {
		long t = new Date().getTime()-date.getTime();
		return t/(60*1000);
	}
	
	/**
	 * 转换为时间（天,时:分:秒.毫秒）
	 * @param timeMillis
	 * @return
	 */
    public static String formatDateTime(long timeMillis){
		long day = timeMillis/(24*60*60*1000);
		long hour = (timeMillis/(60*60*1000)-day*24);
		long min = ((timeMillis/(60*1000))-day*24*60-hour*60);
		long s = (timeMillis/1000-day*24*60*60-hour*60*60-min*60);
		long sss = (timeMillis-day*24*60*60*1000-hour*60*60*1000-min*60*1000-s*1000);
		return (day>0?day+",":"")+hour+":"+min+":"+s+"."+sss;
    }
    
    /**
	 * 比较两个日期的大小
	 * 
	 * @param before
	 * @param after
	 * @return
	 */
	public static boolean compareDate(Date before, Date after) {
		long beforeTime = before.getTime();
		long afterTime = after.getTime();
		if (afterTime >= beforeTime) {
			return true;
		}
		else return false;
	}
	
	/**
	 * 获取两个日期之间的天数
	 * 
	 * @param before
	 * @param after
	 * @return
	 */
	public static Integer getDistanceOfTwoDate(Date before, Date after) {
		long beforeTime = before.getTime();
		long afterTime = after.getTime();
		long between_days = (afterTime - beforeTime) / (1000 * 60 * 60 * 24);
		return Integer.parseInt(String.valueOf(between_days)); 
	}
	
	/**  
     * 计算两个日期之间相差的天数  
     * @param smdate 较小的时间 
     * @param bdate  较大的时间 
     * @return 相差天数 
     * @throws ParseException  
     */    
    public static int daysBetween(Date smdate,Date bdate) throws ParseException    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        smdate=sdf.parse(sdf.format(smdate));  
        bdate=sdf.parse(sdf.format(bdate));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(smdate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(bdate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));           
    }    

	/**
	 * 获取两个日期之间的天数(不计算时分秒)
	 * 
	 * @param before
	 * @param after
	 * @return
	 */
	public static int getDistanceOfDayTwoDate(Date before, Date after) {
		Calendar c = Calendar.getInstance();
		c.setTime(after);
		int day1 = c.get(Calendar.DAY_OF_YEAR);
		c.setTime(before);
		int day2 = c.get(Calendar.DAY_OF_YEAR);
		return day1-day2;
	}
	
	/**
	 * @param args
	 * @throws ParseException
	 */
	public static void main(String[] args) throws ParseException {
//		System.out.println(formatDate(parseDate("2010/3/6")));
//		System.out.println(getDate("yyyy年MM月dd日 E"));
//		long time = new Date().getTime()-parseDate("2012-11-19").getTime();
//		System.out.println(time/(24*60*60*1000));
//		ChineseDateFormat(2014);
//		System.out.println(ChineseDateFormatByUnit(20));
//		Date nowDate=new Date();
//		Date nextShouldReportDate=parseDate((nowDate.getYear()+1900)+"-"+(nowDate.getMonth()+1)+"-15");
		System.out.println(getDateYmd(new Date()));
	}
	
	public static String ChineseDateFormat(int date){
		String[] str = { "〇", "一", "二", "三", "四", "五", "六", "七", "八", "九" };
		  String s = String.valueOf(date);
	        System.out.println(s);
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < s.length(); i++) {
	            String index = String.valueOf(s.charAt(i));
	            sb = sb.append(str[Integer.parseInt(index)]);
	        }
	        return sb.toString();
	}
	
	public static String ChineseDateFormatByUnit(int date){
	        String[] str = { " ", "一", "二", "三", "四", "五", "六", "七", "八", "九" };

	        String ss[] = new String[] { "", "十", "百", "千", "万", "十", "百", "千", "亿" };
	        String s = String.valueOf(date);
	    
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < s.length(); i++) {
	            String index = String.valueOf(s.charAt(i));
	            sb = sb.append(str[Integer.parseInt(index)]);
	        }
	        String sss = String.valueOf(sb);
	        int i = 0;
	        for (int j = sss.length(); j > 0; j--) {
	            sb = sb.insert(j, ss[i++]);
	        }
	        return sb.toString();
	}
	
	/**
	 * 当前月的最后一天
	 * @return
	 */
	public static String getLastDay() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        Date theDate = calendar.getTime();
        String s = df.format(theDate);
        return s;

    }
	
	/**
	 * 去掉日期的时分秒
	 * @param date
	 * @return
	 */
	public static Date getDateYmd(Date date){
//		LocalDate localDate=date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
//		Date newDate=java.sql.Date.valueOf(localDate);
		
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String s = sdf.format(date);
			Date newDate = sdf.parse(s);
			return newDate;
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 获取上一个月的第一天
	 * @return
	 */
	public static Date getLastMonthFirstDay(){
		Calendar   cal_1=Calendar.getInstance();//获取当前日期 
		cal_1.add(Calendar.MONTH, -1);
		cal_1.set(Calendar.DAY_OF_MONTH,1);
		return cal_1.getTime();
	}
	
	/**
	 * 获取上一个月的最后一天
	 * @return
	 */
	public static Date getLastMonthLastDay(){
		Calendar cale = Calendar.getInstance();   
		cale.set(Calendar.DAY_OF_MONTH,0);//设置为1号,当前日期既为本月第一天 
		return cale.getTime();
	}
	
}
