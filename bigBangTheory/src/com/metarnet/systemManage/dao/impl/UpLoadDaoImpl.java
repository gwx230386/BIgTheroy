package com.metarnet.systemManage.dao.impl;

import java.util.List;
import java.util.Map;

import com.metarnet.base.dao.impl.JdbcDataDaoImpl;
import com.metarnet.systemManage.bean.AttachmentBean;
import com.metarnet.systemManage.dao.UpLoadDao;

/**
 * @Description: 上传dao
 * @author: lcgu
 * @date: 2013-12-3 上午11:38:45
 */
public class UpLoadDaoImpl extends JdbcDataDaoImpl implements UpLoadDao
{

	/**
	 * @Description: 添加上传附件信息
	 * @author: lcgu
	 * @param attachmentBean
	 * @return
	 * @date: 2013-12-3 上午11:42:09
	 */
	public String addAttachment(AttachmentBean attachmentBean)
	{
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into jbpm_resource_uploadattachment (id,processInstance,fileName,uploadname,uploadsize,uploadtime) values(");
		sql.append(" '" + attachmentBean.getId() + "',");
		sql.append(" '" + attachmentBean.getProcessInstance() + "',");
		sql.append(" '" + attachmentBean.getFileName() + "',");
		sql.append(" '" + attachmentBean.getUploadName() + "',");
		sql.append(" '" + attachmentBean.getUploadSize() + "',");
		sql.append(" '" + attachmentBean.getUploadTime() + "')");
		return modify(sql.toString(), false);
	}

	/**
	 * @Description: 获取某个流程实例的附件信息
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2013-12-3 下午12:55:58
	 */
	public List<Map<String, String>> getAttachmentList(String id)
	{

		StringBuffer sql = new StringBuffer();
		sql.append(" select id,processInstance,fileName,uploadname, uploadsize, uploadtime from jbpm_resource_uploadattachment where processinstance like'%"
				+ id + "%'");

		return queryForList(sql.toString());
	}

	/**
	 * @Description: 获取文件信息
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2013-12-3 下午02:47:03
	 */
	public List<Map<String, String>> getAttachmentById(String id)
	{

		StringBuffer sql = new StringBuffer();
		sql.append(" select * from jbpm_resource_uploadattachment where id ='"
				+ id + "'");
		return queryForList(sql.toString());
	}

	/**
	 * @Description: 删除附件
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2013-12-4 上午10:02:10
	 */
	public String deleteAttachment(String id)
	{

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from jbpm_resource_uploadattachment where id ='"
				+ id + "'");
		return modify(sql.toString(), false);
	}

}
