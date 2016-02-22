package com.metarnet.systemManage.util;

import java.util.List;
import java.util.Map;

import com.metarnet.base.action.CommandContext;
import com.metarnet.base.bean.PageBean;
import com.metarnet.base.dao.impl.JdbcDataDaoImpl;

/**
 * @Description: mysql BaseDao
 * @author: lcgu
 * @date: 2014-4-10 下午02:52:51 
 */
public class MysqlBaseDaoImpl extends JdbcDataDaoImpl{
    /**
     * @Description: 分页
     * @author: lcgu
     * @param sql
     * @param params
     * @return
     * @date: 2014-4-10 下午03:01:33
     */
	public List<Map<String, String>> findByPage(String sql, String[] params)
	  {
	    PageBean pageBean = CommandContext.getPageBean();

	    if (pageBean.getTotalRows() == 0)
	    {
	      String totalRowsSql = "select count(1) from (" + sql + ") as total";
	      int totalRows = queryForInt(totalRowsSql, params);
	      pageBean.setTotalRows(totalRows);
	    }

	    int firstIndex = 0;
	    int maxIndex = 0;
	    if (pageBean.getLastIndex() != 0)
	    {
	      firstIndex = pageBean.getStartIndex();
	      maxIndex = pageBean.getLastIndex();
	    }
	    else
	    {
	      firstIndex = pageBean.getStartOfPage(pageBean.getCurrentPage(), pageBean.getPageSize());
	      maxIndex = pageBean.getCurrentPage() * pageBean.getPageSize();
	    }

	    String strSql = "";
	    strSql = "select * from (" + sql + ") as total limit " + firstIndex + "," + pageBean.getPageSize();

	    return queryForList(strSql, params);
	  }

}
