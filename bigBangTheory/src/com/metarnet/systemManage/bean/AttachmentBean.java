package com.metarnet.systemManage.bean;

/**
 * @Description: 附件信息Bean
 * @author: lcgu
 * @date: 2013-12-3 上午11:28:27 
 */
public class AttachmentBean {
   
	private String id;
	
	private String processInstance;
	
	private String fileName;
	
	private String uploadName;
	
	private String uploadTime;
    
	private String uploadSize;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProcessInstance() {
		return processInstance;
	}

	public void setProcessInstance(String processInstance) {
		this.processInstance = processInstance;
	}

	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUploadName() {
		return uploadName;
	}

	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getUploadSize() {
		return uploadSize;
	}

	public void setUploadSize(String uploadSize) {
		this.uploadSize = uploadSize;
	}
	
	
}
