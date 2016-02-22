package com.metarnet.systemManage.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.struts2.ServletActionContext;

import com.metarnet.base.util.WebUtils;

/**
 * @Description: 验证码功能action
 * @author: lcgu
 * @date: 2015-10-9 下午09:13:33
 */
public class AuthCodeAction
{
	private HttpServletResponse response = ServletActionContext.getResponse();
	
	private HttpServletRequest request = ServletActionContext.getRequest();

	// 系统生成验证码
	private String authCode;
	
	// 用户输入验证码
	private String captcha;
	
	BufferedImage authCodeImage = null;
	/**
	 * 
	 * @Description: 获取验证码
	 * @author: lcgu
	 * @return
	 * @throws IOException 
	 * @date: 2015-10-9 上午11:16:04
	 */
	public void getAuthCode() throws IOException
	{
		
		int width =50;
		int height = 20;
		 
		// 取得一个4位随机字母数字字符串
		authCode = RandomStringUtils.random(4, true, true);

		// 保存入session,用于与用户的输入进行比较.
		// 注意比较完之后清除session.
		HttpSession session = request.getSession(true);
		session.setAttribute("authCode", authCode);

		response.setContentType("images/jpeg");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		ServletOutputStream out = null;
		try
		{
			 out = response.getOutputStream();
		
			 authCodeImage = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
			 productAuthCodeImage(width,height);
			 ImageIO.write((BufferedImage) authCodeImage, "JPEG", out);

		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
		
	}
	
	/**
	 * @Description: 检验验证码
	 * @author: lcgu
	 * @date: 2015-10-9 下午4:09:48
	 */
	public void checkAuthCode()
	{
		HttpSession session = request.getSession(true);
		if(captcha.equalsIgnoreCase(session.getAttribute("authCode").toString()))
		{
			WebUtils.write("SUCCESS");
		}
	}

	/**
	 * @Description: 生成验证码图片
	 * @author: lcgu
	 * @param height 
	 * @param width 
	 * @return
	 * @date: 2015-10-9 下午2:02:05
	 */
	public void productAuthCodeImage(int width, int height)
	{
		try
		{
			// 设定背景色
			Graphics g = authCodeImage.getGraphics();
			g.setColor(getRandColor(200, 250));
			g.fillRect(0, 0, width, height);

			// 设定字体
			Font authCodeFont = new Font("Times New Roman", Font.BOLD, 17);// 设置字体
			g.setFont(authCodeFont);
			// 随机产生干扰线，使图象中的认证码不易被其它程序探测到
			g.setColor(getRandColor(160, 200));
			
			// 生成随机类
			Random random = new Random();
			for (int i = 0; i < 155; i++)
			{
				int x2 = random.nextInt(width);
				int y2 = random.nextInt(height);
				int x3 = random.nextInt(12);
				int y3 = random.nextInt(12);
				g.drawLine(x2, y2, x2 + x3, y2 + y3);
			}
			g.drawLine(10, 20, 30, 40);

			// 将认证码显示到图象中,图象生效
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(authCode, 5, 16);
			g.dispose();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private Color getRandColor(int fc, int bc)
	{ 
		// 给定范围获得随机颜色
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	public String getCaptcha()
	{
		return captcha;
	}

	public void setCaptcha(String captcha)
	{
		this.captcha = captcha;
	}
	
	
}
