package com.metarnet.systemManage.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.commons.lang.StringUtils;
/**
 * 
 * @Description: 字符过滤器
 * @author: lcgu
 * @date: 2014-3-10 下午08:18:30
 */
public class CharacterEncodingFilter implements Filter
{
  private String encoding = "UTF-8";
  private boolean enable = false;

  public void destroy()
  {
  }

  public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException
  {
    if (this.enable) {
      arg0.setCharacterEncoding(this.encoding);
    }

    arg2.doFilter(arg0, arg1);
  }

  public void init(FilterConfig config) throws ServletException
  {
    String initEncoding = config.getInitParameter("encoding");
    if (StringUtils.isNotEmpty(initEncoding))
    {
      this.encoding = initEncoding;
    }

    String isEnable = config.getInitParameter("enable");
    if ("true".equals(isEnable))
      this.enable = true;
  }
}