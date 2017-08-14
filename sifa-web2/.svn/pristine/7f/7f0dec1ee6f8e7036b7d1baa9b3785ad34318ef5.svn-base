package com.rowell.sifa.web.terminal;

import java.text.DecimalFormat;

import com.sun.org.apache.xerces.internal.impl.dtd.models.DFAContentModel;

public class OffsetUtil {
	final static double pi = 3.14159265358979324;  
    final static double a = 6378245.0;  
    final static double ee = 0.00669342162296594323;  
  
    final static DecimalFormat    df   = new DecimalFormat("######0.0000000");  
    public static void main(String[] args) {
    	System.out.println(transformGPS2MapABC(28.017773,120.70581)[0]+"---"+transformGPS2MapABC(28.017773,120.70581)[1]);
    	//transformGPS2MapABC(28.196781252087238,120.30432641526897);
    }
    /**
     * ��GPS��ʽ��γ��ת����MapABC��ʽ��γ��
     * @param wgLat
     * @param wgLon
     * @return
     */
    public static double[] transformGPS2MapABC(double wgLat, double wgLon) {
    	double[] latlng={1,1};
        if (outOfChina(wgLat, wgLon)) {  
            latlng[0] = wgLat;  
            latlng[1] = wgLon;  
            return null;  
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
   * ��mapABC��ʽ��γ��ת����GPS��ʽ��γ��
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
}
