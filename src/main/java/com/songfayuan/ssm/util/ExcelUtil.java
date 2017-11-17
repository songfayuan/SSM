package com.songfayuan.ssm.util;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;

public class ExcelUtil {
	public static void write(String fileName, Workbook workbook, HttpServletResponse response) throws Exception {
		response.reset();
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		response.setHeader("Content-Disposition",
				"attachment;filename=" + new String((fileName + ".xlsx").getBytes(), "iso-8859-1"));
		OutputStream outputStream = response.getOutputStream();
		workbook.write(outputStream);
	}
}
