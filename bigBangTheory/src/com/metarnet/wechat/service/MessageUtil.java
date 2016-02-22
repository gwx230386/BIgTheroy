package com.metarnet.wechat.service;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;

/**
 * @Description: TODO
 * @author: lcgu
 * @date: 2015-11-26 下午1:24:57
 */
public class MessageUtil
{

	public final static String RESP_MESSAGE_TYPE_TEXT = "text";

	public final static String REQ_MESSAGE_TYPE_TEXT = "text";

	public final static String REQ_MESSAGE_TYPE_IMAGE = "image";

	public final static String REQ_MESSAGE_TYPE_VOICE = "voice";

	public final static String REQ_MESSAGE_TYPE_VIDEO = "video";

	public final static String REQ_MESSAGE_TYPE_LOCATION = "location";

	public final static String REQ_MESSAGE_TYPE_LINK = "link";

	public final static String REQ_MESSAGE_TYPE_EVENT = "event";

	public final static String EVENT_TYPE_SUBSCRIBE = "subscribe";

	public final static String EVENT_TYPE_UNSUBSCRIBE = "unsubscribe";

	public final static String EVENT_TYPE_SCAN = "SCAN";

	public final static String EVENT_TYPE_LOCATION = "LOCATION";

	public final static String EVENT_TYPE_CLICK = "CLICK";

	/**
	 * 解析微信发来的请求（XML）
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static Map parseXml(HttpServletRequest request) throws Exception
	{
		// 将解析结果存储在HashMap中
		Map map = new HashMap();

		// 从request中取得输入流
		InputStream inputStream = request.getInputStream();
		// 读取输入流
		SAXReader reader = new SAXReader();
		Document document = reader.read(inputStream);
		// 得到xml根元素
		Element root = document.getRootElement();
		// 得到根元素的所有子节点
		List<Element> elementList = root.elements();

		// 遍历所有子节点
		for (Element e : elementList)
			map.put(e.getName(), e.getText());

		// 释放资源
		inputStream.close();
		inputStream = null;

		return map;
	}

	/**
	 * 文本消息对象转换成xml
	 * 
	 * @param textMessage
	 *            文本消息对象
	 * @return xml
	 */
	public static String messageToXml(WeChatMessage textMessage)
	{
		XStream xstream= new XStream();
		xstream.alias("xml", textMessage.getClass());
		return xstream.toXML(textMessage);
	}

}
