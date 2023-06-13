package edu.kh.justgo.common.utility;

import java.text.SimpleDateFormat;

public class Util {

	// Cross Site Scripting(XSS) 방지 처리 메서드
	public static String XSSHandling(String content) {
		
		// 스크립트나 마크업 언어에서 기호나 기능을 나타내는 문자를 변경 처리
		// 	& - &amp;
		// 	< - &lt;
		// 	> - &gt;
		// 	" - &quot;
		
		content = content.replaceAll("&", "&amp;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\"", "&quot;");
		
		return content;
	}
	
	// 파일명 변경 메서드
	public static String fileRename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}
}
