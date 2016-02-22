package com.metarnet.systemManage.dao;

import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.AttachmentBean;


/**
 * @Description: 附件信息id
 * @author: lcgu
 * @date: 2013-12-3 上午11:38:59 
 */
public interface UpLoadDao {

	/**@Description: 添加附件相关信息
	 * @author: lcgu
	 * @param attachmentBean
	 * @return
	 * @date: 2014-1-10 下午04:41:06 
	 */
	String addAttachment(AttachmentBean attachmentBean);

	/**@Description: 由id获取附件 信息
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2014-1-10 下午04:42:01 
	 */
	List<Map<String, String>> getAttachmentById(String id);

	/**@Description: 获取流程实例相关附件
	 * @author: lcgu
	 * @param processInstance
	 * @return
	 * @date: 2014-1-10 下午04:44:09 
	 */
	List<Map<String, String>> getAttachmentList(String processInstance);

	/**@Description:  删除附件
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2014-1-10 下午04:46:47 
	 */
	String deleteAttachment(String id);

	
}
