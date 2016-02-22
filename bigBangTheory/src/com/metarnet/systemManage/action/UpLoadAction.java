package com.metarnet.systemManage.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.metarnet.base.action.BaseAction;
import com.metarnet.base.util.CommonUtil;
import com.metarnet.base.util.DateUtil;
import com.metarnet.base.util.WebUtils;
import com.metarnet.systemManage.bean.AttachmentBean;
import com.metarnet.systemManage.service.UpLoadService;

/**
 * @Description: 上传Action
 * @author: lcgu
 * @date: 2014-1-10 上午09:49:58
 */
public class UpLoadAction extends BaseAction {

	/**
	 * 上传的文件
	 */
	private File uploadify;

	/**
	 * 上传的文件名称
	 */
	private String uploadifyFileName;
	/**
	 * 上传service
	 */
	private UpLoadService upLoadService;
	
	
	private List<Map<String,String>> uploadList;
	/**
	 * 附件信息bean
	 */
	private AttachmentBean attachmentBean;
	/**
	 * @Description: 上传并发布zip
	 * @author: lcgu
	 * @date: 2014-1-10 上午11:23:20
	 */
	public void upAndReleaseZIP() {

		String fileName = upLoadService.upAndReleaseZIP(uploadify, uploadifyFileName);

		File file = new File(fileName);
		file.delete();
	}
	 /**
     * @Description: 上传附件
     * @author: lcgu
     * @date: 2013-12-3 上午10:36:42
     */
	public void upLoadAttachment(){
		
		String fileSzie = String.valueOf(uploadify.length()/1024)+"KB";
		String fileName =	upLoadService.upLoadAttachment(uploadify,uploadifyFileName);
		
		attachmentBean.setId(CommonUtil.getRandomId());
		attachmentBean.setFileName(uploadifyFileName);
		attachmentBean.setUploadTime(DateUtil.getDate());
		attachmentBean.setUploadName(fileName);
		attachmentBean.setUploadSize(fileSzie);
		
		String str = upLoadService.addAttachment(attachmentBean);
		WebUtils.write(fileName);
	}
	/**
	 * @Description: 下载附件
	 * @author: lcgu
	 * @date: 2013-12-3 下午02:42:41
	 */
	public void downloadAttachment(){
		

		uploadList = upLoadService.getAttachmentById(attachmentBean.getId());
		
		WebUtils.write(JSON.toJSONString(uploadList));
	}		
	/**
	 * @Description: 获取某个流程实例的附件信息
	 * @author: lcgu
	 * @date: 2013-12-3 下午12:51:33
	 */
	public  void getAttachment(){
		

	}
	/**
	 * @Description: 删除附件
	 * @author: lcgu
	 * @date: 2013-12-4 上午09:57:47
	 */
	public void deleteAttachment(){
		
		String str = upLoadService.deleteAttachment(attachmentBean.getId());
	}
	public UpLoadService getUpLoadService() {
		return upLoadService;
	}

	public void setUpLoadService(UpLoadService upLoadService) {
		this.upLoadService = upLoadService;
	}

	public File getUploadify() {
		return uploadify;
	}

	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}

	public String getUploadifyFileName() {
		return uploadifyFileName;
	}

	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}
	public List<Map<String, String>> getUploadList() {
		return uploadList;
	}
	public void setUploadList(List<Map<String, String>> uploadList) {
		this.uploadList = uploadList;
	}
	public AttachmentBean getAttachmentBean() {
		return attachmentBean;
	}
	public void setAttachmentBean(AttachmentBean attachmentBean) {
		this.attachmentBean = attachmentBean;
	}
  
}
