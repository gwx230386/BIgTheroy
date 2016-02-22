package com.metarnet.systemManage.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.AttachmentBean;


/**
 * @Description: 上传service实现
 * @author: lcgu
 * @date: 2013-11-29 上午10:23:01 
 */
public interface UpLoadService {

	/**@Description: 上传并发布zip
	 * @author: lcgu
	 * @param uploadify
	 * @param uploadifyFileName
	 * @return
	 * @date: 2014-1-10 上午11:27:56 
	 */
	String upAndReleaseZIP(File uploadify, String uploadifyFileName);

	/**@Description: 上传附件
	 * @author: lcgu
	 * @param uploadify
	 * @param uploadifyFileName
	 * @return
	 * @date: 2014-1-10 下午04:35:42 
	 */
	String upLoadAttachment(File uploadify, String uploadifyFileName);

	/**@Description: 添加附件信息
	 * @author: lcgu
	 * @param attachmentBean
	 * @return
	 * @date: 2014-1-10 下午04:35:46 
	 */
	String addAttachment(AttachmentBean attachmentBean);

	/**@Description: 通过id获取附件信息
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2014-1-10 下午04:35:51 
	 */
	List<Map<String, String>> getAttachmentById(String id);

	/**@Description: 获取流程实例相关附件 
	 * @author: lcgu
	 * @param processInstance
	 * @return
	 * @date: 2014-1-10 下午04:35:56 
	 */
	List<Map<String, String>> getAttachmentList(String processInstance);

	/**@Description: 删除附件
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2014-1-10 下午04:45:51 
	 */
	String deleteAttachment(String id);

	

}
