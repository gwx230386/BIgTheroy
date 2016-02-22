package com.metarnet.systemManage.util;

import com.metarnet.base.action.CommandContext;
import java.io.IOException;
import java.util.Map;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommandContextFilter
  implements Filter
{
  protected FilterConfig filterConfig = null;

  public void init(FilterConfig filterConfig) throws ServletException
  {
    this.filterConfig = filterConfig;
  }

  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
    throws IOException, ServletException
  {
    try
    {
      HttpServletRequest request = (HttpServletRequest)req;
      HttpServletResponse response = (HttpServletResponse)res;
      
      //不设置缓存 
      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Pragma", "no-cache");
      response.setDateHeader("Expires", -1);
      
      CommandContext.setRequest(request);

      CommandContext.setResponse(response);

      String uri = request.getRequestURI();

      Map parameterMap = request.getParameterMap();

      CommandContext.setSearchURL(uri);

      CommandContext.setSearchParam(parameterMap);

      chain.doFilter(req, res);
    }
    finally
    {
      CommandContext.close();
    }
  }

  public void destroy()
  {
    this.filterConfig = null;
  }
}