package com.rowell.common.security;

/************************************************
 MD5 算法的Java Bean
 @author:Topcat Tuppin
 Last Modified:10,Mar,2001
 *************************************************/
import java.lang.reflect.Array;
import java.security.MessageDigest;

/*******************************************************************************
 * md5 类实现了RSA Data Security, Inc.在提交给IETF 的RFC1321中的MD5 message-digest 算法。
 ******************************************************************************/

public class MD5 {
	private final static char[] hexDigits = { '0', '1', '2', '3', '4', '5',  
            '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };  
    private static String bytesToHex(byte[] bytes) {  
        StringBuffer sb = new StringBuffer();  
        int t;  
        for (int i = 0; i < 16; i++) {  
            t = bytes[i];  
            if (t < 0)  
                t += 256;  
            sb.append(hexDigits[(t >>> 4)]);  
            sb.append(hexDigits[(t % 16)]);  
        }  
        return sb.toString();  
    }  
    public static String md5(String input) throws Exception {  
        return code(input, 32);  
    }  
    public static String code(String input, int bit) {  
        try {  
            MessageDigest md = MessageDigest.getInstance(System.getProperty(  
                    "MD5.algorithm", "MD5"));  
            if (bit == 16)  
                return bytesToHex(md.digest(input.getBytes("utf-8")))  
                        .substring(8, 24).toLowerCase();  
            return bytesToHex(md.digest(input.getBytes("utf-8"))).toLowerCase();  
        } catch (Exception e) {  
            e.printStackTrace();  
            return null;
        }  
    }  
    public static String md5_3(String b) throws Exception{  
        MessageDigest md = MessageDigest.getInstance(System.getProperty(  
                "MD5.algorithm", "MD5"));  
        byte[] a = md.digest(b.getBytes());  
        a = md.digest(a);  
        a = md.digest(a);  
          
        return bytesToHex(a);  
    }  

	public static void main(String args[]) throws Exception {

		MD5 m = new MD5();
		if (Array.getLength(args) == 0) { // 如果没有参数，执行标准的Test Suite

			System.out.println("MD5 Test suite:");
			System.out.println("MD5(\"\"):" + m.code("888888",16));
			
		}

	}

}
