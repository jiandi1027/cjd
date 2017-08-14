package com.rowell.sifa.sys.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

/**   
 * CSV操作(导出和导入)
 *
 */
public class CSVUtils {
    
    /**
     * 导出
     * 
     * @param file csv文件(路径+文件名)，csv文件不存在会自动创建
     * @param dataList 数据
     * @return
     */
    public static boolean exportCsv(File file, List<String> dataList){
        boolean isSucess=false;
        
        FileOutputStream out=null;
        OutputStreamWriter osw=null;
        BufferedWriter bw=null;
        try {
            out = new FileOutputStream(file);
            osw = new OutputStreamWriter(out, "GBK");
            bw =new BufferedWriter(osw);
            if(dataList!=null && !dataList.isEmpty()){
                for(String data : dataList){
                    bw.append(data).append("\r");
                }
            }
            isSucess=true;
        } catch (Exception e) {
            isSucess=false;
        }finally{
            if(bw!=null){
                try {
                    bw.close();
                    bw=null;
                } catch (IOException e) {
                    e.printStackTrace();
                } 
            }
            if(osw!=null){
                try {
                    osw.close();
                    osw=null;
                } catch (IOException e) {
                    e.printStackTrace();
                } 
            }
            if(out!=null){
                try {
                    out.close();
                    out=null;
                } catch (IOException e) {
                    e.printStackTrace();
                } 
            }
        }
        
        return isSucess;
    }
    
    /**
     * 导入
     * 
     * @param file csv文件(路径+文件)
     * @return
     */
    public static List<String> importCsv(File file){
        List<String> dataList=new ArrayList<String>();
        
        BufferedReader br=null;
        try { 
            br=new BufferedReader(new InputStreamReader(new FileInputStream(file),"GBK"));
            String line = ""; 
            while ((line = br.readLine()) != null) { 
                dataList.add(line);
            }
        }catch (Exception e) {
        }finally{
            if(br!=null){
                try {
                    br.close();
                    br=null;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
 
        return dataList;
    }
    
    public static void main(String[] args) {
    	try {
    		String str = "asd";
	    	File file = new File("D:/test.csv");
	    	List<String> strlist = importCsv(file);
	    	for (int i = 0; i < strlist.size(); i++) {
	
				strlist.set(i, strlist.get(i) + "," + OffsetUtil.getMapBarAddr(strlist.get(i).split(",")[3], strlist.get(i).split(",")[4]).replaceAll(",", str));
	
				System.out.println((i+1) + ":" + strlist.get(i));
			}
	    	
	    	boolean isSuccess=CSVUtils.exportCsv(new File("D:/test2.csv"), strlist);
	    	if (isSuccess) {
	    		System.out.println("exp over");
			}
    	} catch (Exception e) {
    		// TODO: handle exception
    		e.printStackTrace();
    	}
    }
}