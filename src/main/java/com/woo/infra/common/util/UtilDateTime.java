package com.woo.infra.common.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UtilDateTime {

	public static String nowString () throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return localDateTimeString;
	}

//	public static String today() throws Exception {
//		
//		String nowString = UtilDateTime.nowString();
//			nowString.substring(0,4);
//			nowString.substring(5,7);
//			nowString.substring(8,10);
//		
//		return nowString;
//	}
	
	
}
