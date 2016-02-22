package com.metarnet.systemManage.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.math.RandomUtils;

/**
 * @Description: 数字常用类
 * @author: lcgu
 * @date: 2015-10-23 上午10:38:11 
 */
public class NumberUtil
{

    /**
     * 将Date格式化成符合默认格式的字符串
     * 
     * @param date
     * @return 返回样例:2012-03-29 14:32:23
     */
    public static String getRandomKey() {

        return DateUtil.formatDayTime(new Date())+productRandom(4);
    }
    
 
    /**
     * @Description: 生存随机数
     * @author: lcgu
     * @return
     * @date: 2015-10-23 上午10:40:25
     */
    public static String productRandom(int number)
    {
    	return RandomStringUtils.randomNumeric(number);  
    }
 }
