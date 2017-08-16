package com.rowell.common.poi.excel.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import com.rowell.common.utils.DateUtils;

/**
 * <p>
 * Description: Excel 处理公用类
 * </p>
 * Copyright: Copyright (c) 2016 Company: pango
 * 
 * @author marcle
 * @version 1.0 2016-4-17
 */
public class ExcelExportUtil {
	private static final int LEFT = 1;
	private static final int CENTER = 2;
	private static final int RIGHT = 3;

	private Logger log = Logger.getLogger(ExcelExportUtil.class);
	private HSSFWorkbook wb;
	private HSSFFont font;
	HSSFCellStyle style;

	public ExcelExportUtil() {
		wb = new HSSFWorkbook();
		font = wb.createFont();
		font.setFontHeightInPoints((short) 12);
		font.setFontName("Courier New");
		style = wb.createCellStyle();
		style.setFont(font);
		style.setWrapText(true);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setBorderBottom((short) 1);
		style.setBorderLeft((short) 1);
		style.setBorderRight((short) 1);
		style.setBorderTop((short) 1);
		style.setFillBackgroundColor(HSSFColor.BLUE_GREY.index);
	}
	/**
	 * 生成excel的通用模版(Map的情况)
	 * @param boolean 判断是否需要序号列
	 * @param response 响应,设置生成的文件类型,文件头编码方式和文件名,以及输出
	 * @param List<Map<String, Object>> list表的内容，List类型，里面的每个节点是String[]型
	 * @param firstLine 标题字符串数组 String[]
	 * @param sheetName 表名
	 * @param fileName 文件名
	 */
	@SuppressWarnings({"null" })
	public void exportExcelByMap(boolean isSerial,List<Map<String, Object>> list, Map<String, String> firstLine,
			String sheetName) {
		try {
			int i = 0;// row行标
			int startCell=0;
			HSSFSheet sheet = wb.createSheet(sheetName);//表，一个表包含多个行
			
			HSSFFont font = wb.createFont();
			HSSFCellStyle style = wb.createCellStyle();
			//设置表格样式
			setWorkBookStyle(wb, sheet, font, style);

			HSSFRow row;//行，一行包括多个单元格
			HSSFCell cell;//单元格
			row = sheet.createRow(i);//由HSSFSheet生成行
			row.setHeightInPoints(30);
			//生成首行，表头
			createHeaderLine(isSerial, firstLine, row, sheet, style);
			
			Object[] headerKey = firstLine.keySet().toArray();
			//生成所有行的单元格内容
			if (null != list || list.size() > 0) {
				for (int k = 0; k < list.size(); k++) {
					row = sheet.createRow(++i);
					row.setHeightInPoints(25);
					if(isSerial){
						startCell=1;//如果包括序号的则从第二列开始
						cell = row.createCell(0);
						cell.setCellValue(i);
						cell.setCellStyle(style);
					}
					Map<String, Object> obj = list.get(k);
					for(int j=startCell;j < headerKey.length;j++){
						cell = row.createCell(j);
						style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
						fillCellValue(obj.get(headerKey[j]),cell);//设置单元格的值和样式
						cell.setCellStyle(style);
					}
				}
			}
		} catch (Exception ex) {
			log.error(new StringBuffer("[").append(ex.getMessage()).append("]").append(ex.getCause()));
		}
	}
	
	/**
	 * 生成excel的通用模版
	 * @param boolean 判断是否需要序号列
	 * @param response
	 *            响应,设置生成的文件类型,文件头编码方式和文件名,以及输出
	 * @param list
	 *            表的内容，List类型，里面的每个节点是String[]型
	 * @param firstLine
	 *            标题字符串数组 String[]
	 * @param sheetName
	 *            表名
	 */

	@SuppressWarnings("null")
	public void exportExcelByObject(boolean isSerial,List<?> list, Map<String, String> firstLine,
			String sheetName) {
		try {
			int i = 0;// row行标
			int startCell=0;
			HSSFSheet sheet = wb.createSheet(sheetName);//表，一个表包含多个行

			HSSFFont font = wb.createFont();
			HSSFCellStyle style = wb.createCellStyle();
			//设置表格样式
			setWorkBookStyle(wb, sheet, font, style);

			HSSFRow row;//行，一行包括多个单元格
			HSSFCell cell;//单元格
			row = sheet.createRow(i);//由HSSFSheet生成行
			row.setHeightInPoints(30);
			//生成首行，表头
			createHeaderLine(isSerial, firstLine, row, sheet, style);

			Object[] headerKey = firstLine.keySet().toArray();
			//生成所有行的单元格内容
			if (null != list || list.size() > 0) {
				for (int k = 0; k < list.size(); k++) {
					row = sheet.createRow(++i);
					row.setHeightInPoints(25);
					if(isSerial){
						cell = row.createCell(0);
						cell.setCellValue(i);
						cell.setCellStyle(style);
						startCell=1;
					}
					for (int j = startCell; j < headerKey.length; j++) {
						Object obj = PropertyUtils.getProperty(list.get(k), (String)headerKey[j]);
						cell = row.createCell(j);
						
						fillCellValue(obj,cell);//设置单元格的值和样式
						
						cell.setCellStyle(style);
						sheet.setColumnWidth(j, 4000);
					}
				}
			}
		} catch (Exception ex) {
			log.error(new StringBuffer("[").append(ex.getMessage()).append("]").append(ex.getCause()));
		}
	}
	
