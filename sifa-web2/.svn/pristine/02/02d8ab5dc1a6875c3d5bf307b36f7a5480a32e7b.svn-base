package com.rowell.sifa.web.terminal;

import org.apache.log4j.Logger;

public class LogUtil {

	public static void logError(String error, Class<?> clazz) {
		Logger log = Logger.getLogger(clazz);
		log.error("[" + Thread.currentThread().getId() + "]:\t" + error);
	}

	public static void logError(String error, Class<?> clazz, Exception ex) {
		Logger log = Logger.getLogger(clazz);
		log.error("[" + Thread.currentThread().getId() + "]:\t" + error, ex);
	}

	public static void LogInfo(String info, String prefix, Class<?> clazz) {
		Logger log = Logger.getLogger(clazz);
		log.info("[" + Thread.currentThread().getId() + "--" + prefix + "]:\t" + info);
	}
}