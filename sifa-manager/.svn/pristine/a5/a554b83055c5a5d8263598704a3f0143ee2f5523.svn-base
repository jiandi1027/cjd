package com.rowell.sifa.web.terminal;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import net.sf.json.JSONObject;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import com.rowell.sifa.pojo.terminal.Lnglat;
import com.rowell.sifa.pojo.terminal.Poi;
import com.rowell.sifa.pojo.terminal.TerminalLocation;


public class XmlUtil {

	/**
	 * 创建终端XML
	 * 
	 * @param terminals
	 * @return
	 * @throws IOException
	 */
	public static String createTerminalsXml(List<TerminalLocation> terminals)
			throws IOException {
		// 创建根节点 terminals;
		Element root = new Element("terminals");
		Document doc = new Document(root);

		for (TerminalLocation terminal : terminals) {
			Element elements = new Element("terminal");
			elements.addContent(new Element("MDN").setText(terminal.getMdn()));
			elements.addContent(new Element("tuType").setText(terminal.getTuTpye()));
			root.addContent(elements);
		}

		// 返回终端XML
		return doc2String(doc);
	}

	/**
	 * 创建经纬度XML
	 * 
	 * @param lnglats
	 * @return
	 * @throws IOException
	 */
	public static String createLnglatsXml(List<Lnglat> lnglats)
			throws IOException {
		// 创建根节点 lnglats;
		Element root = new Element("lnglats");
		Document doc = new Document(root);

		for (Lnglat lnglat : lnglats) {
			Element elements = new Element("lnglat");
			elements.addContent(new Element("lng").setText(lnglat.getLng()));
			elements.addContent(new Element("lat").setText(lnglat.getLat()));
			root.addContent(elements);
		}

		// 经纬度XML
		return doc2String(doc);
	}

	/**
	 * 创建兴趣点XML
	 * 
	 * @param pois
	 * @return
	 * @throws IOException
	 */
	public static String createPoisXml(List<Poi> pois) throws IOException {

		// 创建根节点 pois;
		Element root = new Element("pois");
		Document doc = new Document(root);

		for (Poi poi : pois) {
			Element elements = new Element("poi");
			elements.addContent(new Element("name").setText(poi.getName()));
			elements.addContent(new Element("desc").setText(poi.getDesc()));
			elements.addContent(new Element("longitude").setText(poi
					.getLongitude()));
			elements.addContent(new Element("latitude").setText(poi
					.getLatitude()));
			root.addContent(elements);
		}

		// 兴趣点XML
		return doc2String(doc);
	}

	/**
	 * 解析兴趣点XML
	 * @param xml
	 */
	public static List<Poi> parserPoiXml(String xml) {
		List<Poi> list = new ArrayList<Poi>();
		try {

			Document document = string2Doc(xml);
			Element results = document.getRootElement();

			List<Element> pois = results.getChildren();
			for (Element poi : pois) {
				Poi objPoi = new Poi();
				objPoi.setName(poi.getChildTextTrim("name"));
				objPoi.setDesc(poi.getChildTextTrim("desc"));
				objPoi.setLongitude(poi.getChildTextTrim("longitude"));
				objPoi.setLatitude(poi.getChildTextTrim("latitude"));
				list.add(objPoi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static String createWsResXml(String code, String desc)
			throws IOException {
		// 创建根节点 result;
		Element root = new Element("result");
		Document doc = new Document(root);

		Element elements = new Element("code");
		elements.setText(code);
		root.addContent(elements);
		
		elements = new Element("desc");
		elements.setText(desc);
		root.addContent(elements);

		// 返回终端XML
		return doc2String(doc);
	}
	
	/**
	 * 转换Doc为文字列
	 * @param doc
	 * @return
	 * @throws IOException
	 */
	private static String doc2String(Document doc) throws IOException {
		Format format = Format.getPrettyFormat();
		// 设定xml格式UTF-8
		format.setEncoding("UTF-8");
		XMLOutputter xmlout = new XMLOutputter(format);
		ByteArrayOutputStream bo = new ByteArrayOutputStream();
		xmlout.output(doc, new PrintWriter(bo));
		return bo.toString();
	}

	/**
	 * 转换文字列为Doc
	 * @param xmlStr
	 * @return
	 * @throws Exception
	 */
	public static Document string2Doc(String xmlStr) throws Exception {
		java.io.Reader in = new StringReader(xmlStr);
		Document doc = (new SAXBuilder()).build(in);
		return doc;
	}

	/**
	 * 转换Doc为XML
	 * @param doc
	 * @param filePath
	 * @throws Exception
	 */
	public static void doc2XML(Document doc, String filePath) throws Exception {
		Format format = Format.getCompactFormat();
		format.setEncoding("UTF-8"); 
		format.setIndent("    ");

		XMLOutputter outputter = new XMLOutputter(format);
		FileWriter writer = new FileWriter(filePath);
		outputter.output(doc, writer);
		writer.close();
	}

	/**
	 * xml2Json
	 * 
	 * @param stream
	 * @return
	 * @throws Exception
	 */
	public static JSONObject xml2Json(String xml) throws Exception {

		SAXParserFactory factory = SAXParserFactory.newInstance();
		factory.setNamespaceAware(true);
		SAXParser parser = factory.newSAXParser();
		SAXJsonParser handler = new SAXJsonParser();
		parser.parse(new ByteArrayInputStream(xml.getBytes("UTF-8")), handler);
		return handler.getJson();
	}

	public static void main(String[] args) {
		try {

			List<TerminalLocation> terminals = new ArrayList<TerminalLocation>();
			for (int i = 0; i < 5; i++) {
				TerminalLocation terminal = new TerminalLocation();
				terminal.setMdn("13300000000");
				terminal.setTuTpye(String.valueOf(i));
				terminals.add(terminal);
			}
			System.out.println(createTerminalsXml(terminals));

			// 
			List<Poi> pois = new ArrayList<Poi>();
			for (int j = 0; j < 5; j++) {
				Poi poi = new Poi();
				poi.setName("西城区 西外大街");
				poi.setDesc("西外大街");
				poi.setLongitude("116.5467");
				poi.setLatitude("39.9281");
				pois.add(poi);
			}
			System.out.println(createPoisXml(pois));

			pois = parserPoiXml(createPoisXml(pois));
			System.out.println(pois);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}