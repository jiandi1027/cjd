package com.rowell.wyh;

import java.awt.geom.Point2D;
import java.awt.geom.Point2D.Double;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.dailymgr.TerminalArea;
import com.rowell.sifa.pojo.monitoring.SfArea;
import com.rowell.sifa.pojo.monitoring.Terminal;
import com.rowell.sifa.service.monitoring.SfAreaService;
import com.rowell.sifa.service.monitoring.TerminalAreaService;
import com.rowell.sifa.service.monitoring.TerminalService;
import com.rowell.sifa.web.servlet.InitializeServlet;

import groovy.util.StringTestUtil;
import net.sf.json.JSONArray;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class Test1 {
	private static Logger logger = Logger.getLogger(InitializeServlet.class);   
	@Resource
	SfAreaService sfAreaService;
	@Resource
	TerminalAreaService terminalAreaService;
	@Resource
	TerminalService terminalService;
	@Test    
	public void saveTest() { 
		
		String x="120.1617445782";
		String y="30.2799186759";
		
		String x1="120.6993900000";
		String y1="27.9949200000";
		
		String x2="121.074413";
		String y2="28.020375";
		String mobileNumber="017060617000009";
		isPointInPolygon(x, y, mobileNumber);
		isPointInPolygon(x1, y1, mobileNumber);
		isPointInPolygon(x2, y2, mobileNumber);
	}  
	public String isPointInPolygon(String x,String y,String mobileNumber){
		List<SfArea> areaList = getArea(mobileNumber);
		Terminal terminalWhere =new Terminal();
		terminalWhere.setMobileNumber(mobileNumber);
		List<Terminal> terminalList = terminalService.findAll(terminalWhere);
		String leaveAreaNames="";
		String inAreaNames="";
		for(SfArea a:areaList){
			List<List<Double>> plolygons = getPlolygons(a);
			boolean flag=false;
			for(List<Double> plolygon:plolygons){
				flag = checkWithJdkGeneralPath(getPoint(x, y), plolygon);
				if(flag) break;
			}
			if(!flag){
				leaveAreaNames+=" ("+a.getName()+") ";
			}else{
				inAreaNames+=" ("+a.getName()+") ";
			}
		}
		if(!StringUtils.isBlank(leaveAreaNames)){
			String msg="矫正对象:"+terminalList.get(0).getCulpritName()+" 终端号:"+mobileNumber+" 已离开区域:["+leaveAreaNames+"] ";
			if(!StringUtils.isBlank(inAreaNames)){
				msg+="但仍在区域:["+inAreaNames+"]";
			}
			return msg;
		}
		return "";
	}
	public Double getPoint(String x,String y){
		try{
			double x1 = java.lang.Double.parseDouble(x);
			double y1 = java.lang.Double.parseDouble(y);
			return new Point2D.Double(x1,y1);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public List<List<Point2D.Double>> getPlolygons(SfArea sfArea){
		String remark = sfArea.getRemark();
		if(!StringUtils.isBlank(remark)){
			return remarkToPolygonList(remark);
		}
		return null;
	}
	public List<List<Point2D.Double>> remarkToPolygonList(String remark){
		List<List<Point2D.Double>> polygonList=new ArrayList<List<Point2D.Double>>();
		JSONArray arr = JSONArray.fromObject(remark);
        for(Object o :arr){
            JSONArray a = (JSONArray)o;
            List<Point2D.Double> ploygon=new ArrayList<Point2D.Double>();
            for(int i = 0 ; i < a.size() ; i++){
                String j = (String)a.get(i);
                String[] split = j.split(",");
                Double point = getPoint(split[0], split[1]);
                ploygon.add(point);
            }
            polygonList.add(ploygon);
        }
        return polygonList;
	}
	public List<SfArea> getArea(String mobileNumber){
		String str="";
		List<SfArea> sfAreaList=new ArrayList<SfArea>();
		Terminal terminalWhere =new Terminal();
		terminalWhere.setMobileNumber(mobileNumber);
		List<Terminal> terminalList = terminalService.findAll(terminalWhere);
		if(terminalList!=null&&terminalList.size()>0){
			int i=1;
			str+="[终端号码：["+mobileNumber+"] 绑定终端总数:"+terminalList.size()+"] [";
			for(Terminal t:terminalList){
				str+=i+".矫正对象["+t.getCulpritName()+"] 绑定终端:(类型-"+t.getType()+")  " ;
				TerminalArea terminalAreaWhere=new TerminalArea();
				terminalAreaWhere.setTerminalid(t.getId());
				List<TerminalArea> terminalAreaList = terminalAreaService.findAll(terminalAreaWhere);
				for(TerminalArea a:terminalAreaList){
					SfArea sfArea = sfAreaService.findById(a.getAreaId());
					sfAreaList.add(sfArea);
				}
				++i;
			}
			str+="]";
			str+="[绑定区域总数："+sfAreaList.size()+"]";
		}
//		System.out.println(str);
		logger.info(str);
		return sfAreaList;
	}
	public static boolean checkWithJdkGeneralPath(Point2D.Double point, List<Point2D.Double> polygon) {
		   java.awt.geom.GeneralPath p = new java.awt.geom.GeneralPath();
		   Point2D.Double first = polygon.get(0);
		   p.moveTo(first.x, first.y);

		   for (Point2D.Double d : polygon) {
		      p.lineTo(d.x, d.y);
		   }

		   p.lineTo(first.x, first.y);

		   p.closePath();

		   return p.contains(point);

	}

}
