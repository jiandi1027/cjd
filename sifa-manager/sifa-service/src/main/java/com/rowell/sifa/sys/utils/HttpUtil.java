package com.rowell.sifa.sys.utils;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;

import com.rowell.sifa.pojo.terminal.TerActivateReq;
import com.rowell.sifa.pojo.terminal.TerActivateRes;
import com.rowell.sifa.pojo.terminal.TerOrderReq;
import com.rowell.sifa.pojo.terminal.TerOrderRes;
import com.rowell.sifa.pojo.terminal.TerminalItem;

import java.io.IOException;
import java.util.*;

/**
 * Created by pkx on 2017-7-28.
 */
public class HttpUtil {

	/**
	 * Post string.
	 *
	 * @param url
	 *            the url
	 * @param json
	 *            the json
	 * @return the string
	 */
	public static String post(String url, String json) {
		CloseableHttpClient httpclient = HttpClientBuilder.create().build();
		CloseableHttpResponse response = null;
		HttpPost post = new HttpPost(url);
		try {
			post.addHeader(HTTP.CONN_DIRECTIVE, HTTP.CONN_CLOSE);
			post.addHeader(HTTP.CONTENT_TYPE, "application/json");

			StringEntity entity = new StringEntity(json, Consts.UTF_8);
			entity.setContentEncoding(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
			post.setEntity(entity);
			response = httpclient.execute(post);

			HttpEntity httpEntity = response.getEntity();
			ContentType contentType = ContentType.get(httpEntity);
			String charset = contentType != null && contentType.getCharset() != null ? contentType.getCharset().name()
					: "UTF-8";

			String result = EntityUtils.toString(response.getEntity(), charset);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				response.close();
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Post string.
	 *
	 * @param url
	 *            the url
	 * @param params
	 *            the params
	 * @return the string
	 */
	public static String post(String url, HashMap<String, String> params) {
		CloseableHttpClient httpclient = HttpClientBuilder.create().build();
		CloseableHttpResponse response = null;
		HttpPost post = new HttpPost(url);
		try {
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			Iterator iter = params.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				nvps.add(new BasicNameValuePair(entry.getKey().toString(), entry.getValue().toString()));
			}
			post.setEntity(new UrlEncodedFormEntity(nvps));
			response = httpclient.execute(post);

			HttpEntity httpEntity = response.getEntity();
			ContentType contentType = ContentType.get(httpEntity);
			String charset = contentType != null && contentType.getCharset() != null ? contentType.getCharset().name()
					: "UTF-8";
			return EntityUtils.toString(response.getEntity(), charset);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				response.close();
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Get string.
	 *
	 * @param url
	 *            the url
	 * @param params
	 *            the params
	 * @return the string
	 */
	public static String get(String url, HashMap<String, String> params) {
		CloseableHttpClient httpclient = HttpClientBuilder.create().build();
		CloseableHttpResponse response = null;
		try {
			StringBuilder sb = new StringBuilder();
			Iterator iter = params.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				sb.append(entry.getKey());
				sb.append("=");
				sb.append(entry.getValue());
				sb.append("&");
			}
			if (sb.length() > 0) {
				sb.setLength(sb.length() - 1);
				url += "?" + sb.toString();
			}
			HttpGet get = new HttpGet(url);
			response = httpclient.execute(get);
			HttpEntity httpEntity = response.getEntity();
			ContentType contentType = ContentType.get(httpEntity);
			String charset = contentType != null && contentType.getCharset() != null ? contentType.getCharset().name()
					: "UTF-8";
			return EntityUtils.toString(response.getEntity(), charset);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				response.close();
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
//		Order();
//		Activate();
//		Location();
	}

	public static void Order() {
		try {
			TerOrderRes res = new TerOrderRes();
			TerOrderReq req = new TerOrderReq();
			req.setStreamingNo(UUID.randomUUID().toString().replaceAll("-", ""));
			req.setOpFlag("0702");
			req.setTimeStamp(new Date().getTime());
			req.setPackageCode("LZSSFJ");
			req.setEntCode("LZSSFJ");
			req.setIdentifier("e003402785b74e4aa68953e7d510395b");
			
			List<TerminalItem> ters = new ArrayList<TerminalItem>();
			TerminalItem ter = new TerminalItem();
			ter.setTerNum("15057596389");
			ter.setTerName("");
			ter.setTerType("1");
			ters.add(ter);
			req.setTerItems(ters);
			
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(req);
			System.out.println("ter order json:" + json);
			 String url = "http://111.235.156.35:9003/isp/api/terOrder";
			String result = HttpUtil.post(url, json);
			System.out.println("ter order result:" + result);
			
			
			res = mapper.readValue(result, TerOrderRes.class);
			Object object = res.getObjects()[0];
			List<TerminalItem> list = (List<TerminalItem>) object;
			if (list != null) {
				System.out.println("Object[0]:"+list.get(0));
				Map<String, String> map = (Map<String, String>) list.get(0);
				System.out.println("terNum:" + map.get("terNum"));
			}
			System.out.println("Object[1]:" + res.getObjects()[1]);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static void Activate() {
		try {
			TerActivateRes res = new TerActivateRes();
			TerActivateReq req = new TerActivateReq();
			req.setStreamingNo(UUID.randomUUID().toString().replaceAll("-", ""));
			req.setOpFlag("0709");
			req.setTimeStamp(new Date().getTime());
			req.setPackageCode("LZSSFJ");
			req.setFlag("1");
			req.setKey("d261e2d07aa24275b48a722e0897103e");

			List<String> ters = new ArrayList<String>();
			String ter = "15267776466";
			ters.add(ter);
			req.setTerminals(ters);
			
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(req);
			System.out.println("ter activate json:" + json);
			String url = "http://111.235.156.35:9003/isp/api/activate";
			String result = HttpUtil.post(url, json);
			System.out.println("ter activate result:" + result);
			
			
			res = mapper.readValue(result, TerActivateRes.class);
			System.out.println(res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

	public static void Location() {
		try {
			HashMap<String, String> params = new HashMap<>();
			params.put("options", "3");
			
			System.out.println("ter location params:" + params);
			String url = "http://111.235.156.35:58082/location/once/d261e2d07aa24275b48a722e0897103e/15057596388/2";
			String result = HttpUtil.get(url, params);
			System.out.println("ter location result:" + result);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
