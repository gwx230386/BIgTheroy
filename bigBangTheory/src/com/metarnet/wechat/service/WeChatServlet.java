package com.metarnet.wechat.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * @Description: 微信servlet
 * @author: lcgu
 * @date: 2015-11-24 下午12:06:54
 */
public class WeChatServlet extends HttpServlet
{

	static Logger log = Logger.getLogger(WeChatServlet.class);

	public WeChatServlet()
	{
		super();
	}

	/**
	 * /** 确认请求来自微信服务器
	 * 
	 * @throws IOException
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		
		log.info(request.getParameterMap().toString());

		// 微信加密签名
		String signature = request.getParameter("signature");
		// 时间戳
		String timestamp = request.getParameter("timestamp");
		// 随机数
		String nonce = request.getParameter("nonce");
		// 随机字符串
		String sVerifyEchoStr = request.getParameter("echostr");

		PrintWriter out = null;
		try
		{
			out = response.getWriter();
			// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
			if (SignUtil.checkSignature(signature, timestamp, nonce))
			{
				out.print(sVerifyEchoStr);
			}
		}
		catch (IOException e)
		{
			log.error(e);
		}
        finally
        {
        	log.info(request.getParameterMap().toString());
    		out.close();
        }
		
		/**
		 * String sEchoStr; // 需要返回的明文 PrintWriter out = response.getWriter();
		 * WXBizMsgCrypt wxcpt; try { wxcpt = new WXBizMsgCrypt(sToken,
		 * sEncodingAESKey, sCorpID); sEchoStr = wxcpt.VerifyURL(sVerifyMsgSig,
		 * sVerifyTimeStamp, sVerifyNonce, sVerifyEchoStr); //
		 * 验证URL成功，将sEchoStr返回 out.print(sEchoStr); } catch (AesException e1) {
		 * e1.printStackTrace(); }
		 */
	}

	/**
	 * 处理微信服务器发来的消息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		log.info(request.getParameterMap().toString());

		// 微信加密签名
		String signature = request.getParameter("signature");
		// 时间戳
		String timestamp = request.getParameter("timestamp");
		// 随机数
		String nonce = request.getParameter("nonce");
		PrintWriter out = null;
		String respXml = null;
		try
		{
			out = response.getWriter();
			// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
			//if (SignUtil.checkSignature(signature, timestamp, nonce))
			//{
				// 调用核心服务类接收处理请求
			    respXml = WechatService.processRequest(request);
	            out.print(respXml);
			//}
		}
		catch (IOException e)
		{
			log.error(e);
		}
        finally
        {
        	log.info(respXml);;
    		out.close();
        }
	}
}
