package com.rowell.sifa.web.terminal;

public class CreateXML {

	public static String crlf = "\r\n";  	//��������ͻ��з�
	
	//����xml��ͷ�ļ�
	public static String createHeader()
	{
		return "<?xml version=\"1.0\" ?>" + crlf + "<!DOCTYPE REQ SYSTEM \"LOCREQ.DTD\">" +
		crlf + "<REQ>" + crlf;
	}
	
	//����xml��client
	public static String createClient(String clientId, String pwd)
	{
		return "<CLIENT>"+ crlf + "<LCSCLIENTID>" + clientId + "</LCSCLIENTID>" + crlf +
		"<PASSWORD>" + pwd + "</PASSWORD>"+ crlf + "</CLIENT>" + crlf;
	}
	
	//����xml�ļ���ORIGINATOR
	public static String createOriginator(String[] cells)
	{
		String  mobileStr1 = "";
		if (cells != null && cells.length > 0) {
			for (int i = 0; i < cells.length; i++) {
				if (cells[i] != null && cells[i].length() > 0) {
					mobileStr1 +="<ORID>" +cells[i] + "</ORID>" + crlf;
				}
			}
		}
		return "<ORIGINATOR>" + crlf +mobileStr1+
		"<ORID_TYPE>0</ORID_TYPE>" + crlf + "</ORIGINATOR>" + crlf;
	}
	

//	����xml�ļ���ORIGINATOR
	public static String createOriginator_one(String cell)
	{
		return "<ORIGINATOR>" + crlf + "<ORID>" + cell + "</ORID>" + crlf +
		"<ORID_TYPE>0</ORID_TYPE>" + crlf + "</ORIGINATOR>" + crlf;
	}
	
	//����xml�ļ���platform&serviceid
	public static String createPlatForm()
	{
		return "<REQ_PLATFORM>1</REQ_PLATFORM>" + crlf + "<SERVICEID>11111</SERVICEID>" + crlf;
	}

	//����xml_LIR�ļ������ļ�
	public static String createLIR_Body(String[] cells)
	{
		String  mobileStr1 = "", mobileStr2 = "";
		if (cells != null && cells.length > 0) {
			for (int i = 0; i < cells.length; i++) {
				if (cells[i] != null && cells[i].length() > 0) {
					mobileStr1 += "<FINDME_INDIC>1</FINDME_INDIC>" + crlf;
					mobileStr2 += "<MSID>" + cells[i] + "</MSID>" + crlf;
				}
			}
		}
		String str = "";
		str += "<LIR>" + crlf;
		str += "<ORIGUSER_ACCESSTYPE>3</ORIGUSER_ACCESSTYPE>" + crlf;
		str += mobileStr1;
		str += "<MSIDS>" + crlf;
		str += mobileStr2;
		str += "<MSID_TYPE>0</MSID_TYPE>" + crlf;
		str += "</MSIDS>" + crlf;
		str += "<POSREQTYPE>3</POSREQTYPE>" + crlf;
		str += "<GEO_INFO>" + crlf;
		str += "<COORD_SYS>LL</COORD_SYS>" + crlf;
		str += "<DATUM>WGS-84</DATUM>" + crlf;
		str += "<LL_FORMAT>D6</LL_FORMAT>" + crlf;
		str += "</GEO_INFO>" + crlf;
		str += "<PQOS>" + crlf;
		str += "<RESP_REQ>DELAY_TOL</RESP_REQ>" + crlf;
		str += "<RESP_TIMER>0010</RESP_TIMER> ";
		str += "<HOR_ACC>800</HOR_ACC>" + crlf;
		str += "<ALT_ACC>800</ALT_ACC>" + crlf;
		str += "</PQOS>" + crlf;
		str += "<PRIO>1</PRIO>" + crlf;
		str += "<REQ_RESULTFORMAT>1</REQ_RESULTFORMAT>" + crlf;
		str += "</LIR>" + crlf;
		str += "</REQ>";
		
		return str;
	}
	

	//����xml_LIR�ļ������ļ�
	public static String createLIR_Body_one(String cell)
	{
		String str = "";
		str += "<LIR>" + crlf;
		str += "<ORIGUSER_ACCESSTYPE>3</ORIGUSER_ACCESSTYPE>" + crlf;
		str += "<FINDME_INDIC>1</FINDME_INDIC>" + crlf;
		str += "<MSIDS>" + crlf;
		str += "<MSID>" + cell + "</MSID>" + crlf;
		str += "<MSID_TYPE>0</MSID_TYPE>" + crlf;
		str += "</MSIDS>" + crlf;
		str += "<POSREQTYPE>3</POSREQTYPE>" + crlf;
		str += "<GEO_INFO>" + crlf;
		str += "<COORD_SYS>LL</COORD_SYS>" + crlf;
		str += "<DATUM>WGS-84</DATUM>" + crlf;
		str += "<LL_FORMAT>D6</LL_FORMAT>" + crlf;
		str += "</GEO_INFO>" + crlf;
		str += "<PQOS>" + crlf;
		str += "<RESP_REQ>DELAY_TOL</RESP_REQ>" + crlf;
		str += "<HOR_ACC>1000</HOR_ACC>" + crlf;
		str += "<ALT_ACC>1000</ALT_ACC>" + crlf;
		str += "</PQOS>" + crlf;
		str += "<PRIO>1</PRIO>" + crlf;
		str += "<REQ_RESULTFORMAT>1</REQ_RESULTFORMAT>" + crlf;
		str += "</LIR>" + crlf;
		str += "</REQ>";
		
		return str;
	}
	
	//���LIR_XML�ļ�
	public static String getLIR_XML(String clientId, String pwd, String[] cell)
	{
		String result = "";
		result += createHeader();
		result += createClient(clientId, pwd);
		result += createOriginator(cell);
		//result += createPlatForm();//2016��6��ʡ���ų���λ���
		result += createLIR_Body(cell);
		return result;
	}
	
	//���LIR_XML�ļ�
	public static String getLIR_XML_ONE(String clientId, String pwd, String cell)
	{
		String result = "";
		result += createHeader();
		result += createClient(clientId, pwd);
		result += createOriginator_one(cell);
		//result += createPlatForm();//2016��6��ʡ���ų���λ���
		result += createLIR_Body_one(cell);
		return result;
	}

}