	/**
	 * 设置表格样式
	 * 
	 * @param wb 表格
	 * @param sheet 表单
	 * @param font 字体
	 * @param style 样式
	 */
	private void setWorkBookStyle(HSSFWorkbook wb, HSSFSheet sheet, HSSFFont font, HSSFCellStyle style){
		font.setFontHeightInPoints((short) 12);
		font.setFontName("Courier New");
		style.setFont(font);
		style.setWrapText(true);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setBorderBottom((short)1);
		style.setBorderLeft((short)1);
		style.setBorderRight((short)1);
		style.setBorderTop((short)1);
		style.setFillBackgroundColor(HSSFColor.BLUE_GREY.index);
	}
	
	/**
	 * 设置表头信息
	 * @param boolean 判断是否需要序号列
	 * @param firstLine 表头信息
	 * @param row 表头行
	 * @param sheet 表单
	 * @param style 样式
	 */
	private void createHeaderLine(boolean isSerial, Map<String, String> firstLine, HSSFRow row, HSSFSheet sheet, HSSFCellStyle style ){
		Object[] headerTitle = firstLine.values().toArray();
		for (int j = 0; j < headerTitle.length; j++) {
			if(isSerial && j == 0){
				continue;
			}
			HSSFCell cell = row.createCell(j);
			cell.setCellStyle(style);
			cell.setCellValue((String)headerTitle[j]);
			sheet.setColumnWidth(j, 4000);
		}
	}
	
	public static ExcelExportUtil getInstance() {
		return new ExcelExportUtil();
	}

	public HSSFSheet createSheet(String sheetName) {
		return wb.createSheet(sheetName);
	}

	/**
	 * 获取单元格样式
	 * 
	 * @param site
	 * @return HSSFCellStyle
	 */
	private HSSFCellStyle getStyle(int site) {
		switch (site) {
		case LEFT:
			style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
			break;
		case CENTER:
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			break;
		case RIGHT:
			style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			break;
		}
		return style;
	}

	/**
	 * 设置表头信息
	 * 
	 * @param isSerial
	 * @param firstLine
	 * @param row
	 * @param sheet
	 */
	public void createHeaderLine(boolean isSerial, List<String> firstLine, HSSFRow row, HSSFSheet sheet) {
		int i = 0;
		for (String firstStr : firstLine) {
			if (isSerial && i == 0) {
				HSSFCell cell = row.createCell(i);
				cell.setCellStyle(this.getStyle(CENTER));
				cell.setCellValue("序号");
				sheet.setColumnWidth(i, 4000);
				i++;
			}
			HSSFCell cell = row.createCell(i);
			cell.setCellStyle(this.getStyle(CENTER));
			cell.setCellValue(firstStr);
			sheet.setColumnWidth(i, 4000);
			i++;
		}
	}

	/**
	 * 设置单元格的值及样式
	 * 
	 * @param obj
	 * @param cell
	 */
	private void fillCellValue(Object obj, HSSFCell cell) {
		if (obj instanceof String) {
			cell.setCellValue((String) obj);
			cell.setCellStyle(this.getStyle(LEFT));
		} else if (obj instanceof Integer) {
			cell.setCellValue((Integer) obj);
			cell.setCellStyle(this.getStyle(CENTER));
		} else if (obj instanceof Double) {
			cell.setCellValue((Double) obj);
			cell.setCellStyle(this.getStyle(CENTER));
		} else if (obj instanceof Date) {
			cell.setCellValue(DateUtils.formatYMD((Date) obj));
			cell.setCellStyle(this.getStyle(CENTER));
		} else if (obj instanceof Long) {
			cell.setCellValue((Long) obj);
			cell.setCellStyle(this.getStyle(CENTER));
		} else {
			if (obj == null) {
				cell.setCellValue("");
				cell.setCellStyle(this.getStyle(CENTER));
			} else {
				cell.setCellValue(String.valueOf(obj));
				cell.setCellStyle(this.getStyle(LEFT));
			}

		}
	}

