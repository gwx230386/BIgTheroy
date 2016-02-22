package com.metarnet.systemManage.service;

import org.springframework.mail.javamail.MimeMessageHelper;

/**
 * @Description: TODO
 * @author: lcgu
 * @date: 2015-10-29 上午9:46:57 
 */
public interface MailService
{

	public String sendMail(MimeMessageHelper MimeMessageHelper);
}
