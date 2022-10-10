package com.woo.infra.common.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UtilDateTime {

	public static String nowString () throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		return localDateTimeString;
	}

	
}
