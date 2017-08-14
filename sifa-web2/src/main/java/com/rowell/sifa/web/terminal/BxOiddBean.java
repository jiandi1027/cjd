package com.rowell.sifa.web.terminal;

import java.rmi.RemoteException;
import java.util.Calendar;
import java.util.Date;

import javax.xml.rpc.ServiceException;

import com.rowell.sifa.web.terminal.oidd.Header;
import com.rowell.sifa.web.terminal.oidd.HeaderHead_name;
import com.rowell.sifa.pojo.sys.SysBxOidd;
import com.rowell.sifa.web.terminal.oidd.Attr;
import com.rowell.sifa.web.terminal.oidd.AttrAttr_name;
import com.rowell.sifa.web.terminal.oidd.Body_attr;
import com.rowell.sifa.web.terminal.oidd.Body_attrType;
import com.rowell.sifa.web.terminal.oidd.Body_object;
import com.rowell.sifa.web.terminal.oidd.OiddQuery;
import com.rowell.sifa.web.terminal.oidd.OiddQueryService;
import com.rowell.sifa.web.terminal.oidd.OiddQueryServiceLocator;
import com.rowell.sifa.web.terminal.oidd.QueryRequest;
import com.rowell.sifa.web.terminal.oidd.QueryRequestObject;
import com.rowell.sifa.web.terminal.oidd.QueryResponse;
import com.rowell.sifa.web.terminal.oidd.QueryResponseObject;
import com.rowell.sifa.web.terminal.oidd.Result_object;

public class BxOiddBean {
	private OiddQueryService oiddQueryService=new OiddQueryServiceLocator();

	public OiddQueryService getOiddQueryService() {
		return oiddQueryService;
	}

	public void setOiddQueryService(OiddQueryService oiddQueryService) {
		this.oiddQueryService = oiddQueryService;
	}

	/**
	 * 获取该号码呼转，开关机状态信息
	 * @param telnos
	 * @return
	 * @throws ServiceException
	 * @throws RemoteException
	 */
	public SysBxOidd oiddByTelno(String telno) throws ServiceException, RemoteException {
		SysBxOidd sysBxOidd = new SysBxOidd();
		sysBxOidd.setTelno(telno);
		
		try {
			QueryRequest request = new QueryRequest();
			QueryRequestObject requestObject = new QueryRequestObject();
			
			//组装请求信息头
			Header[] headList = new Header[4];

			Header head1 = new Header();
			head1.setHead_name(HeaderHead_name.SPId);
			head1.set_value("35144504");
			headList[0] = head1;

			Calendar c = Calendar.getInstance();
			String headerTime = zeroFill(c.get(Calendar.YEAR)) + zeroFill(c.get(Calendar.MONTH)) + zeroFill(c.get(Calendar.DAY_OF_MONTH)) 
					+ zeroFill(c.get(Calendar.HOUR_OF_DAY)) + zeroFill(c.get(Calendar.MINUTE)) + zeroFill(c.get(Calendar.SECOND));
			
			Header head2 = new Header();
			head2.setHead_name(HeaderHead_name.TimeStamp);
			head2.set_value(headerTime);
			headList[1] = head2;

			Header head3 = new Header();
			head3.setHead_name(HeaderHead_name.ProductId);
			head3.set_value("105");
			headList[2] = head3;

			Header head4 = new Header();
			head4.setHead_name(HeaderHead_name.OA);
			head4.set_value("");
			headList[3] = head4;

			//组装请求信息内容
			Body_object bodyObject = new Body_object();
			//内容列表
			Body_attr[] bodyAttrList = new Body_attr[2];
			
			//第一个元素
			Body_attr bodyAttr1 = new Body_attr();
			
			Attr[] attrList1 = new Attr[2];
			Attr attr1 = new Attr();
			attr1.setAttr_name(AttrAttr_name.QueryUserMDN);		//查询发起人
			attr1.set_value("8615057596388");
			attrList1[0] = attr1;
			
			Attr attr2 = new Attr();
			attr2.setAttr_name(AttrAttr_name.BeQueriedUserMDN);	//查询号码
			attr2.set_value("86" + telno);
			attrList1[1] = attr2;
			
			bodyAttr1.setAttr(attrList1);
			bodyAttr1.setType(Body_attrType.Condition);
			bodyAttrList[0] = bodyAttr1;
			//第二个元素
			Body_attr bodyAttr2 = new Body_attr();
			
			Attr[] attrList2 = new Attr[4];
			
			Attr attr3 = new Attr();
			attr3.setAttr_name(AttrAttr_name.ForwardNumber);	//呼转号码
			attr3.set_value("1");
			attrList2[0]=attr3;
			
			Attr attr4 = new Attr();
			attr4.setAttr_name(AttrAttr_name.ForwardStatus);	//呼转状态
			attr4.set_value("1");
			attrList2[1]=attr4;
			
			Attr attr5 = new Attr();
			attr5.setAttr_name(AttrAttr_name.ActiveStatus);		//开关机状态
			attr5.set_value("1");
			attrList2[2]=attr5;
			
			Attr attr6 = new Attr();
			attr6.setAttr_name(AttrAttr_name.AccountStatus);	//用户账户状态
			attr6.set_value("1");
			attrList2[3]=attr6;
			
			bodyAttr2.setType(Body_attrType.RequiredInfoType);
			bodyAttr2.setAttr(attrList2);
			bodyAttrList[1] = bodyAttr2;
			//组装
			bodyObject.setBody_attr(bodyAttrList);
			
			requestObject.setHead_object(headList);
			requestObject.setBody_object(bodyObject);
			request.setObject(requestObject);
			
			// 发送请求
			OiddQuery query = oiddQueryService.getoiddQuerySend();
			QueryResponse response = query.query(request);

			// 解析返回的数据
			QueryResponseObject responseObject = response.getObject();
			
			//解析信息头部
			Header[] headerList = responseObject.getHead_object();
			System.out.println("<head_object>");
			for(int i=0;i<headerList.length;i++){
				Header header = headerList[i];
				System.out.println("<head head_name='"+header.getHead_name().getValue()+"'>"+header.get_value()+"</head>");
			}
			System.out.println("</head_object>");
			
			//解析内容
			System.out.println("<result_object>");
			Result_object resultObject = responseObject.getResult_object();
			Attr[] resultAttrList = resultObject.getResult_attr();
			for(int i=0;i<resultAttrList.length;i++){
				Attr at = resultAttrList[i];
				System.out.println("<attr attr_name='"+at.getAttr_name().getValue()+"'>"+at.get_value()+"</attr>");
			}
			System.out.println("</result_object>");
			
			if (resultAttrList.length >= 5) {
				sysBxOidd.setResultCode(resultAttrList[0].get_value());
				sysBxOidd.setTelno(resultAttrList[1].get_value());
				sysBxOidd.setForwardStatus(resultAttrList[2].get_value());
				sysBxOidd.setForwardNumber(resultAttrList[3].get_value());
				sysBxOidd.setActiveStatus(resultAttrList[4].get_value());
				sysBxOidd.setAccountStatus(resultAttrList[5].get_value());
				sysBxOidd.setSearchTime(new Date());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return sysBxOidd;
	}
	public static void main(String[] args){
		BxOiddBean tb = new BxOiddBean();
		try {
			tb.oiddByTelno("13336942187");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//补零
	public String zeroFill(int number){
		if (number < 10) {
			return "0" + number;
		}
		return "" + number;
	}
}
