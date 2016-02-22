package com.metarnet.systemManage.util;

import java.io.UnsupportedEncodingException;

/**
 * @Description: 编码util
 * @author: lcgu
 * @date: 2015-12-30 上午9:18:50 
 */
public class CodeUtil
{

	/**@Description: 
	 * @author: lcgu
	 * @param string
	 * @return
	 * @date: 2015-12-30 上午9:21:32 
	 */
	public static String encode(String url)
	{
		try
		{
			return java.net.URLEncoder.encode(url,   "utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			return url;
		}
	}

	/**@Description: 
	 * @author: lcgu
	 * @param string
	 * @return
	 * @date: 2015-12-30 上午9:21:32 
	 */
	public static String decode(String url)
	{
		try
		{
			return  java.net.URLDecoder.decode(url,   "utf-8");
		}
		catch (UnsupportedEncodingException e)
		{
			return url;
		}
	}

	
}
