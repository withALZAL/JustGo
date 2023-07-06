package edu.kh.justgo.common.scheduling;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.justgo.board.model.service.WritingService;

// DB와 서버 불일치 이미지 삭제를 위한 스케줄러
@Component
public class ImageDeleteScheduler {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private WritingService service;

//	@Scheduled(fixedDelay = 10000)
//	public void test() {
//		System.out.println("10초마다 출력됩니다.");
//	}
//	
//	@Scheduled(cron = "0,30 * * * * *")
//	public void test2() {
//		System.out.println("0초, 30초마다 출력됩니다.");
//	}

	@Scheduled(cron = "0,30 * * * * * ") // 1시간마다 //cron 방식은 6개의 필드로 구성하기 때문에 7개 작성 X
	public void deleteDummyImage() {
		System.out.println("-----게시판 DB와 서버 불일치 파일 제거-----");
                 
		// 1. 서버에 저장된 memberImage 아래 모든 파일 목록 조회(for문 돌리기)
		// application 객체를 이용해서
		// /resources/images/memberImage의 실제 서버 경로를 얻어옴
		String filePath = servletContext.getRealPath("/resources/images/memberImage");
		System.out.println("filePath:" + filePath);

		// 2. filePath에 저장된 모든 파일 목록 읽어오기
		File path = new File(filePath);
		System.out.println("path : " + path);
		File[] folderArr = path.listFiles();

		// 배열 -> List로 변환
//		List<File> memberFolderList = Arrays.asList(imageArr); // imageArr: 배열
//		System.out.println("중간 테스트 : " + memberFolderList);
		// 이미지 경로의 memberNos (memberNo) 뽑아내기 배열, List : 여러개의 데이터를 묶어져 있는 것 차이점 : 배열의 향상된 형태가 list
		// 것이 List

		int[] memberNos = new int[folderArr.length];
//		for (int i = 0; i < folderArr.length; i++) {
//			System.out.println("배열 맞니 ?" + folderArr[i]);
//		}

		for (int i = 0; i < folderArr.length; i++) {
			// filePath2의 모든 이미지의 폴더 읽어오기
			String filePath2 = folderArr[i].getPath();
			// 파일 경로에서 숫자 부분 추출
			String numberString = filePath2.substring(filePath2.lastIndexOf("\\") + 1);
			System.out.println("numberString : " + numberString);
			if (!numberString.isEmpty()) { // 빈 문자열인 경우에 예외처리를 추가
				memberNos[i] = Integer.parseInt(numberString); // parseInt는 "1,2,3" 숫자 밖에 있는 쌍따옴표을 없애고 int 형식으로 바꾸겠다
			}
			// 숫자 부분을 정수로 변환하여 배열에 저장
			memberNos[i] = Integer.parseInt(numberString);
		}

		// server에 있는 이미지 경로 List로 묶기
		List<String> serverImageList = new ArrayList<String>();

		// memberNos의 있는 int타입의 memberNO 을 꺼내겠다.
		for (int memberNo : memberNos) {
			String realPath = servletContext.getRealPath("/resources/images/memberImage/" + memberNo);

			File folder = new File(realPath); // server에 있는 모든 이미지 경로 읽어오기 
			File[] imageArr = folder.listFiles(); // server에 있는 모든 이미지 경로 -> File 배열(imageArr)에 묶기
			
			for(File image : imageArr) { // server에 모든 이미지를 file에 있는 image 하나로 꺼내오기
				serverImageList.add("/resources/images/memberImage/" + memberNo + "/" + image.getName());
				// serverImageList에 db에 있는 이미지 목록 이름과 같게 만든 이미지 추가
			}
		}

		// DB 파일 목록 조회 -> service에 있는 selectImageList 불러오기
		List<String> dbImageList = service.selectImageList();

		// 서버 파일 목록에 이미지가 있을 경우 비교
		if (!serverImageList.isEmpty()) {

			// 서버 파일 목록 순차 접근
			for (String server : serverImageList) {

				// 서버에 존재하는 파일이 DB에 없다면 삭제 -> 이미 잘라낸 상태로 serverImageList 에 추가했기 떄문에 잘라낼 필요가 없음
//				String[] temp = server.toString().split("/");
//				String fileName = temp[temp.length - 1];

				System.out.println(server);

				// DB 파일 목록에 server 해당 이미지가 있지 않은 경우
				if (!dbImageList.contains(server)) {
					System.out.println(server + " 삭제!!");

					// 파일 삭제 로직
					
					File fileToDelete = new File(servletContext.getRealPath(server)); // file 객체를 만들어 server에 있는 이미지경로 얻어오기 
					
					if(fileToDelete.exists()) { // server 이미지가 실제로 존재하는 경우에만 삭제
						if(fileToDelete.delete()) {
							System.out.println("파일 삭제:" + server);
						}else {
							System.out.println("파일 삭제 실패 : "+ server);
						}
					}
					

				}

			}// for문 종료
			System.out.println("-----게시판 DB와 서버 불일치 파일 제거 완료-----");
		}
	}
}



////	@Scheduled(cron = "0,30 * * * * *") // 매분 0초, 30초마다 실행
//	@Scheduled(cron = "0 0 * * * * *") // 매 정시마다 실행
//	public void deleteDummyImage() {
//		
//		System.out.println("-----게시판 DB와 서버 불일치 파일 제거-----");
//		
//		// 서버에 저장된 memberImage 아래 모든 파일 목록 조회
//		String filePath = servletContext.getRealPath("/resources/images/memberImage");
//
//		// filePath에 저장된 모든 파일 목록 읽어오기
//		File path = new File(filePath);
//		File[] imageArr = path.listFiles();
//		
//		// 배열을 list로 변환
//		List<File> serverImageList = Arrays.asList(imageArr);
//		System.out.println("중간 테스트: "+serverImageList);
//		
//		// DB 파일 목록 조회
//		List<String> dbImageList = service.selectImageList();
//		
//		// 서버에 파일 목록이 있을 경우에 비교 시작
//		if(!serverImageList.isEmpty()) {
//			
//			// 서버 파일 목록 순차 접근
//			for(File server : serverImageList) {
//				
//				// 서버에 존재하는 파일이 DB에 없다면 삭제
//				String[] temp = server.toString().split("/");
//				String s = temp[temp.length - 1];
//				
//				System.out.println(server.getName());
//				
//				// List.indexOf(객체): 객체에 List가 있다면 해당 인덱스 반환, 없으면 -1 반환
//				if(dbImageList.indexOf(server.getName()) == -1) { // 서버 파일 이름에 있는 게 db 파일 목록에 없는 경우
//					
//					System.out.println(server.getName() + "삭제!!");
//					server.delete(); // 삭제
//				}
//			} // for문 종료
//			System.out.println("-----게시판 DB와 서버 불일치 파일 제거 완료-----");
//		}
//	}