	/**
	 * 生成EXCEL
	 * 
	 * @param isSerial
	 * @param firstLine
	 * @param contentList
	 */
	public void makeExcel(boolean isSerial, List<String> firstLine, List<List<Object>> contentList) {
		makeExcel(isSerial, firstLine, contentList, "sheet1");
	}

	/**
	 * 记录超过2000条的Excel生成
	 * 
	 * @param isSerial
	 * @param firstLine
	 * @param contentList
	 */
	public void makeLargeExcel(HSSFSheet sheet, List<List<Object>> contentList) {
		try {
			int i = sheet.getLastRowNum();// row行标

			HSSFRow row;// 行，一行包括多个单元格
			HSSFCell cell;// 单元格

			if (contentList != null) {
				for (List<Object> contents : contentList) {
					row = sheet.createRow(++i);
					row.setHeightInPoints(25);

					cell = row.createCell(0);
					cell.setCellValue(i);
					cell.setCellStyle(this.getStyle(CENTER));
					int j = 1;
					for (Object contentItem : contents) {
						cell = row.createCell(j);
						fillCellValue(contentItem, cell);// 设置单元格的值和样式
						j++;
					}
				}
			}
		} catch (Exception ex) {
			log.error(ex.getMessage());
			throw new RuntimeException("error.excelExport.failure");
		}
	}

	/**
	 * 生成EXCEL
	 * 
	 * @param isSerial
	 * @param firstLine
	 * @param contentList
	 * @param sheetName
	 */
	public void makeExcel(boolean isSerial, List<String> firstLine, List<List<Object>> contentList,
			String sheetName) {
		try {
			int i = 0;// row行标
			int startCell = 0;
			HSSFSheet sheet = wb.createSheet(sheetName);// 表，一个表包含多个行

			HSSFRow row;// 行，一行包括多个单元格
			HSSFCell cell;// 单元格
			row = sheet.createRow(i);// 由HSSFSheet生成行
			row.setHeightInPoints(30);
			// 生成首行，表头
			if (firstLine != null) {
				createHeaderLine(isSerial, firstLine, row, sheet);
			}

			if (contentList != null) {
				for (List<Object> contents : contentList) {
					row = sheet.createRow(++i);
					row.setHeightInPoints(25);
					if (isSerial) {
						startCell = 1;// 如果包括序号的则从第二列开始
						cell = row.createCell(0);
						cell.setCellValue(i);
						cell.setCellStyle(this.getStyle(CENTER));
					}
					int j = startCell;
					for (Object contentItem : contents) {
						cell = row.createCell(j);
						fillCellValue(contentItem, cell);// 设置单元格的值和样式
						j++;
					}
				}
			}
		} catch (Exception ex) {
			log.error("");
			throw new RuntimeException("error.excelExport.failure");
		}
	}

	/**
	 * 输出Excel
	 * 
	 * @param os
	 * @throws IOException
	 */
	private void output(OutputStream os) throws IOException {
		try {
			wb.write(os);
			os.flush();
		} catch (Exception ex) {
			log.error("");
			throw new RuntimeException();
		}
	}

	/**
	 * 导出Excel
	 * 
	 * @param response
	 * @param title
	 * @throws IOException
	 */
	public void export(HttpServletResponse response, String title) throws IOException {
		OutputStream os = null;
		try {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition",
					"filename=" + new String((title + ".xls").getBytes("gb2312"), "iso8859-1"));
			os = response.getOutputStream();

			this.output(os);
		} catch (Exception ex) {
			log.error("");
			throw new RuntimeException();
		} finally {
			if (os != null) {
				os.close();
			}
		}
	}

	public static void main(String args[]) {

		try {
			FileOutputStream fileout = new FileOutputStream("/Users/elf_mc/Downloads/testdir/workbook.xls");

			ExcelExportUtil eeu = ExcelExportUtil.getInstance();

			List<String> headList = new ArrayList<String>();
			headList.add("test1");
			headList.add("test2");

			List<List<Object>> contentsList = new ArrayList<List<Object>>();
			List<Object> contentList = new ArrayList<Object>();
			contentList.add("ttt");
			contentList.add(453.2);
			contentsList.add(contentList);

			List<Object> contentList2 = new ArrayList<Object>();
			contentList2.add("ccccc");
			contentList2.add(2342);
			contentsList.add(contentList2);

			eeu.makeExcel(true, headList, contentsList);
			eeu.output(fileout);

			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}