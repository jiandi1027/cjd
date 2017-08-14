package com.rowell.sifa.common.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

public class EntryptUtil {
	// public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1;

	// public static final int SALT_SIZE = 8;
	// /**
	// * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
	// */
	// public static String entryptPassword(String plainPassword) {
	// byte[] salt = Digests.generateSalt(SALT_SIZE);
	// byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt,
	// HASH_INTERATIONS);
	// return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
	// }
	//
	//
	//
	// /**
	// * 验证密码
	// * @param plainPassword 明文密码
	// * @param password 密文密码
	// * @return 验证成功返回true
	// */
	// public static boolean validatePassword(String plainPassword, String
	// password) {
	// byte[] salt = Encodes.decodeHex(password.substring(0,16));
	// byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt,
	// HASH_INTERATIONS);
	// return
	// password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
	// }
	public static String entryptPassword(String plainPassword, String salt) {
		// 构造方法中：
		// 第一个参数：明文，原始密码
		// 第二个参数：盐，通过使用随机数
		// 第三个参数：散列的次数，比如散列两次，相当 于md5(md5(''))
		Md5Hash md5Hash = new Md5Hash(plainPassword, salt, HASH_INTERATIONS);
		return md5Hash.toString();
	}
	
	public static String entryptPassword(String plainPassword) {
		// 构造方法中：
		// 第一个参数：明文，原始密码
		// 第二个参数：盐，通过使用随机数
		// 第三个参数：散列的次数，比如散列两次，相当 于md5(md5(''))
		Md5Hash md5Hash = new Md5Hash(plainPassword, null,HASH_INTERATIONS);
		return md5Hash.toString();
	}
	
	public static boolean validatePassword(String plainPassword, String
			 password,String salt) {
		Md5Hash md5Hash = new Md5Hash(plainPassword, salt, HASH_INTERATIONS);
		
		return password.equals(md5Hash.toString());
	}
	
	public static void main(String[] args) {
		System.out.println(entryptPassword("888888"));
	}

}
