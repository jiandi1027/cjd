package com.rowell.common.poi.excel.utils;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 * <p>
 * Description:excel读取工具类
 * </p>
 * Copyright: Copyright (c) 2016-1-30 Company: pango
 * 
 * @author marcle
 * @version 1.0 2016-1-30 上午10:39:52
 */
public class ExcelUtil {
	private Workbook wb = null;
	private int sheetNumber = 0;

	public static ExcelUtil getInstance(InputStream inp) throws Exception {
		ExcelUtil eu = new ExcelUtil(inp);
		return eu;
	}

	public static ExcelUtil getInstance(InputStream inp, int sheetNumber) throws Exception {
		ExcelUtil eu = new ExcelUtil(inp, sheetNumber);
		return eu;
	}

	public ExcelUtil(InputStream inp) throws InvalidFormatException, IOException {
		wb = WorkbookFactory.create(inp);
	}

	public ExcelUtil(InputStream inp, int sheetNumber) throws InvalidFormatException, IOException {
		wb = WorkbookFactory.create(inp);
		this.sheetNumber = sheetNumber;
	}

	/**
	 * <p>
	 * description:获取工作薄
	 * </p>
	 * 
	 * @return Map
	 */
	public Map<String, String> readerSheet() {
		Map<String, String> sheetList = new LinkedHashMap<String, String>();
		for (int i = 0; i < wb.getNumberOfSheets(); i++) {
			Sheet sheet = wb.getSheetAt(i);
			if (sheet != null) {
				sheetList.put(i + "", sheet.getSheetName());
			}
		}
		return sheetList;
	}

	/**
	 * <p>
	 * description:读取工作薄中的内容
	 * </p>
	 * 
	 * @param isTitle
	 * @return List
	 */
	public List<Map<String, String>> readerContent(boolean isTitle) {
		int columnNum = 0;//列数
		int rowNum = 0;//行数
		int startRow = 0;//起始行
		List<Map<String, String>> excelValues = new ArrayList<Map<String, String>>();

		Sheet sheet = wb.getSheetAt(sheetNumber);
		if (sheet.getRow(0) != null) {
			columnNum = sheet.getRow(0).getLastCellNum() - sheet.getRow(0).getFirstCellNum();
			rowNum = sheet.getLastRowNum() - sheet.getFirstRowNum() + 1;
		}
		if (!isTitle) {
			startRow = 1;
		}
		if (columnNum > 0 && rowNum > 0) {
			for (int i = startRow; i < rowNum; i++) {
				Row row = sheet.getRow(i);
				if (row != null) {
					Map<String, String> rowValues = new LinkedHashMap<String, String>();
					for (int j = 0; j < columnNum; j++) {
						Cell cell = row.getCell(j, Row.CREATE_NULL_AS_BLANK);
						if (cell != null) {
							rowValues.put(j + "", getCellValue(cell));
						}
					}
					//获取每行的内容，判断是否为空 
					String rowContent = "";
					for (Map.Entry<String, String> m : rowValues.entrySet()) {
						rowContent += m.getValue();
					}
					//去掉空行
					if (rowContent.trim().equals("")) {
						continue;
					}
					excelValues.add(rowValues);
					//如果是标题行，取第一行
					if (isTitle) {
						break;
					}
				}
			}
		}
		return excelValues;

	}

	/**
	 * <p>
	 * description:获取单元格中的值
	 * </p>
	 * 
	 * @param cell
	 * @return String
	 */
	private String getCellValue(Cell cell) {
		String value = "";
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_BLANK:
			value = "";
			break;
		case Cell.CELL_TYPE_BOOLEAN:
			value = Boolean.toString(cell.getBooleanCellValue());
			break;
		// 数值
		case Cell.CELL_TYPE_NUMERIC:
			if (DateUtil.isCellDateFormatted(cell)) {
				//System.out.println(cell.getDateCellValue());
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				value = df.format(cell.getDateCellValue());
				//System.out.println(value);
			} else {
				cell.setCellType(Cell.CELL_TYPE_STRING);
				String temp = cell.getStringCellValue();
				// 判断是否包含小数点，如果不含小数点，则以字符串读取，如果含小数点，则转换为Double类型的字符串
				if (temp.indexOf(".") > -1) {
					//value = String.valueOf(new Double(temp)).trim();
					DecimalFormat df = new DecimalFormat("#########################.######");
					value = df.format(temp);
				} else {
					value = temp.trim();
				}
			}
			break;
		case Cell.CELL_TYPE_STRING:
			value = cell.getStringCellValue().trim();
			break;
		case Cell.CELL_TYPE_ERROR:
			value = "";
			break;
		case Cell.CELL_TYPE_FORMULA:
			cell.setCellType(Cell.CELL_TYPE_STRING);
			value = cell.getStringCellValue();
			if (value != null) {
				value = value.replaceAll("#N/A", "").trim();
			}
			break;
		default:
			value = "";
			break;
		}
		return value;
	}

	public static void main(String args[]) throws Exception {
		/*ExcelUtil excelUtil = new ExcelUtil();
		Map<String, String> titles = excelUtil.readerSheet(new FileInputStream(
				"E:\\图书管理系统文档\\外国语学校\\外国语学校学生名单.xlsx"));
		for (Map.Entry<String, String> m : titles.entrySet()) {
			System.out.println(m.getKey() + "---" + m.getValue());
		}
		//		List<Map<String, String>> datas = excelUtil.readerTitle(new FileInputStream("E:\\图书管理系统文档\\外国语学校\\外国语学校学生名单.xlsx"), 0,false);
		//		for(Map<String, String> data:datas){
		//			for (Map.Entry<String, String> m : data.entrySet()) {
		//				System.out.print(m.getValue()+"\t");
		//			}
		//			System.out.println("");
		//		}*/

//		ExcelUtil excelUtil = ExcelUtil.getInstance(new FileInputStream(Constant.FILE_PATH_TEMPLATE
//				+ "04048a89-33d6-41d2-9c8b-3c374286d53a.xls"), 0);
//		List<Map<String, String>> contentList = excelUtil.readerContent(false);
//		//int i = 0;
//		for (Map<String, String> contents : contentList) {
//			//System.out.println(Integer.parseInt(contents.get("6")));
//			//contents.
//			for (String key : contents.keySet()) {
//				System.out.println(key + " " + contents.get(key));
//			}
//			//i++;
//		}
	}

}

