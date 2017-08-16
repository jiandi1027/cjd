package com.rowell.common.poi.word.utils;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;

public class WordReaderUtil {
	
	public static String readWord(String path){
		 StringBuffer content = new StringBuffer("");// 文档内容
		 try {
			 
			XWPFDocument doc = new XWPFDocument(new FileInputStream(path));  
			List<XWPFParagraph> listParagraphs = doc.getParagraphs();
			if(listParagraphs!=null){
				 for (XWPFParagraph xWPFParagraph:listParagraphs) {// 遍历段落读取数据
					 //Paragraph pp = xWPFParagraph.getText(); 
					 content.append(xWPFParagraph.getText());
				 }
			}
			
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 
		 return content.toString();
	}
	public static String readWordFromFile(File file){
		
		if(file==null){
			return "";
		}
		 StringBuffer content = new StringBuffer("");// 文档内容
		 try {
			XWPFDocument doc = new XWPFDocument(new FileInputStream(file));  
			List<XWPFParagraph> listParagraphs = doc.getParagraphs();
			if(listParagraphs!=null){
				 for (XWPFParagraph xWPFParagraph:listParagraphs) {// 遍历段落读取数据
					 //Paragraph pp = xWPFParagraph.getText(); 
					 content.append(xWPFParagraph.getText());
				 }
			}
			
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		 
		 return content.toString();
	}
	public static void main(String[] args) {
		System.out.println(readWord("C:/Users/xiaoguang/Desktop/系统相关内容/法律法规/成品油市场管理办法.docx"));
	}

}
