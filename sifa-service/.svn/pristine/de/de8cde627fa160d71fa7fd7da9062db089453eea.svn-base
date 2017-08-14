package com.rowell.sifa.sys.utils;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class OffsetUtil {
	final static double pi = 3.14159265358979324;  
    final static double a = 6378245.0;  
    final static double ee = 0.00669342162296594323;  
  
    final static DecimalFormat    df   = new DecimalFormat("######0.0000000");  
    public static void main(String[] args) {
    	//System.out.println(transformGPS2MapABC(28.017773,120.70581)[0]+"---"+transformGPS2MapABC(28.017773,120.70581)[1]);
    	//transformGPS2MapABC(28.196781252087238,120.30432641526897);
    	System.out.println(getMapBarAddr("120.988555000000005","27.852663999999997"));
//    	System.out.println(getMapBarAddr("109.561618","24.663036"));
//    	System.out.println(getMapBarAddr("0","0"));
    }
    /**
     * 将GPS格式经纬度转换成MapABC格式经纬度
     * @param wgLat
     * @param wgLon
     * @return
     */
    public static double[] transformGPS2MapABC(double wgLat, double wgLon) {
    	double[] latlng={1,1};
        if (outOfChina(wgLat, wgLon)) {  
            latlng[0] = wgLat;  
            latlng[1] = wgLon;  
            return latlng;  
        }  
        double dLat = transformLat(wgLon - 105.0, wgLat - 35.0);  
        double dLon = transformLon(wgLon - 105.0, wgLat - 35.0);  
        double radLat = wgLat / 180.0 * pi;  
        double magic = Math.sin(radLat);  
        magic = 1 - ee * magic * magic;  
        double sqrtMagic = Math.sqrt(magic);  
        dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);  
        dLon = (dLon * 180.0) / (a / sqrtMagic * Math.cos(radLat) * pi);  
        latlng[0] = Double.parseDouble(df.format(wgLat+dLat));
        latlng[1] = Double.parseDouble(df.format(wgLon + dLon));
        return latlng;
    }  
  /**
   * 将mapABC格式经纬度转换成GPS格式经纬度
   * @param lat
   * @param lon
   * @return
   */
    public static double[] transformMapABC2GPS(double lat, double lon) {
    	double[] lnglat = transformGPS2MapABC(lat,lon);
    	lnglat[0]=Double.parseDouble(df.format(2*lat-lnglat[0]));
    	lnglat[1]=Double.parseDouble(df.format(2*lon-lnglat[1]));
    	return lnglat;
    }
    private static boolean outOfChina(double lat, double lon) {  
        if (lon < 72.004 || lon > 137.8347)  
            return true;  
        if (lat < 0.8293 || lat > 55.8271)  
            return true;  
        return false;  
    }  
  
    private static double transformLat(double x, double y) {  
        double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * Math.sqrt(Math.abs(x));  
        ret += (20.0 * Math.sin(6.0 * x * pi) + 20.0 * Math.sin(2.0 * x * pi)) * 2.0 / 3.0;  
        ret += (20.0 * Math.sin(y * pi) + 40.0 * Math.sin(y / 3.0 * pi)) * 2.0 / 3.0;  
        ret += (160.0 * Math.sin(y / 12.0 * pi) + 320 * Math.sin(y * pi / 30.0)) * 2.0 / 3.0;  
        return ret;  
    }  
  
    private static double transformLon(double x, double y) {  
        double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * Math.sqrt(Math.abs(x));  
        ret += (20.0 * Math.sin(6.0 * x * pi) + 20.0 * Math.sin(2.0 * x * pi)) * 2.0 / 3.0;  
        ret += (20.0 * Math.sin(x * pi) + 40.0 * Math.sin(x / 3.0 * pi)) * 2.0 / 3.0;  
        ret += (150.0 * Math.sin(x / 12.0 * pi) + 300.0 * Math.sin(x / 30.0 * pi)) * 2.0 / 3.0;  
        return ret;  
    }  
    
    /**
     * 获取地址方法
     * @param info	http请求的全路径
     * @return
     */
  //传入的是高德地图格式的经纬度，所以需要先将gps格式的转换成amap格式
  	public static String getMapBarAddr(String lon,String lat){
  		double[] aaa = OffsetUtil.transformGPS2MapABC(Double.parseDouble(lat), Double.parseDouble(lon));
  		try{
	  		lon = aaa[1]+"";
	  		lat = aaa[0]+"";
  		}catch(Exception e){
  		}
  		//返回51地图的地址信息，json格式,纠偏之后的经纬度返回正确的地址信息
  		//String url = String.format("http://rgc.vip.51ditu.com/rgc?pos=%s,%s&amp;type=1", lon,lat);
  		//120.813416-27.918598浙江省温州市龙湾区永定路辅路向北17米嘉年华游乐园往东南方向59米
  		String localhost_key="b17e271bb6baca9f23a3715c2656d860";
//  		String server_key="09a5f5f23571a160e00e2660f4a63d30";
  		String url = "http://restapi.amap.com/v3/geocode/regeo?output=json&location="+lon+","+lat+"&key="+localhost_key+"&roadlevel=1&radius=1000&extensions=all";//&coord_type=1
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
  					regeocode = JSONObject.fromObject(regeocode.toString().replace("\"roadinters\":{}", "\"roadinters\":[]"));
  					addr.append(regeocode.getString("formatted_address"));//具体地址
  					JSONArray roadinters = regeocode.getJSONArray("roadinters");//所有道路list
  					//JSONObject street = ad_reference.getJSONObject("street");
  					if(roadinters.size()>0){
  						JSONObject roadinter = roadinters.getJSONObject(0);
  						addr.append(","+roadinter.getString("first_name")+"跟"+roadinter.getString("second_name")+"向");
  						addr.append(roadinter.getString("direction")+"方向"+roadinter.getString("distance")+"米");//交叉路名
  					}
  				}else{
//  					addr.append(json.getString("info")+"，请稍后再发起请求");
  					System.out.println(json.getString("info")+"，请稍后再发起请求");
					addr.append("当前无定位信息");		//错误地址暂时先返回这个
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
}
