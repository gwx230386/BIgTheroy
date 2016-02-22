package com.metarnet.systemManage.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.metarnet.systemManage.bean.AttachmentBean;
import com.metarnet.systemManage.bean.BusinessUtil;
import com.metarnet.systemManage.dao.UpLoadDao;
import com.metarnet.systemManage.service.UpLoadService;


/**
 * @Description: 上传Serivce实现
 * @author: lcgu
 * @date: 2013-11-29 上午10:23:13
 */
public class UpLoadServiceImpl implements UpLoadService {

	private String path;

	/**
	 * 上传Dao
	 */
	private UpLoadDao upLoadDao;
	
	/**@Description: 上传并发布zip
	 * @author: lcgu
	 * @param uploadify
	 * @param uploadifyFileName
	 * @return
	 * @date: 2014-1-10 上午11:28:04 
	 */
	public String upAndReleaseZIP(File uploadify, String uploadifyFileName) {
		
		path = BusinessUtil.path;

		// 文件存储地址
		File upFile = new File(path + "/" + uploadifyFileName);
		uploadify.renameTo(upFile);
		
		return upFile.getAbsolutePath();
	}
	/**@Description: 添加附件相关信息
	 * @author: lcgu
	 * @param attachmentBean
	 * @return
	 * @date: 2014-1-10 下午04:37:28 
	 */
	public String addAttachment(AttachmentBean attachmentBean) {
       
		
		return upLoadDao.addAttachment(attachmentBean);
	}
	
	/**@Description: 由id获取附件 信息
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2014-1-10 下午04:37:28 
	 */
	public List<Map<String, String>> getAttachmentById(String id) {
		return upLoadDao.getAttachmentById(id);
	}
	
	/**@Description: 获取流程实例相关附件
	 * @author: lcgu
	 * @param processInstance
	 * @return
	 * @date: 2014-1-10 下午04:37:28 
	 */
	public List<Map<String, String>> getAttachmentList(String processInstance) {

		return upLoadDao.getAttachmentList(processInstance);
	}
	
	
	/**@Description: 删除附件
	 * @author: lcgu
	 * @param id
	 * @return
	 * @date: 2014-1-10 下午04:46:00 
	 */
	public String deleteAttachment(String id) {
		// TODO Auto-generated method stub
		return upLoadDao.deleteAttachment(id);
	}
	/**@Description: 上传附件
	 * @author: lcgu
	 * @param uploadify
	 * @param uploadifyFileName
	 * @return
	 * @date: 2014-1-10 下午04:37:28 
	 */
	public String upLoadAttachment(File uploadify, String uploadifyFileName) {
		String extName = "";
		String newFileName = "";
		String nowTime = new SimpleDateFormat("yyyymmddHHmmss")
				.format(new Date());
		path = BusinessUtil.path;

		if (uploadifyFileName.lastIndexOf(".") >= 0) {
			extName = uploadifyFileName.substring(uploadifyFileName
					.lastIndexOf("."));
		}
		try {

			newFileName = nowTime + extName;
			File upFile = new File(path + "/attachments/" + newFileName);
			uploadify.renameTo(upFile);

			return newFileName;
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public UpLoadDao getUpLoadDao() {
		return upLoadDao;
	}
	public void setUpLoadDao(UpLoadDao upLoadDao) {
		this.upLoadDao = upLoadDao;
	}
}
