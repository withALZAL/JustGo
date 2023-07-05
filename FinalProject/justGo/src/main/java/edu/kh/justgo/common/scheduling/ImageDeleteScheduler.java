//package edu.kh.justgo.common.scheduling;
//
//import java.io.File;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
//import javax.servlet.ServletContext;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import edu.kh.justgo.board.model.service.WritingService;
//
//// DB와 서버 불일치 이미지 삭제를 위한 스케줄러
//@Component
//public class ImageDeleteScheduler {
////	
////	@Autowired
////	private ServletContext servletContext;
////	
////	@Autowired
////	private WritingService service;
////	
//////	@Scheduled(cron = "0 0 * * * * *")
//////	@Scheduled(cron = "0,30 * * * * *")
////	@Scheduled(fixedDelay = 10000)
////	public void deleteDummyImage() {
////		System.out.println("-----게시판 DB와 서버 불일치 파일 제거-----");
////		
////		
////		// 서버에 저장된 memberImage 아래 모든 파일 목록 조회(for문 돌리기)
////		String filePath = servletContext.getRealPath("/resources/images/memberImage");
////		System.out.println("filePath:"+ filePath);
////		File path = new File(filePath);
////		System.out.println("path:"+path);
////		File[] imageArr = path.listFiles();
////		List<File> serverImageList = Arrays.asList(imageArr); // imageArr: 배열
////		System.out.println("중간 테스트: "+serverImageList); // 배열?
////		
////		int[] memberNos = new int[serverImageList.size()];
////
//////		for(int i=0; i < imageArr.length; i++) {
//////			System.out.println("너 배열 맞잖아?"+imageArr[i]);
//////		}
//		
////		for (int i=0; i < imageArr.length; i++) {
////		    String filePath = imageArr[i];
////		    // 파일 경로에서 숫자 부분 추출
////		    String numberString = filePath.substring(filePath.lastIndexOf("/"));
////		    // 숫자 부분을 정수로 변환하여 배열에 저장
////		    memberNumbers[i] = Integer.parseInt(numberString);
////		}
////
////		// 결과 출력
////		for (int number : memberNumbers) {
////		    System.out.println(number);
////		}
//		
////	}
//	
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		
////	@Scheduled(cron = "0,30 * * * * *") // 매분 0초, 30초마다 실행
//	@Scheduled(cron = "0 0 * * * * *") // 매 정시마다 실행
//	public void deleteDummyImage() {
//		
//		
//		
//		
//		
//		
//		
////	@Scheduled(cron = "0,30 * * * * *") // 매분 0초, 30초마다 실행
////	@Scheduled(cron = "0 0 * * * * *") // 매 정시마다 실행
////	public void deleteDummyImage() {
////		
////		System.out.println("-----게시판 DB와 서버 불일치 파일 제거-----");
////		
////		// 서버에 저장된 memberImage 아래 모든 파일 목록 조회
////		String filePath = servletContext.getRealPath("/resources/images/memberImage");
////
////		// filePath에 저장된 모든 파일 목록 읽어오기
////		File path = new File(filePath);
////		File[] imageArr = path.listFiles();
////		
////		// 배열을 list로 변환
////		List<File> serverImageList = Arrays.asList(imageArr);
////		System.out.println("중간 테스트: "+serverImageList);
////		
////		// DB 파일 목록 조회
////		List<String> dbImageList = service.selectImageList();
////		
////		// 서버에 파일 목록이 있을 경우에 비교 시작
////		if(!serverImageList.isEmpty()) {
////			
////			// 서버 파일 목록 순차 접근
////			for(File server : serverImageList) {
////				
////				// 서버에 존재하는 파일이 DB에 없다면 삭제
////				String[] temp = server.toString().split("/");
////				String s = temp[temp.length - 1];
////				
////				System.out.println(server.getName());
////				
////				// List.indexOf(객체): 객체에 List가 있다면 해당 인덱스 반환, 없으면 -1 반환
////				if(dbImageList.indexOf(server.getName()) == -1) { // 서버 파일 이름에 있는 게 db 파일 목록에 없는 경우
////					
////					System.out.println(server.getName() + "삭제!!");
////					server.delete(); // 삭제
////				}
////			} // for문 종료
////			System.out.println("-----게시판 DB와 서버 불일치 파일 제거 완료-----");
////		}
////	}
//}
